if not minetest.get_modpath("loot") then
	return
end

if moreores.tin_enabled then
	loot.register_loot({
		weights = { generic = 500 },
		payload = {
			stack = ItemStack("moreores:tin_ingot"),
			min_size = 1,
			max_size = 10,
		},
	})
	
	loot.register_loot({
		weights = { generic = 500 },
		payload = {
			stack = ItemStack("moreores:tin_lump"),
			min_size = 1,
			max_size = 10,
		},
	})
end

if moreores.silver_enabled then
	loot.register_loot({
		weights = { generic = 200, valuable = 200, },
		payload = {
			stack = ItemStack("moreores:silver_ingot"),
			min_size = 1,
			max_size = 10,
		},
	})

	loot.register_loot({
		weights = { generic = 200, valuable = 200, },
		payload = {
			stack = ItemStack("moreores:silver_lump"),
			min_size = 1,
			max_size = 10,
		},
	})
end

if moreores.mithril_enabled then
	loot.register_loot({
		weights = { generic = 25, valuable = 25, },
		payload = {
			stack = ItemStack("moreores:mithril_ingot"),
			min_size = 1,
			max_size = 5,
		},
	})

	loot.register_loot({
		weights = { generic = 25, valuable = 25, },
		payload = {
			stack = ItemStack("moreores:mithril_lump"),
			min_size = 1,
			max_size = 5,
		},
	})
end