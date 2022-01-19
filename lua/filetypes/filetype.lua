local FileType = {}
FileType.__index = FileType

function FileType:new(options)
    local ft = {}
    setmetatable(ft, FileType)
    ft.extensions = options["extensions"]
    ft.cmds = options["commands"]
    return ft
end

function FileType:extension_key()
    return table.concat(self.extensions, ",")
end

function FileType:command()
    local normalized_commands = {}
    for _, cmd in ipairs(self.cmds) do
        if type(cmd) == "string" then
            local wrapped_cmd = function ()
                vim.api.nvim_command(cmd)
            end
            table.insert(normalized_commands, wrapped_cmd)
        elseif type(cmd) == "function" then
            table.insert(normalized_commands, cmd)
        else
            print("Invalid type of command for %s: %s", self:extension_key(), vim.inspect(cmd))
        end
    end

    return function ()
        for _, cmd in ipairs(normalized_commands) do
            (cmd)()
        end
    end
end

return FileType
