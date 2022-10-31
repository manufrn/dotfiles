return {
  settings = {
    texlab = {
      diagnosticsDelay = 50,
        -- latexFormatter = "texlab",
      build = {
        executable = "latexmk",
          args = {
            "-pdf",
            "-interaction=nonstopmode",
            "-pvc",
            "-synctex=1",
            "-shell-escape",
            "%f",
        },
    },
    forwardSearch = {
        args = { "--synctex-forward", "%l:1:%f", "%p" },
        executable = "zathura",
    },
    chktex = { onOpenAndSave = true, onEdit = false },
    formatterLineLength = 80,
    }
  }
}
