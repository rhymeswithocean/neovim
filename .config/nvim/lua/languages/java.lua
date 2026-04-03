local root_markers = vim.fs.find({ 'gradlew', 'mvnw', '.git', 'pom.xml' }, { upward = true })
local config = {
  cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls') },
  root_dir = root_markers[1] and vim.fs.dirname(root_markers[1]) or vim.fn.getcwd(),
}
require('jdtls').start_or_attach(config)
