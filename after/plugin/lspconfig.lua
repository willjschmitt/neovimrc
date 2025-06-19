require("lspconfig").pyright.setup {
  settings = {
    python = {
      analysis = {
        extraPaths = {"/home/will/achillea/achillea"}
      }
    }
  }
}
