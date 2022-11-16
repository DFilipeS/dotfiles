require("telescope").setup {
  pickers = {
    find_files = {
      hidden = true
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = false,
      hidden = true
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('projects')
