--[[
=====================================================================
** More Ores **
By Calinou, with the help of Nore.

Copyright (c) 2011-2015 Calinou and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
=====================================================================
--]]

local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end

local modpath = minetest.get_modpath("moreores")

dofile(modpath .. "/_config.txt")

-- `mg` support:
if minetest.get_modpath("mg") then
	dofile(modpath .. "/mg.lua")
end

-- Utility functions
-- =================

local default_stone_sounds = default.node_sound_stone_defaults()

local function hoe_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- Check if pointing at a node:
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local under = minetest.get_node(pt.under)
	local pos = {x = pt.under.x, y = pt.under.y + 1, z = pt.under.z}
	local above = minetest.get_node(pos)
	
	-- Return if any of the nodes is not registered:
	if not minetest.registered_nodes[under.name] then return end
	if not minetest.registered_nodes[above.name] then return end
	
	-- Check if the node above the pointed thing is air:
	if above.name ~= "air" then return end
	
	-- Check if pointing at dirt:
	if minetest.get_item_group(under.name, "soil") ~= 1 then return end
	
	-- Turn the node into soil, wear out item and play sound:
	minetest.set_node(pt.under, {name ="farming:soil"})
	minetest.sound_play("default_dig_crumbly", {pos = pt.under, gain = 0.5})
	itemstack:add_wear(65535 / (uses - 1))
	return itemstack
end

local function get_recipe(c, name)
	if name == "sword" then
		return {{c}, {c}, {"group:stick"}}
	end
	if name == "shovel" then
		return {{c}, {"group:stick"}, {"group:stick"}}
	end
	if name == "axe" then
		return {{c, c}, {c, "group:stick"}, {"", "group:stick"}}
	end
	if name == "pick" then
		return {{c, c, c}, {"", "group:stick", ""}, {"", "group:stick", ""}}
	end
	if name == "hoe" then
		return {{c, c}, {"", "group:stick"}, {"", "group:stick"}}
	end
	if name == "block" then
		return {{c, c, c}, {c, c, c}, {c, c, c}}
	end
	if name == "lockedchest" then
		return {{"group:wood", "group:wood", "group:wood"}, {"group:wood", c, "group:wood"}, {"group:wood", "group:wood", "group:wood"}}
	end
end

