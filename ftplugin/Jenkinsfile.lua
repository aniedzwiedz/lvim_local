local opts = {
  root_dir = function(fname)
    return require("lspconfig").util.root_pattern "Jenkinsfile"(fname) or require("lspconfig").util.path.dirname(fname)
  end,
}

require("lvim.lsp.manager").setup("groovyls", opts)
