return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local utils = require("utils")
    local int_to_hex = utils.int_to_hex

    local function section_a_color(section)
      local mode = vim.api.nvim_get_mode()
      local mode_str

      if mode.mode == "i" then
        mode_str = "_insert"
      elseif mode.mode == "c" then
        mode_str = "_command"
      elseif mode.mode == "n" then
        mode_str = "_normal"
      elseif mode.mode == "v" or mode == "V" or mode == "" then
        mode_str = "_visual"
      else
        mode_str = "_normal"
      end

      local hl_name = "lualine_a" .. mode_str
      local hl = vim.api.nvim_get_hl(0, { name = hl_name })

      local result = { fg = int_to_hex(hl.bg), bg = "" } or {}
      return result
    end


    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }


    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end


    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }


    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }



    -- local gruvbox_material = require("lualine.themes.gruvbox-material")
    -- gruvbox_material.normal.c.bg = "none"
    -- gruvbox_material.inactive.c.bg = "none"


    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = gruvbox_material, 
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --                    
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {
          {
            function() return '' end,
            color = section_a_color,
            padding = { right = 0 }
          },
          'mode'
        },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = {
          diagnostics,
          diff,
          { 'encoding', cond = hide_in_width },
          { 'filetype', cond = hide_in_width }
        },
        lualine_y = { 'location' },
        lualine_z = {
          "progress",
          {
            function() return "" end,
            color = section_a_color,
            padding = { left = 0 }
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
