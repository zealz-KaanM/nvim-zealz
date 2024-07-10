return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

    local logo = [[
 ___  __     ________   ________   ________    _____ ______      
|\  \|\  \  |\   __  \ |\   __  \ |\   ___  \ |\   _ \  _   \    
\ \  \/  /|_\ \  \|\  \\ \  \|\  \\ \  \\ \  \\ \  \\\__\ \  \   
 \ \   ___  \\ \   __  \\ \   __  \\ \  \\ \  \\ \  \\|__| \  \  
  \ \  \\ \  \\ \  \ \  \\ \  \ \  \\ \  \\ \  \\ \  \    \ \  \ 
   \ \__\\ \__\\ \__\ \__\\ \__\ \__\\ \__\\ \__\\ \__\    \ \__\
    \|__| \|__| \|__|\|__| \|__|\|__| \|__| \|__| \|__|     \|__|

      ]]

		-- Set header
		dashboard.section.header.val = vim.split(logo, "\n")

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>lua MiniFiles.open()<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("c c", " > Nvim config", ":e $MYVIMRC | :cd %:p:h | :SessionRestore<CR>"),
      dashboard.button("c p", " > Plugins", ":Lazy<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    
    -- Automatically open alpha when the last buffer is deleted and only one window left
    vim.cmd [[ au BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) && winnr('$') == 1 | exec 'Alpha' | endif ]]
 
    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded "
          local date = os.date "%d/%m/%Y "
          local time = os.date "%H:%M:%S"
          local v = vim.version()
          local version = "v" .. v.major .. "." .. v.minor .. "." .. v.patch
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "[" .. date .. time .. "][" .. stats.count .. " plugins " .. ms .. "ms][" .. version .. "]"
          pcall(vim.cmd.AlphaRedraw)
      end,
    })

	end,
}
