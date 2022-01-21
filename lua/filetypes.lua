local function ls(dir_path)
    local dir = vim.loop.fs_scandir(dir_path)
    if not dir then
        print(string.format("Error loading directory '%s'", dir_path))
    end

    local files = {}

    local name, fs_type
    while dir do
        name, fs_type = vim.loop.fs_scandir_next(dir)

        if not name then
            break
        end

        files[name] = fs_type
    end
    return files
end

local function cwd ()
    return debug.getinfo(1).source:sub(2):match("(.*/)")
end

-- This is extremely unsafe, don't copy this for general purpose!
local function load_dir(dir, except)
    local except_set = {}
    for _, e in ipairs(except) do except_set[e] = true end
    local files = ls(dir)
    local files_to_require = {}
    table.foreach(files, function (file_name, _)
        if file_name:sub(-#".lua")  == ".lua" and not except_set[file_name] then
            files_to_require[file_name:sub(1, -5)] = string.format("%s/%s", dir, file_name)
        end
    end)
    local loaded_files = {}
    for name, file in pairs(files_to_require) do
        loaded_files[name] = dofile(file)
    end
    return loaded_files
end

local function setup()
    local autocmd = require('autocmd')
    local ft_dir = string.format("%s%s", cwd(), "filetypes")
    local filetypes = load_dir(ft_dir, {"filetype.lua"})
    local ft_autocmds = {}
    for _, ft in pairs(filetypes) do
        ft_autocmds[ft:extension_key()] = ft:command()
    end

    autocmd.augroup {
        'filetype_commands',
        {{
            'FileType', ft_autocmds
        }}
    }
end

return {
  setup = setup
}
