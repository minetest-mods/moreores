# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- [Tweaked ore generation to better fit Minetest's new defaults.](https://github.com/minetest-mods/moreores/pull/45)
  - Three layers (two underground and one high air/space) are now used instead of just one layer.
  - Chunk size is no longer used as clust size anymore. Clust sizes are usually
    just 3 nodes and not the whole area ("chunk"), where the ores are generated.
  - Adjusted several default values.
    - Mithril is now generated *below* diamond. Note that there was a change
      in Minetest 5.0.0 where most ore generation was shifted to much lower
      altitude (shifting diamond generation altitude below mithril generation altitude).
    - The mithril ores are now also grouped together and not just found as a
      single node in one chunk.
    - The same overall ore density is retained in the deep layer.

- Switch to GitHub Actions.
  - Benefits include faster responses, easier management, and more.

## [2.1.0] - 2021-06-28

### Added

- More Ores tools now have [`toolranks`](https://github.com/lisacvuk/minetest-toolranks) support.
- Hungarian translation.

### Changed

- Migrated translations to the
  [Minetest translation file format](https://rubenwardy.com/minetest_modding_book/lua_api.html#translation-file-format).

## [2.0.0] - 2019-11-25

### Added

- More Ores nodes/items/tools can now be placed in item frames
  from the [`frame`](https://github.com/minetest-mods/frame) mod.
- Polish translation.

### Changed

- The minimum supported Minetest version is now 5.0.0.
- Copper rails are now registered using functions from the `carts` mod,
  making them interoperate seamlessly with default rails.
  - Copper rails can no longer be placed in the air.

## [1.1.0] - 2019-03-23

### Added

- Brazilian and Dutch translations.

### Changed

- Ores are now slower to mine and cannot be mined using wooden tools anymore.
- Updated intllib support to avoid using deprecated functions.

### Deprecated

- Deprecated hoes to follow Minetest Game's deprecation of hoes
  made of "rare" materials.
  - Hoes are still available in existing worlds, but they
    cannot be crafted anymore.

### Fixed

- Hoes now use the `farming` mod's handling function and can no longer
  turn desert sand into dirt.
- Handle tin which is now included in [Minetest Game](https://github.com/minetest/minetest_game).
  If it is detected, then the tin nodes and items from More Ores won't be registered.

## 1.0.0 - 2017-02-19

- Initial versioned release.

[Unreleased]: https://github.com/minetest-mods/moreores/compare/v2.1.0...HEAD
[2.1.0]: https://github.com/minetest-mods/moreores/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/minetest-mods/moreores/compare/v1.1.0...v2.0.0
[1.1.0]: https://github.com/minetest-mods/moreores/compare/v1.0.0...v1.1.0
