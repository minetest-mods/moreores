std = "lua51+minetest"
unused_args = false
allow_defined_top = true
max_line_length = 90

ignore = {
  "default_stone_sounds",
	"default_metal_sounds"
}

stds.minetest = {
	read_globals = {
		"DIR_DELIM",
		"minetest",
		"core",
		"dump",
		"vector",
		"nodeupdate",
		"VoxelManip",
		"VoxelArea",
		"PseudoRandom",
		"ItemStack",
		"default",
		table = {
			fields = {
				"copy",
			},
		},
	}
}

read_globals = {
	"carts",
	"farming",
	"frame",
	"mg",
	"toolranks",
	"mcl_sounds"
}
