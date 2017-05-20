--[[
More Ores: `mg` mod support

Copyright (c) 2011-2017 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

if not minetest.registered_items["default:tin_ingot"] then
	mg.register_ore({
		name = "moreores:mineral_tin",
		wherein = "default:stone",
		seeddiff = 8,
		maxvdistance = 10.5,
		maxheight = 8,
		seglenghtn = 15,
		seglenghtdev = 6,
		segincln = 0,
		segincldev = 0.6,
		turnangle = 57,
		forkturnangle = 57,
		numperblock = 2
	})
end

mg.register_ore({
	name = "moreores:mineral_silver",
	wherein = "default:stone",
	seeddiff = 9,
	maxvdistance = 10.5,
	maxheight = -2,
	seglenghtn = 15,
	seglenghtdev = 6,
	sizen = 60,
	sizedev = 30,
	segincln = 0,
	segincldev = 0.6,
	turnangle = 57,
	forkturnangle = 57,
	numperblock = 2
})

mg.register_ore({
	name = "moreores:mineral_mithril",
	wherein = "default:stone",
	seeddiff = 10,
	maxvdistance = 10.5,
	maxheight = -512,
	seglenghtn = 2,
	seglenghtdev = 4,
	sizen = 12,
	sizedev = 5,
	segincln = 0,
	segincldev = 0.6,
	turnangle = 57,
})
