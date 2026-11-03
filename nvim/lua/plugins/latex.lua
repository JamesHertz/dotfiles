return {
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here
      vim.cmd([[
                " This is necessary for VimTeX to load properly. The "indent" is optional.
                " Note that most plugin managers will do this automatically.
                filetype plugin indent on

                " This enables Vim's and neovim's syntax-related features. Without this, some
                " VimTeX features will not work (see ":help vimtex-requirements" for more
                " info).
                syntax enable

                " Viewer options: One may configure the viewer either by specifying a built-in
                " viewer method:
                let g:vimtex_view_method = 'zathura'

                " Or with a generic interface:
                " let g:vimtex_view_general_viewer = 'okular'
                " let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

                " VimTeX uses latexmk as the default compiler backend. If you use it, which is
                " strongly recommended, you probably don't need to configure anything. If you
                " want another compiler backend, you can change it as follows. The list of
                " supported backends and further explanation is provided in the documentation,
                " see ":help vimtex-compiler".
                let g:vimtex_compiler_method = 'latexmk'

                let g:vimtex_compiler_latexmk = {
                    \ 'aux_dir' : '/tmp',
                    \ 'out_dir' : '/tmp',
                \}

                " Most VimTeX mappings rely on localleader and this can be changed with the
                " following line. The default is usually fine and is the symbol "\".
                let maplocalleader = ","
                " TODO: look at this

                ]])
    end,
  },

  {
      "barreiroleo/ltex_extra.nvim",
      ft = { "markdown", "tex" },
      dependencies = { "neovim/nvim-lspconfig" },
      -- yes, you can use the opts field, just I'm showing the setup explicitly
      config = function()
          require("ltex_extra").setup {
              load_langs = { "en-US" }, -- en-US as default
              init_check = true,
              path       = vim.fn.expand("~") .. "/.local/share/ltex",
              -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
              log_level      = "error",
			  server_opts    = {
				  capabilities = require('blink.cmp').get_lsp_capabilities(),
				  filetypes = { 'tex' }
			  }

          }
      end
  }
}
