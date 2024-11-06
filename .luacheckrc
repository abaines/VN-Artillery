std = {
    globals = {"serpent", "table_size", "settings", "game", "script", "defines", "log", "storage", "data", "table"},
 }
max_cyclomatic_complexity = 1
max_line_length = 120
include_files = {
    "**/*.lua",
    "*.lua",
    "prototypes/*.lua",
    "data.lua",
    "data-updates.lua",
    "settings.lua",
    ".luacheckrc",
    "../**/*.lua",
    "../../**/*.lua",
    "$GITHUB_WORKSPACE/**/*.lua",
    "/home/runner/work/VN-Artillery/VN-Artillery/*.lua",
    ".",
    "..",
}
exclude_files ={
    "*.py",
    "*.pdn",
    "*.png",
    "*.md",
}
print("hello")
