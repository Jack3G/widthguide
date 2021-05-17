-- vim.fn.getpos(".")
-- [1] is buffer number
-- [2] is line
-- [3] is col
-- [4] is something else idk

-- Setting the colorcolumn takes a long time
-- Be carefull of that, me

local M = {}

local column
local warn_column
local warn_colour
local past_colour

local function loadSetting(name, default)
    local setting = vim.g[name]
    if not setting then
        setting = default
    end

    return setting
end

local function reloadAllSettings()
    local _column = loadSetting("widthguide_column", "80")
    local _warn_column = loadSetting("widthguide_warn_column", "70")
    local _warn_colour = loadSetting("widthguide_warn_colour", "darkred")
    local _past_colour = loadSetting("widthguide_past_colour", "red")

    return _column, _warn_column, _warn_colour, _past_colour
end

local function setupAutocmds()
    vim.cmd("augroup widthguide")
    vim.cmd("autocmd!")
    vim.cmd("autocmd CursorMoved,CursorMovedI * lua require(\"widthguide\").update()")
    vim.cmd("augroup END")
end



function M.update()
    local pos = vim.fn.getcurpos()

    -- Check from right to left
    if pos[3] > tonumber(column) then
        if vim.wo.colorcolumn ~= column then
            vim.wo.colorcolumn = column
        end
        vim.cmd(
            "highlight ColorColumn ctermbg="..
            past_colour.." guibg="..past_colour
        )
    elseif pos[3] > tonumber(warn_column) then
        if vim.wo.colorcolumn ~= column then
            vim.wo.colorcolumn = column
        end
        vim.cmd(
            "highlight ColorColumn ctermbg="..
            warn_colour.." guibg="..warn_colour
        )
    else
        if vim.wo.colorcolumn ~= "0" then
            vim.wo.colorcolumn = "0"
        end
    end
end

function M.enable()
    column, warn_column, warn_colour, past_colour = reloadAllSettings()

    setupAutocmds()
end

function M.disable()
    vim.cmd("augroup widthguide")
    vim.cmd("au!")
    vim.cmd("augroup END")

    vim.o.colorcolumn = "0"
    vim.wo.colorcolumn = "0"
end

return M
