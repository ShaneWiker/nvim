local nest = require('nest')

nest.applyKeymaps {
    -- Remove silent from ; : mapping, so that : shows up in command mode
    { ';', ':' , options = { silent = false } },
    { ':', ';' },

    -- Prefix  every nested keymap with <leader>
    { '<leader>', {
        { 'o',{
            { 'q', "<cmd>e C:\\Users\\Elle\\AppData\\Local\\nvim\\init.vim<CR>"},
        }},
        { 'J', 'J', {
        }},
        { 't',{
            { 'n', ':tabnew<CR>'},
            { ',', ':tabprev<CR>'},
            { '.', ':tabnext<CR>'},
        }},

        -- Lua functions can be right side values instead of key sequences
    }},

}
