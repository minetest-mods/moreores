--[[
=====================================================================
** More Ores **
By Calinou, with the help of Nore.

Copyright © 2011-2020 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
=====================================================================
--]]

moreores = {}

local modpath = minetest.get_modpath("moreores")

local S = minetest.get_translator("moreores")
moreores.S = S

dofile(modpath .. "/_config.txt")

-- `mg` mapgen support
if minetest.get_modpath("mg") then
	dofile(modpath .. "/mg.lua")
end

-- `frame` support
local use_frame = minetest.get_modpath("frame")

local is_mcl_core_present = minetest.get_modpath("mcl_core") ~= nil
local is_mcl_sounds_present = minetest.get_modpath("mcl_sounds") ~= nil
local is_mcl_copper_present = minetest.registered_items["mcl_copper:copper_ingot"] ~= nil
local stone_ingrediant = is_mcl_core_present and "mcl_core:stone" or "default:stone"

local copper_ingrediant = is_mcl_core_present and "mcl_copper:copper_ingot" or 'default:copper_ingot'
local default_stone_sounds = nil
local default_metal_sounds = nil

if is_mcl_sounds_present then
default_stone_sounds = mcl_sounds.node_sound_stone_defaults()
default_metal_sounds = mcl_sounds.node_sound_metal_defaults()
else
default_stone_sounds = default.node_sound_stone_defaults()
default_metal_sounds = default.node_sound_metal_defaults()
end


-- Returns the crafting recipe table for a given material and item.
local function get_recipe(material, item)
	if is_mcl_core_present then
		material = material:gsub("default:", "mcl_core:")
	end

	if item == "sword" then
		return {
			{material},
			{material},
			{"group:stick"},
		}
	end
	if item == "shovel" then
		return {
			{material},
			{"group:stick"},
			{"group:stick"},
		}
	end
	if item == "axe" then
		return {
			{material, material},
			{material, "group:stick"},
			{"", "group:stick"},
		}
	end
	if item == "pick" then
		return {
			{material, material, material},
			{"", "group:stick", ""},
			{"", "group:stick", ""},
		}
	end
	if item == "block" then
		return {
			{material, material, material},
			{material, material, material},
			{material, material, material},
		}
	end
	if item == "lockedchest" then
		return {
			{"group:wood", "group:wood", "group:wood"},
			{"group:wood", material, "group:wood"},
			{"group:wood", "group:wood", "group:wood"},
		}
	end
end

