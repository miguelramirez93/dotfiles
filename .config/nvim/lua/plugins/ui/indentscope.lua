return {
    'echasnovski/mini.indentscope',
    version = '*',
    event = "BufEnter",
    enabled = false,
    opts = {
        symbol = '|',
        draw = {
            -- Delay (in ms) between event and start of drawing scope indicator
            delay = 100,
        }
    },
    setup = function(opts)
        require('mini.indentscope').setup(opts)
    end,
}
