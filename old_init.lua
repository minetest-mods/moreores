--[[
****
More Ores
by Calinou
Old and "inefficient" version; use if the new version does not work for some reason. Outdated.
Licensed under the zlib/libpng license, see LICENSE.txt for info.
****
--]]

-- Blocks

minetest.register_node( "moreores:mineral_gold", {
	description = "Gold Ore",
	tile_images = { "default_stone.png^moreores_mineral_gold.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = 'craft "moreores:gold_lump" 1',
})

minetest.register_node( "moreores:gold_block", {
	description = "Gold Block",
	tile_images = { "moreores_gold_block.png" },
	is_ground_content = true,
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "moreores:mineral_silver", {
	description = "Silver Ore",
	tile_images = { "default_stone.png^moreores_mineral_silver.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = 'craft "moreores:silver_lump" 1',
})

minetest.register_node( "moreores:silver_block", {
	description = "Silver Block",
	tile_images = { "moreores_silver_block.png" },
	is_ground_content = true,
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "moreores:mineral_copper", {
	description = "Copper Ore",
	tile_images = { "default_stone.png^moreores_mineral_copper.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = 'craft "moreores:copper_lump" 1',
})

minetest.register_node( "moreores:mineral_tin", {
	description = "Tin Ore",
	tile_images = { "default_stone.png^moreores_mineral_tin.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = 'craft "moreores:tin_lump" 1',
})

minetest.register_node( "moreores:bronze_block", {
	description = "Bronze Block",
	tile_images = { "moreores_bronze_block.png" },
	is_ground_content = true,
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "moreores:mineral_mithril", {
	description = "Mithril Ore",
	tile_images = { "default_stone.png^moreores_mineral_mithril.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = 'craft "moreores:mithril_lump" 1',
})

minetest.register_node( "moreores:mithril_block", {
	description = "Mithril Block",
	tile_images = { "moreores_mithril_block.png" },
	is_ground_content = true,
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moreores:copper_rail", {
	description = "Copper Rail",
	drawtype = "raillike",
	tile_images = {"moreores_copper_rail.png", "moreores_copper_rail_curved.png", "moreores_copper_rail_t_junction.png", "moreores_copper_rail_crossing.png"},
	inventory_image = "moreores_copper_rail.png",
	wield_image = "moreores_copper_rail.png",
	paramtype = "light",
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		--fixed = <default>
	},
	groups = {bendy=2,snappy=1,dig_immediate=2},
})

-- Items

minetest.register_craftitem( "moreores:gold_lump", {
	description = "Gold Lump",
	inventory_image = "moreores_gold_lump.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:gold_ingot", {
	description = "Gold Ingot",
	inventory_image = "moreores_gold_ingot.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:silver_lump", {
	description = "Silver Lump",
	inventory_image = "moreores_silver_lump.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:silver_ingot", {
	description = "Silver Ingot",
	inventory_image = "moreores_silver_ingot.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:copper_lump", {
	description = "Copper Lump",
	inventory_image = "moreores_copper_lump.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:copper_ingot", {
	description = "Copper Ingot",
	inventory_image = "moreores_copper_ingot.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:tin_lump", {
	description = "Tin Lump",
	inventory_image = "moreores_tin_lump.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:tin_ingot", {
	description = "Tin Ingot",
	inventory_image = "moreores_tin_ingot.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:bronze_ingot", {
	description = "Bronze Ingot",
	inventory_image = "moreores_bronze_ingot.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "moreores:mithril_lump", {
	description = "Mithril Lump",
	inventory_image = "moreores_mithril_lump.png",
	on_place_on_ground = minetest.craftitem_place_item,
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem( "moreores:mithril_ingot", {
	description = "Mithril Ingot",
	inventory_image = "moreores_mithril_ingot.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

-- Tools

minetest.register_tool("moreores:pick_bronze", {
	description = "Bronze Pickaxe",
	inventory_image = "moreores_tool_bronzepick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=3.00, [2]=1.20, [3]=0.80}, uses=160, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:shovel_bronze", {
	description = "Bronze Shovel",
	inventory_image = "moreores_tool_bronzeshovel.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=0.50, [3]=0.30}, uses=160, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:axe_bronze", {
	description = "Bronze Axe",
	inventory_image = "moreores_tool_bronzeaxe.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=3.00, [2]=1.00, [3]=0.60}, uses=160, maxlevel=1},
			fleshy={times={[2]=1.30, [3]=0.70}, uses=160, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:sword_bronze", {
	description = "Bronze Sword",
	inventory_image = "moreores_tool_bronzesword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[2]=0.80, [3]=0.40}, uses=160, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.40}, uses=160, maxlevel=1},
			choppy={times={[3]=0.90}, uses=160, maxlevel=0}
		}
	}
})

minetest.register_tool("moreores:pick_silver", {
	description = "Silver Pickaxe",
	inventory_image = "moreores_tool_silverpick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=2.60, [2]=1.00, [3]=0.60}, uses=100, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:shovel_silver", {
	description = "Silver Shovel",
	inventory_image = "moreores_tool_silvershovel.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=1.10, [2]=0.40, [3]=0.25}, uses=100, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:axe_silver", {
	description = "Silver Axe",
	inventory_image = "moreores_tool_silveraxe.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=2.50, [2]=0.80, [3]=0.50}, uses=100, maxlevel=1},
			fleshy={times={[2]=1.10, [3]=0.60}, uses=100, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:sword_silver", {
	description = "Silver Sword",
	inventory_image = "moreores_tool_silversword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[2]=0.70, [3]=0.30}, uses=100, maxlevel=1},
			snappy={times={[2]=0.70, [3]=0.30}, uses=100, maxlevel=1},
			choppy={times={[3]=0.80}, uses=100, maxlevel=0}
		}
	}
})

minetest.register_tool("moreores:pick_gold", {
	description = "Golden Pickaxe",
	inventory_image = "moreores_tool_goldpick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=2.00, [2]=0.50, [3]=0.30}, uses=70, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:shovel_gold", {
	description = "Golden Shovel",
	inventory_image = "moreores_tool_goldshovel.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=0.60, [2]=0.25, [3]=0.15}, uses=70, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:axe_gold", {
	description = "Golden Axe",
	inventory_image = "moreores_tool_goldaxe.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=1.70, [2]=0.40, [3]=0.35}, uses=70, maxlevel=1},
			fleshy={times={[2]=0.90, [3]=0.30}, uses=70, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:sword_gold", {
	description = "Golden Sword",
	inventory_image = "moreores_tool_goldsword.png",
	tool_capabilities = {
		full_punch_interval = 0.85,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[2]=0.60, [3]=0.20}, uses=70, maxlevel=1},
			snappy={times={[2]=0.60, [3]=0.20}, uses=70, maxlevel=1},
			choppy={times={[3]=0.65}, uses=70, maxlevel=0}
		}
	}
})

minetest.register_tool("moreores:pick_mithril", {
	description = "Mithril Pickaxe",
	inventory_image = "moreores_tool_mithrilpick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=2.25, [2]=0.55, [3]=0.35}, uses=200, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:shovel_mithril", {
	description = "Mithril Shovel",
	inventory_image = "moreores_tool_mithrilshovel.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=0.70, [2]=0.35, [3]=0.20}, uses=200, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:axe_mithril", {
	description = "Mithril Axe",
	inventory_image = "moreores_tool_mithrilaxe.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=1.75, [2]=0.45, [3]=0.45}, uses=200, maxlevel=1},
			fleshy={times={[2]=0.95, [3]=0.30}, uses=200, maxlevel=1}
		}
	},
})

minetest.register_tool("moreores:sword_mithril", {
	description = "Mithril Sword",
	inventory_image = "moreores_tool_mithrilsword.png",
	tool_capabilities = {
		full_punch_interval = 0.45,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[2]=0.65, [3]=0.25}, uses=200, maxlevel=1},
			snappy={times={[2]=0.70, [3]=0.25}, uses=200, maxlevel=1},
			choppy={times={[3]=0.65}, uses=200, maxlevel=0}
		}
	}
})

-- Crafting

minetest.register_craft({
	output = 'moreores:copper_rail 15',
	recipe = {
		{'moreores:copper_ingot', '', 'moreores:copper_ingot'},
		{'moreores:copper_ingot', 'default:stick', 'moreores:copper_ingot'},
		{'moreores:copper_ingot', '', 'moreores:copper_ingot'},
	}
})

minetest.register_craft( {
	output = 'craft "moreores:pick_bronze" 1',
	recipe = {
		{ 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"' },
		{ '', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:shovel_bronze" 1',
	recipe = {
		{ '', 'craft "moreores:bronze_ingot"', '' },
		{ '', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:axe_bronze" 1',
	recipe = {
		{ 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"', '' },
		{ 'craft "moreores:bronze_ingot"', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:sword_bronze" 1',
	recipe = {
		{ '', 'craft "moreores:bronze_ingot"', '' },
		{ '', 'craft "moreores:bronze_ingot"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:pick_silver" 1',
	recipe = {
		{ 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"' },
		{ '', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:shovel_silver" 1',
	recipe = {
		{ '', 'craft "moreores:silver_ingot"', '' },
		{ '', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:axe_silver" 1',
	recipe = {
		{ 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"', '' },
		{ 'craft "moreores:silver_ingot"', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:sword_silver" 1',
	recipe = {
		{ '', 'craft "moreores:silver_ingot"', '' },
		{ '', 'craft "moreores:silver_ingot"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:pick_gold" 1',
	recipe = {
		{ 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"' },
		{ '', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:shovel_gold" 1',
	recipe = {
		{ '', 'craft "moreores:gold_ingot"', '' },
		{ '', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:axe_gold" 1',
	recipe = {
		{ 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"', '' },
		{ 'craft "moreores:gold_ingot"', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:sword_gold" 1',
	recipe = {
		{ '', 'craft "moreores:gold_ingot"', '' },
		{ '', 'craft "moreores:gold_ingot"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:pick_mithril" 1',
	recipe = {
		{ 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"' },
		{ '', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:shovel_mithril" 1',
	recipe = {
		{ '', 'craft "moreores:mithril_ingot"', '' },
		{ '', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:axe_mithril" 1',
	recipe = {
		{ 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"', '' },
		{ 'craft "moreores:mithril_ingot"', 'craft "Stick"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:sword_mithril" 1',
	recipe = {
		{ '', 'craft "moreores:mithril_ingot"', '' },
		{ '', 'craft "moreores:mithril_ingot"', '' },
		{ '', 'craft "Stick"', '' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:bronze_ingot"',
	recipe = {
		{ 'craft "moreores:tin_ingot"'},
		{ 'craft "moreores:copper_ingot"'},
	}
})

minetest.register_craft( {
	output = 'craft "moreores:bronze_ingot"',
	recipe = {
		{ 'craft "moreores:copper_ingot"'},
		{ 'craft "moreores:tin_ingot"'},
	}
})

minetest.register_craft( {
	output = 'node "moreores:gold_block" 1',
	recipe = {
		{ 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"' },
		{ 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"' },
		{ 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"', 'craft "moreores:gold_ingot"' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:gold_ingot" 9',
	recipe = {
		{ 'node "moreores:gold_block"' },
	}
})

minetest.register_craft( {
	output = 'node "moreores:silver_block" 1',
	recipe = {
		{ 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"' },
		{ 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"' },
		{ 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"', 'craft "moreores:silver_ingot"' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:silver_ingot" 9',
	recipe = {
		{ 'node "moreores:silver_block"' },
	}
})

minetest.register_craft( {
	output = 'node "moreores:bronze_block" 1',
	recipe = {
		{ 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"' },
		{ 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"' },
		{ 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"', 'craft "moreores:bronze_ingot"' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:bronze_ingot" 9',
	recipe = {
		{ 'node "moreores:bronze_block"' },
	}
})

minetest.register_craft( {
	output = 'node "moreores:mithril_block" 1',
	recipe = {
		{ 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"' },
		{ 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"' },
		{ 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"', 'craft "moreores:mithril_ingot"' },
	}
})

minetest.register_craft( {
	output = 'craft "moreores:mithril_ingot" 9',
	recipe = {
		{ 'node "moreores:mithril_block"' },
	}
})

-- Smelting

minetest.register_craft({
    type = "cooking",
    output = "moreores:gold_ingot",
    recipe = "moreores:gold_lump",
})

minetest.register_craft({
    type = "cooking",
    output = "moreores:silver_ingot",
    recipe = "moreores:silver_lump",
})

minetest.register_craft({
    type = "cooking",
    output = "moreores:tin_ingot",
    recipe = "moreores:tin_lump",
})

minetest.register_craft({
    type = "cooking",
    output = "moreores:copper_ingot",
    recipe = "moreores:copper_lump",
})

minetest.register_craft({
    type = "cooking",
    output = "moreores:mithril_ingot",
    recipe = "moreores:mithril_lump",
})

minetest.register_craft( {
	output = 'node "default:chest_locked" 1',
	recipe = {
		{ 'craft "moreores:bronze_ingot"' },
		{ 'node "default:chest"' },
	}
})

minetest.register_craft( {
	output = 'node "default:chest_locked" 1',
	recipe = {
		{ 'craft "moreores:silver_ingot"' },
		{ 'node "default:chest"' },
	}
})

minetest.register_craft( {
	output = 'node "default:chest_locked" 1',
	recipe = {
		{ 'craft "moreores:gold_ingot"' },
		{ 'node "default:chest"' },
	}
})

minetest.register_craft( {
	output = 'node "default:chest_locked" 1',
	recipe = {
		{ 'node "default:wood"', 'node "default:wood"', 'node "default:wood"' },
		{ 'node "default:wood"', 'craft "moreores:bronze_ingot"', 'node "default:wood"' },
		{ 'node "default:wood"', 'node "default:wood"', 'node "default:wood"' },
	}
})

minetest.register_craft( {
	output = 'node "default:chest_locked" 1',
	recipe = {
		{ 'node "default:wood"', 'node "default:wood"', 'node "default:wood"' },
		{ 'node "default:wood"', 'craft "moreores:bronze_ingot"', 'node "default:wood"' },
		{ 'node "default:wood"', 'node "default:wood"', 'node "default:wood"' },
	}
})

minetest.register_craft( {
	output = 'node "default:chest_locked" 1',
	recipe = {
		{ 'node "default:wood"', 'node "default:wood"', 'node "default:wood"' },
		{ 'node "default:wood"', 'craft "moreores:silver_ingot"', 'node "default:wood"' },
		{ 'node "default:wood"', 'node "default:wood"', 'node "default:wood"' },
	}
})

minetest.register_craft( {
	output = 'node "default:chest_locked" 1',
	recipe = {
		{ 'node "default:wood"', 'node "default:wood"', 'node "default:wood"' },
		{ 'node "default:wood"', 'craft "moreores:gold_ingot"', 'node "default:wood"' },
		{ 'node "default:wood"', 'node "default:wood"', 'node "default:wood"' },
	}
})

-- Ore generation

local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, height_min, height_max)
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local chunk_size = 3
	if ore_per_chunk <= 4 then
		chunk_size = 2
	end
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	--print("generate_ore num_chunks: "..dump(num_chunks))
	for i=1,num_chunks do
	if (y_max-chunk_size+1 <= y_min) then return end
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y=y0, z=z0}
			for x1=0,chunk_size-1 do
			for y1=0,chunk_size-1 do
			for z1=0,chunk_size-1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y=y2, z=z2}
					if minetest.env:get_node(p2).name == wherein then
						minetest.env:set_node(p2, {name=name})
					end
				end
			end
			end
			end
		end
	end
	--print("generate_ore done")
end

minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("moreores:mineral_copper", "default:stone", minp, maxp, seed+16,   1/11/11/11,    8, -31000,  64)
generate_ore("moreores:mineral_tin", "default:stone", minp, maxp, seed+17,   1/8/8/8,    2, -31000,  8)
generate_ore("moreores:mineral_silver", "default:stone", minp, maxp, seed+18,   1/10/10/10,    5, -31000,  2)
generate_ore("moreores:mineral_gold", "default:stone", minp, maxp, seed+19,   1/12/12/12,    5, -31000,  -64)
generate_ore("moreores:mineral_mithril", "default:stone", minp, maxp, seed+20,   1/6/6/6,    1, -31000,  -512)
end)