local function add_ore(modname, description, mineral_name, oredef, extra_node_def)

	if mineral_name == "copper" and is_mcl_copper_present then
		return
	end

	local img_base = modname .. "_" .. mineral_name
	local toolimg_base = modname .. "_tool_"..mineral_name
	local tool_base = modname .. ":"
	local tool_post = "_" .. mineral_name
	local item_base = tool_base .. mineral_name
	local ingot = item_base .. "_ingot"
	local lump_item = item_base .. "_lump"

	local function merge_tables(t1, t2)
        if t2 then
            for k,v in pairs(t2) do t1[k] = v end
        end
        return t1
    end

	if oredef.makes.ore then
        local node_def_tbl = {
            description = S("@1 Ore", S(description)),
            tiles = {"default_stone.png^" .. modname .. "_mineral_" .. mineral_name .. ".png"},
            groups = {cracky = 2},
            sounds = default_stone_sounds,
            drop = lump_item,
        }
		if extra_node_def then
        	node_def_tbl = merge_tables(node_def_tbl, extra_node_def)
		end
        minetest.register_node(modname .. ":mineral_" .. mineral_name, node_def_tbl)


		if use_frame then
			frame.register(modname .. ":mineral_" .. mineral_name)
		end
	end

	if oredef.makes.block then
		local block_item = item_base .. "_block"
		minetest.register_node(block_item, {
			description = S("@1 Block", S(description)),
			tiles = {img_base .. "_block.png"},
			groups = {snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
			sounds = default_metal_sounds,
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
					{block_item},
				}
			})
		end
		if use_frame then
			frame.register(block_item)
		end
	end

	if oredef.makes.lump then
		minetest.register_craftitem(lump_item, {
			description = S("@1 Lump", S(description)),
			inventory_image = img_base .. "_lump.png",
		})
		minetest.register_alias(mineral_name .. "_lump", lump_item)
		if oredef.makes.ingot then
			minetest.register_craft({
				type = "cooking",
				output = ingot,
				recipe = lump_item,
			})
		end
		if use_frame then
			frame.register(lump_item)
		end
	end

	if oredef.makes.ingot then
		minetest.register_craftitem(ingot, {
			description = S("@1 Ingot", S(description)),
			inventory_image = img_base .. "_ingot.png",
		})
		minetest.register_alias(mineral_name .. "_ingot", ingot)
		if use_frame then
			frame.register(ingot)
		end
	end

	if oredef.makes.chest then
		if not is_mcl_core_present then
		minetest.register_craft( {
			output = "default:chest_locked",
			recipe = {
				{ingot},
				{"default:chest"},
			}
		})
		
		minetest.register_craft( {
			output = "default:chest_locked",
			recipe = get_recipe(ingot, "lockedchest")
		})
	end
	end

	oredef.oredef_high.ore_type = "scatter"
	oredef.oredef_high.ore = modname .. ":mineral_" .. mineral_name
	oredef.oredef_high.wherein = stone_ingrediant

	oredef.oredef.ore_type = "scatter"
	oredef.oredef.ore = modname .. ":mineral_" .. mineral_name
	oredef.oredef.wherein = stone_ingrediant

	oredef.oredef_deep.ore_type = "scatter"
	oredef.oredef_deep.ore = modname .. ":mineral_" .. mineral_name
	oredef.oredef_deep.wherein = stone_ingrediant
	
	minetest.register_ore(oredef.oredef_high)
	minetest.register_ore(oredef.oredef)
	minetest.register_ore(oredef.oredef_deep)

	for tool_name, tooldef in pairs(oredef.tools) do
		local tdef = {
			description = "",
			inventory_image = toolimg_base .. tool_name .. ".png",
			tool_capabilities = {
				max_drop_level = 3,
				groupcaps = tooldef.groupcaps,
				damage_groups = tooldef.damage_groups,
				full_punch_interval = oredef.full_punch_interval,
			},
			sound = {breaks = "default_tool_breaks"},
		}

		if tool_name == "sword" then
			tdef.description = S("@1 Sword", S(description))
			tdef.groups = {sword = 1}
		end

		if tool_name == "pick" then
			tdef.description = S("@1 Pickaxe", S(description))
			tdef.groups = {pickaxe = 1}
		end

		if tool_name == "axe" then
			tdef.description = S("@1 Axe", S(description))
			tdef.groups = {axe = 1}
		end

		if tool_name == "shovel" then
			tdef.description = S("@1 Shovel", S(description))
			tdef.groups = {shovel = 1}
			tdef.wield_image = toolimg_base .. tool_name .. ".png^[transformR90"
		end

		local fulltool_name = tool_base .. tool_name .. tool_post

		if tool_name == "hoe" and minetest.get_modpath("farming") then
			tdef.max_uses = tooldef.max_uses
			tdef.material = ingot
			tdef.description = S("@1 Hoe", S(description))
			farming.register_hoe(fulltool_name, tdef)
		end

		-- Hoe registration is handled above.
		-- There are no crafting recipes for hoes, as they have been
		-- deprecated from Minetest Game:
		-- https://github.com/minetest/minetest_game/commit/9c459e77a
		if tool_name ~= "hoe" then
			minetest.register_tool(fulltool_name, tdef)

			if oredef.makes.ingot then
				minetest.register_craft({
					output = fulltool_name,
					recipe = get_recipe(ingot, tool_name)
				})
			end
		end

		-- Toolranks support
		if minetest.get_modpath("toolranks") then
			minetest.override_item(fulltool_name, {
				original_description = tdef.description,
				description = toolranks.create_description(tdef.description, 0, 1),
				after_use = toolranks.new_afteruse})
		end

		minetest.register_alias(tool_name .. tool_post, fulltool_name)
		if use_frame then
			frame.register(fulltool_name)
		end
	end
end

