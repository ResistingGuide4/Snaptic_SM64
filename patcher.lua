local utils = require("gdpatch.utils")

GDPatch.patch_script_as_text("autoloads/level_loader/level_loader.gdc", function(ctx, src)
  src = src:gsub(
    utils.escape("MAGNET_PUZZLES, "),
    utils.escape("MAGNET_PUZZLES, \n\tBOBOMB_BATTLEFIELD,", true)
  )
  return src
end)

GDPatch.patch_script_as_text("autoloads/level_loader/level_loader.gdc", function(ctx, src)
  src = src:gsub(
    utils.escape("LevelName.MAGNET_PUZZLES: \"res://levels/mirraxis/test_levels/magnet_puzzles.tscn\", "),
    utils.escape("LevelName.MAGNET_PUZZLES: \"res://levels/mirraxis/test_levels/magnet_puzzles.tscn\", \n\tLevelName.BOBOMB_BATTLEFIELD: \"res://gdpatch/mod/snaptic_smsixtyfour/bobomb_battlefield.tscn\"", true)
  )
  return src
end)
