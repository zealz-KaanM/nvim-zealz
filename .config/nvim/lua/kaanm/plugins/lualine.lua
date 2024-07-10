return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }

    local configuration = vim.fn['everforest#get_configuration']()
    local palette = vim.fn['everforest#get_palette'](configuration.background, configuration.colors_override)

    if configuration.transparent_background == 2 then
      palette.bg1 = palette.none
    end

    local my_lualine_theme = {
      normal = {
        a = {bg = palette.statusline1[1], fg = palette.bg0[1], gui = 'bold'},
        b = {bg = palette.bg3[1], fg = palette.grey2[1]},
        c = {bg = palette.bg1[1], fg = palette.grey1[1]}
      },
      insert = {
        a = {bg = palette.statusline2[1], fg = palette.bg0[1], gui = 'bold'},
        b = {bg = palette.bg3[1], fg = palette.fg[1]},
        c = {bg = palette.bg1[1], fg = palette.fg[1]}
      },
      visual = {
        a = {bg = palette.statusline3[1], fg = palette.bg0[1], gui = 'bold'},
        b = {bg = palette.bg3[1], fg = palette.fg[1]},
        c = {bg = palette.bg1[1], fg = palette.fg[1]}
      },
      replace = {
        a = {bg = palette.orange[1], fg = palette.bg0[1], gui = 'bold'},
        b = {bg = palette.bg3[1], fg = palette.fg[1]},
        c = {bg = palette.bg1[1], fg = palette.fg[1]}
      },
      command = {
        a = {bg = palette.aqua[1], fg = palette.bg0[1], gui = 'bold'},
        b = {bg = palette.bg3[1], fg = palette.fg[1]},
        c = {bg = palette.bg1[1], fg = palette.fg[1]}
      },
      terminal = {
        a = {bg = palette.purple[1], fg = palette.bg0[1], gui = 'bold'},
        b = {bg = palette.bg3[1], fg = palette.fg[1]},
        c = {bg = palette.bg1[1], fg = palette.fg[1]}
      },
      inactive = {
        a = {bg = palette.bg1[1], fg = palette.grey1[1]},
        b = {bg = palette.bg1[1], fg = palette.grey1[1]},
        c = {bg = palette.bg1[1], fg = palette.grey1[1]}
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