local function add_ore(modname, description, mineral_name, oredef)
	local img_base = modname .. "_" .. mineral_name
	local toolimg_base = modname .. "_tool_"..mineral_name
	local tool_base = modname .. ":"
	local tool_post = "_" .. mineral_name
	local item_base = tool_base .. mineral_name
	local ingot = item_base .. "_ingot"
	local lump_item = item_base .. "_lump"
	local ingotcraft = ingot

	if oredef.makes.ore then
		minetest.register_node(modname .. ":mineral_" .. mineral_name, {
			description = S("%s Ore"):format(S(description)),
			tiles = {"default_stone.png^" .. modname .. "_mineral_" .. mineral_name .. ".png"},
			groups = {cracky = 3},
			sounds = default_stone_sounds,
			drop = lump_item
		})
	end

	if oredef.makes.block then
		local block_item = item_base .. "_block"
		minetest.register_node(block_item, {
			description = S("%s Block"):format(S(description)),
			tiles = { img_base .. "_block.png" },
			groups = {snappy = 1, bendy = 2, cracky = 1, melty = 2, level= 2},
			sounds = default_stone_sounds
		})
		minetest.register_alias(mineral_name.."_block", block_item)
		if oredef.makes.ingot then
			minetest.register_craft( {
				output = block_item,
				recipe = get_recipe(ingot, "block")
			})
			minetest.register_craft( {
				output = ingot .. " 9",
				recipe = {
					{ block_item }
				}
			})
		end
	end

	if oredef.makes.lump then
		minetest.register_craftitem(lump_item, {
			description = S("%s Lump"):format(S(description)),
			inventory_image = img_base .. "_lump.png",
		})
		minetest.register_alias(mineral_name .. "_lump", lump_item)
		if oredef.makes.ingot then
			minetest.register_craft({
				type = "cooking",
				output = ingot,
				recipe = lump_item
			})
		end
	end

	if oredef.makes.ingot then
		minetest.register_craftitem(ingot, {
			description = S("%s Ingot"):format(S(description)),
			inventory_image = img_base .. "_ingot.png",
		})
		minetest.register_alias(mineral_name .. "_ingot", ingot)
	end
	
	if oredef.makes.chest then
		minetest.register_craft( {
			output = "default:chest_locked",
			recipe = {
				{ingot},
				{"default:chest"}
			}
		})
		minetest.register_craft( {
			output = "default:chest_locked",
			recipe = get_recipe(ingot, "lockedchest")
		})
	end
	
	oredef.oredef.ore_type = "scatter"
	oredef.oredef.ore = modname .. ":mineral_" .. mineral_name
	oredef.oredef.wherein = "default:stone"
	
	minetest.register_ore(oredef.oredef)

	for tool_name, tooldef in pairs(oredef.tools) do
		local tdef = {
			description = "",
			inventory_image = toolimg_base .. tool_name .. ".png",
			tool_capabilities = {
				max_drop_level = 3,
				groupcaps = tooldef
			}
		}
		
		if tool_name == "sword" then
			tdef.tool_capabilities.full_punch_interval = oredef.full_punch_interval
			tdef.tool_capabilities.damage_groups = oredef.damage_groups
			tdef.description = S("%s Sword"):format(S(description))
		end
	
		if tool_name == "pick" then
			tdef.tool_capabilities.full_punch_interval = oredef.full_punch_interval
			tdef.tool_capabilities.damage_groups = oredef.damage_groups
			tdef.description = S("%s Pickaxe"):format(S(description))
		end
		  
		if tool_name == "axe" then
			tdef.tool_capabilities.full_punch_interval = oredef.full_punch_interval
			tdef.tool_capabilities.damage_groups = oredef.damage_groups
			tdef.description = S("%s Axe"):format(S(description))
		end

		if tool_name == "shovel" then
			tdef.full_punch_interval = oredef.full_punch_interval
			tdef.tool_capabilities.damage_groups = oredef.damage_groups
			tdef.description = S("%s Shovel"):format(S(description))
		end
		
		if tool_name == "hoe" then
			tdef.description = S("%s Hoe"):format(S(description))
			local uses = tooldef.uses
			tooldef.uses = nil
			tdef.on_use = function(itemstack, user, pointed_thing)
				return hoe_on_use(itemstack, user, pointed_thing, uses)
			end
		end

		local fulltool_name = tool_base .. tool_name .. tool_post
		minetest.register_tool(fulltool_name, tdef)
		minetest.register_alias(tool_name .. tool_post, fulltool_name)
		if oredef.makes.ingot then
			minetest.register_craft({
				output = fulltool_name,
				recipe = get_recipe(ingot, tool_name)
			})
		end
	end
end

-- Add everything:
local modname = "moreores"

