------------------------------------------------------------------------------
------------------------------ CONFIGURATION ---------------------------------
------------------------------------------------------------------------------

-- Chunk sizes for ore generation (bigger = ore deposits are more scattered around)
-- Amount of ore per chunk (higher = bigger ore deposits)
-- Minimal depths of ore generation (Y coordinate, 0 being sea level by default)
-- Maximal depths of ore generation (Y coordinate, 0 being sea level by default)

-- Tin
moreores.tin_enabled = minetest.setting_getbool("moreores_tin_enabled")
if moreores.tin_enabled == nil then moreores.tin_enabled = true end -- defaults to true
moreores.tin_chunk_size = tonumber(minetest.setting_get("moreores_tin_chunk_size")) or 7
moreores.tin_ore_per_chunk = tonumber(minetest.setting_get("moreores_tin_ore_per_chunk")) or 3
moreores.tin_min_depth = tonumber(minetest.setting_get("moreores_tin_min_depth")) or -31000
moreores.tin_max_depth = tonumber(minetest.setting_get("moreores_tin_max_depth")) or 8

moreores.override_default_bronze_recipe = minetest.setting_getbool("moreores_override_default_bronze_recipe") -- defaults to false

-- Silver

moreores.silver_enabled = minetest.setting_getbool("moreores_silver_enabled")
if moreores.silver_enabled == nil then moreores.silver_enabled = true end -- defaults to true
moreores.silver_chunk_size = tonumber(minetest.setting_get("moreores_silver_chunk_size")) or 11
moreores.silver_ore_per_chunk = tonumber(minetest.setting_get("moreores_silver_ore_per_chunk")) or 4
moreores.silver_min_depth = tonumber(minetest.setting_get("moreores_silver_min_depth")) or -31000
moreores.silver_max_depth = tonumber(minetest.setting_get("moreores_silver_max_depth")) or -2

-- Mithril

moreores.mithril_enabled = minetest.setting_getbool("moreores_mithril_enabled")
if moreores.mithril_enabled == nil then moreores.mithril_enabled = true end -- defaults to true
moreores.mithril_chunk_size = tonumber(minetest.setting_get("moreores_mithril_chunk_size")) or 11
moreores.mithril_ore_per_chunk = tonumber(minetest.setting_get("moreores_mithril_ore_per_chunk")) or 1
moreores.mithril_min_depth = tonumber(minetest.setting_get("moreores_mithril_min_depth")) or -31000
moreores.mithril_max_depth = tonumber(minetest.setting_get("moreores_mithril_max_depth")) or -512