require 'keymap'
require 'plugins'

vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"

-- clipboard config for wsl
-- yankしたときにクリップボードに保存する
if vim.fn.has('wsl') == 1 then
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
        callback = function()
            vim.fn.system('clip.exe', vim.fn.getreg('"'))
        end,
    })
end

-- Color Scheme
vim.cmd 'colorscheme iceberg'
vim.cmd 'highlight GitGutterAdd guifg=green ctermfg=green'
vim.cmd 'highlight GitGutterChange guifg=blule ctermfg=blue'
vim.cmd 'highlight GitGutterDelete guifg=red ctermfg=red'

vim.api.nvim_create_user_command('Format', 'call CocAction(\'format\')', {nargs=0})

-- plugin setting
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'material',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {''},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require("bufferline").setup{
  options = {
    mode = "buffers",
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "thin",
  }
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "bash", "css", "dockerfile", "go", "html", "javascript", "python", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E5C07B gui=nocombine]]
require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
  char_highlight_list = { "IndentBlanklineIndent1",},
}

require('Comment').setup()

require("todo-comments").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
