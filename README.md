# Widthguide

A plugin I made

It makes 'colorcolumn' only show when you get close to it.

## Usage
`:WidthGuideEnable` and `:WidthGuideDisable`

## Configuration
Widthguide has 4 options which you can set with `let g:option_here=value` or in lua: `vim.g["option_here"] = value`

``` lua
-- defaults

-- the column that the widthguide will show on
vim.g["widthguide_column"] = "80"

-- if your cursor is past here then the widthguide shows
vim.g["widthguide_warn_column"] = "70"

-- when your cursor is past "widthguide_warn_column"
vim.g["widthguide_warn_colour"] = "darkred"

-- when your cursor is past "widthguide_column"
vim.g["widthguide_past_colour"] = "red"
```