local oredefs = {
	silver = {
		description = "Silver",
		makes = {ore = true, block = true, lump = true, ingot = true, chest = true},
		oredef_high= {
			clust_scarcity = moreores.silver_chunk_size_high ^ 3,
			clust_num_ores = moreores.silver_ore_per_chunk_high,
			clust_size = moreores.silver_clust_size_high,
			y_min = moreores.silver_min_depth_high,
			y_max = moreores.silver_max_depth_high,
		},
		oredef = {
			clust_scarcity = moreores.silver_chunk_size ^ 3,
			clust_num_ores = moreores.silver_ore_per_chunk,
			clust_size = moreores.silver_clust_size,
			y_min = moreores.silver_min_depth,
			y_max = moreores.silver_max_depth,
		},
		oredef_deep = {
			clust_scarcity = moreores.silver_chunk_size_deep ^ 3,
			clust_num_ores = moreores.silver_ore_per_chunk_deep,
			clust_size = moreores.silver_clust_size_deep,
			y_min = moreores.silver_min_depth_deep,
			y_max = moreores.silver_max_depth_deep,
		},
		tools = {
			pick = {
				groupcaps = {
					cracky = {times = {[1] = 2.60, [2] = 1.00, [3] = 0.60}, uses = 100, maxlevel = 1},
				},
				damage_groups = {fleshy = 4},
			},
			hoe = {
				max_uses = 300,
			},
			shovel = {
				groupcaps = {
					crumbly = {times = {[1] = 1.10, [2] = 0.40, [3] = 0.25}, uses = 100, maxlevel = 1},
				},
				damage_groups = {fleshy = 3},
			},
			axe = {
				groupcaps = {
					choppy = {times = {[1] = 2.50, [2] = 0.80, [3] = 0.50}, uses = 100, maxlevel = 1},
					fleshy = {times = {[2] = 1.10, [3] = 0.60}, uses = 100, maxlevel = 1},
				},
				damage_groups = {fleshy = 5},
			},
			sword = {
				groupcaps = {
					fleshy = {times = {[2] = 0.70, [3] = 0.30}, uses = 100, maxlevel = 1},
					snappy = {times = {[1] = 1.70, [2] = 0.70, [3] = 0.30}, uses = 100, maxlevel = 1},
					choppy = {times = {[3] = 0.80}, uses = 100, maxlevel = 0},
				},
				damage_groups = {fleshy = 6},
			},
		},
		full_punch_interval = 1.0,
		extra_node_def = {
			_mcl_hardness = 3,
			_mcl_blast_resistance =  3,
			_mcl_hardness =  4,
			_mcl_silk_touch_drop = true,
			groups = {pickaxey = 4}
		}
	},
	mithril = {
		description = "Mithril",
		makes = {ore = true, block = true, lump = true, ingot = true, chest = false},
		oredef_high = {
			clust_scarcity = moreores.mithril_chunk_size_high ^ 3,
			clust_num_ores = moreores.mithril_ore_per_chunk_high,
			clust_size = moreores.mithril_clust_size_high,
			y_min = moreores.mithril_min_depth_high,
			y_max = moreores.mithril_max_depth_high,
		},
		oredef = {
			clust_scarcity = moreores.mithril_chunk_size ^ 3,
			clust_num_ores = moreores.mithril_ore_per_chunk,
			clust_size = moreores.mithril_clust_size,
			y_min = moreores.mithril_min_depth,
			y_max = moreores.mithril_max_depth,
		},
		oredef_deep = {
			clust_scarcity = moreores.mithril_chunk_size_deep ^ 3,
			clust_num_ores = moreores.mithril_ore_per_chunk_deep,
			clust_size = moreores.mithril_clust_size_deep,
			y_min = moreores.mithril_min_depth_deep,
			y_max = moreores.mithril_max_depth_deep,
		},
		tools = {
			pick = {
				groupcaps = {
					cracky = {times = {[1] = 2.25, [2] = 0.55, [3] = 0.35}, uses = 200, maxlevel = 3},
				},
				damage_groups = {fleshy = 6},
			},
			hoe = {
				max_uses = 1000,
			},
			shovel = {
				groupcaps = {
					crumbly = {times = {[1] = 0.70, [2] = 0.35, [3] = 0.20}, uses = 200, maxlevel = 3},
				},
				damage_groups = {fleshy = 5},
			},
			axe = {
				groupcaps = {
					choppy = {times = {[1] = 1.75, [2] = 0.45, [3] = 0.45}, uses = 200, maxlevel = 3},
					fleshy = {times = {[2] = 0.95, [3] = 0.30}, uses = 200, maxlevel = 2},
				},
				damage_groups = {fleshy = 8},
			},
			sword = {
				groupcaps = {
					fleshy = {times = {[2] = 0.65, [3] = 0.25}, uses = 200, maxlevel = 2},
					snappy = {times = {[1] = 1.70, [2] = 0.70, [3] = 0.25}, uses = 200, maxlevel = 3},
					choppy = {times = {[3] = 0.65}, uses = 200, maxlevel = 0},
				},
				damage_groups = {fleshy = 10},
			},
		},
		full_punch_interval = 0.45,
		extra_node_def = {
			_mcl_hardness = 3,
			_mcl_blast_resistance =  3,
			_mcl_hardness =  5,
			_mcl_silk_touch_drop = true,
			groups = {pickaxey = 5}
		},
	}
}

