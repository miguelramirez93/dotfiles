return {
    load_from_folder = function(path)
        local files = io.popen('find "$HOME"/.config/nvim/lua/' .. path .. " -type f")
        local plugins_list = {}
        for file in files:lines() do
            local req_file = file:gmatch("%/lua%/(.+).lua$")({ 0 }):gsub("/", ".")
            local status_ok, plg = pcall(require, req_file)
            if not status_ok then
                vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
            end
            if type(plg) == 'table' then
                table.insert(plugins_list, plg)
            end
        end
        return plugins_list
    end,
}
