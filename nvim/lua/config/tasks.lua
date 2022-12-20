local greyjoy = require("greyjoy")

greyjoy.setup({
  output_results = "toggleterm",
  last_first = true,
  extensions = {
    generic = {
      commands = {
        ["run test.py"] = {
          command = {"./test.py"},
          filetype = "python"
        },
        ["run {filename}"] = {
          command = {"go", "run", "{filename}"},
          filetype = "go"
        }
      }
    },
    kitchen = {
      targets = {"converge", "verify"},
      include_all = false,
    }
  },
  run_groups = {
    fast = {"generic", "makefile", "cargo"},
  }
})
greyjoy.load_extension("generic")
greyjoy.load_extension("vscode_tasks")
greyjoy.load_extension("makefile")