local oredefs = {
	silver = {
		description = "Silver",
		makes = {ore = true, block = true, lump = true, ingot = true, chest = true},
		oredef = {clust_scarcity = moreores_silver_chunk_size * moreores_silver_chunk_size * moreores_silver_chunk_size,
			clust_num_ores = moreores_silver_ore_per_chunk,
			clust_size     = moreores_silver_chunk_size,
			height_min     = moreores_silver_min_depth,
			height_max     = moreores_silver_max_depth
			},
		tools = {
			pick = {
				cracky = {times = {[1] = 2.60, [2] = 1.00, [3] = 0.60}, uses = 100, maxlevel= 1}
			},
			hoe = {
				uses = 300
			},
			shovel = {
				crumbly = {times = {[1] = 1.10, [2] = 0.40, [3] = 0.25}, uses = 100, maxlevel= 1}
			},
			axe = {
				choppy = {times = {[1] = 2.50, [2] = 0.80, [3] = 0.50}, uses = 100, maxlevel= 1},
				fleshy = {times = {[2] = 1.10, [3] = 0.60}, uses = 100, maxlevel= 1}
			},
			sword = {
				fleshy = {times = {[2] = 0.70, [3] = 0.30}, uses = 100, maxlevel= 1},
				snappy = {times = {[2] = 0.70, [3] = 0.30}, uses = 100, maxlevel= 1},
				choppy = {times = {[3] = 0.80}, uses = 100, maxlevel= 0}
			},
		},
		full_punch_interval = 1.0,
		damage_groups = {fleshy = 6},
	},
	tin = {
		description = "Tin",
		makes = {ore = true, block = true, lump = true, ingot = true, chest = false},
		oredef = {clust_scarcity = moreores_tin_chunk_size * moreores_tin_chunk_size * moreores_tin_chunk_size,
			clust_num_ores = moreores_tin_ore_per_chunk,
			clust_size     = moreores_tin_chunk_size,
			height_min     = moreores_tin_min_depth,
			height_max     = moreores_tin_max_depth
			},
		tools = {},
	},
	mithril = {
		description = "Mithril",
		makes = {ore = true, block = true, lump = true, ingot = true, chest = false},
		oredef = {clust_scarcity = moreores_mithril_chunk_size * moreores_mithril_chunk_size * moreores_mithril_chunk_size,
			clust_num_ores = moreores_mithril_ore_per_chunk,
			clust_size     = moreores_mithril_chunk_size,
			height_min     = moreores_mithril_min_depth,
			height_max     = moreores_mithril_max_depth
			},
		tools = {
			pick = {
				cracky = {times = {[1] = 2.25, [2] = 0.55, [3] = 0.35}, uses = 200, maxlevel= 1}
			},
			hoe = {
				uses = 1000
			},
			shovel = {
				crumbly = {times = {[1] = 0.70, [2] = 0.35, [3] = 0.20}, uses = 200, maxlevel= 1}
			},
			axe = {
				choppy = {times = {[1] = 1.75, [2] = 0.45, [3] = 0.45}, uses = 200, maxlevel= 1},
				fleshy = {times = {[2] = 0.95, [3] = 0.30}, uses = 200, maxlevel= 1}
			},
			sword = {
				fleshy = {times = {[2] = 0.65, [3] = 0.25}, uses = 200, maxlevel= 1},
				snappy = {times = {[2] = 0.70, [3] = 0.25}, uses = 200, maxlevel= 1},
				choppy = {times = {[3] = 0.65}, uses = 200, maxlevel= 0}
			}
		},
		full_punch_interval = 0.45,
		damage_groups = {fleshy = 9},
	}
}

for orename,def in pairs(oredefs) do
	add_ore(modname, def.description, orename, def)
end

-- Copper rail (special node):
minetest.register_craft({
	output = "moreores:copper_rail 24",
	recipe = {
		{"default:copper_ingot", "", "default:copper_ingot"},
		{"default:copper_ingot", "group:stick", "default:copper_ingot"},
		{"default:copper_ingot", "", "default:copper_ingot"}
	}
})

-- Bronze has some special cases, because it is made from copper and tin:
minetest.register_craft( {
	type = "shapeless",
	output = "default:bronze_ingot 3",
	recipe = {
		"moreores:tin_ingot",
		"default:copper_ingot",
		"default:copper_ingot",
	}
})

-- Unique node:
minetest.register_node("moreores:copper_rail", {
	description = S("Copper Rail"),
	drawtype = "raillike",
	tiles = {"moreores_copper_rail.png", "moreores_copper_rail_curved.png", "moreores_copper_rail_t_junction.png", "moreores_copper_rail_crossing.png"},
	inventory_image = "moreores_copper_rail.png",
	wield_image = "moreores_copper_rail.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {bendy = 2,snappy = 1,dig_immediate = 2,rail= 1, connect_to_raillike = 1},
	mesecons = {
		effector = {
			action_on = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
			end,

			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
})


if minetest.setting_getbool("log_mods") then
	minetest.log("action", S("[moreores] loaded."))
end