-- If tin is available in the `default` mod, don't register More Ores' variant of tin
local default_tin
if minetest.registered_items["default:tin_ingot"] then
	default_tin = true
else
	default_tin = false
end

if default_tin then
	minetest.register_alias("moreores:mineral_tin", "default:stone_with_tin")
	minetest.register_alias("moreores:tin_lump", "default:tin_lump")
	minetest.register_alias("moreores:tin_ingot", "default:tin_ingot")
	minetest.register_alias("moreores:tin_block", "default:tinblock")
else
	oredefs.tin = {
		description = "Tin",
		makes = {ore = true, block = true, lump = true, ingot = true, chest = false},
		oredef_high = {
			clust_scarcity = moreores.tin_chunk_size_high ^ 3,
			clust_num_ores = moreores.tin_ore_per_chunk_high,
			clust_size = moreores.tin_clust_size_high,
			y_min = moreores.tin_min_depth_high,
			y_max = moreores.tin_max_depth_high,
		},
		oredef = {
			clust_scarcity = moreores.tin_chunk_size ^ 3,
			clust_num_ores = moreores.tin_ore_per_chunk,
			clust_size = moreores.tin_clust_size,
			y_min = moreores.tin_min_depth,
			y_max = moreores.tin_max_depth,
		},
		oredef_deep = {
			clust_scarcity = moreores.tin_chunk_size_deep ^ 3,
			clust_num_ores = moreores.tin_ore_per_chunk_deep,
			clust_size = moreores.tin_clust_size_deep,
			y_min = moreores.tin_min_depth_deep,
			y_max = moreores.tin_max_depth_deep,
		},
		tools = {},
		extra_node_def = {
			_mcl_hardness = 3,
			_mcl_blast_resistance =  3,
			_mcl_hardness =  3,
			_mcl_silk_touch_drop = true,
			groups = {pickaxey = 3}
		},
	}

	-- Bronze has some special cases, because it is made from copper and tin
	minetest.register_craft({
		type = "shapeless",
		output = "default:bronze_ingot 3",
		recipe = {
			"moreores:tin_ingot",
			copper_ingrediant,
			copper_ingrediant,
		},
	})
end

-- Copper rail (unique node)
if minetest.get_modpath("carts") then
	carts:register_rail("moreores:copper_rail", {
		description = S("Copper Rail"),
		tiles = {
			"moreores_copper_rail.png",
			"moreores_copper_rail_curved.png",
			"moreores_copper_rail_t_junction.png",
			"moreores_copper_rail_crossing.png",
		},
		inventory_image = "moreores_copper_rail.png",
		wield_image = "moreores_copper_rail.png",
		groups = carts:get_rail_groups(),
	}, {})
end

minetest.register_craft({
	output = "moreores:copper_rail 24",
	recipe = {
		{copper_ingrediant, "", copper_ingrediant},
		{copper_ingrediant, "group:stick", copper_ingrediant},
		{copper_ingrediant, "", copper_ingrediant},
	},
})

for orename, def in pairs(oredefs) do
	-- Register everything
	add_ore("moreores", def.description, orename, def, def.extra_node_def)
end
