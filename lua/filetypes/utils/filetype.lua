local FileType = {}
FileType.__index = FileType

function FileType:new(extensions, cmds)
    local ft = {}
    setmetatable(ft, FileType)
    ft.extensions = extensions
    ft.cmds = cmds
    return ft
end

function FileType:extensions()
    return self.extensions
end

function FileType:commands()
    return self.cmds
end

function FileType:extension_key()
    return self.extensions.join(",")
end

return FileType
