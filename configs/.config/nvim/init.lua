local A = vim.api

-- Vanilla Config
require('impatient')
require'impatient'.enable_profile()
require('settings')
require('autocmd')
require('plugins')
require('keybinds')
require('colors')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
