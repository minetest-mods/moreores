-- Tin ore is very common and has very little use. Here's a tin dagger.
-- Useful in that it's efficient
-- Pathetic in that it breaks fairly quickly

local maxuses = 20

local tindaggercaps = {
	full_punch_interval = 2.0,
	max_drop_level = 0,
	groupcaps = {
		snappy = {times = {[2] = 1.2, [3] = 0.3}, uses = 2, maxlevel = 1},
	},
	damage_groups = {fleshy = 4},
}

minetest.register_tool("moreores:tin_dagger", {
        description = "Tin Dagger",
        inventory_image = "moreores_tin_dagger.png",
        tool_capabilities = tindaggercaps, -- overridden by use of on_use ....
	on_use = function(itemstack,user,pointedthing)
		if pointedthing.type == "object" then
			pointedthing.ref:punch(user,1,tindaggercaps)

			-- explicitly non-physical entities should not incur wear, cater for nil
			if pointedthing.ref:get_luaentity().physical_state ~= false then
			        itemstack:add_wear(math.ceil(65536/maxuses))
			end
		end
	        return itemstack
	end
})

core.register_craft({
	output = "moreores:tin_dagger",
	recipe = {
		{"moreores:tin_ingot"},
		{"moreores:tin_ingot"},
		{"default:stick"}
	}
})

