local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set("n", "<C-]>",          api.tree.change_root_to_node,       opts("CD"))
  -- vim.keymap.set("n", "<C-e>",          api.node.open.replace_tree_buffer,  opts("Open: In Place"))
  vim.keymap.set("n", "<C-k>",          api.node.show_info_popup,           opts("Info"))
  vim.keymap.set("n", "<C-r>",          api.fs.rename_sub,                  opts("Rename: Omit Filename"))
  vim.keymap.set("n", "<C-t>",          api.node.open.tab,                  opts("Open: New Tab"))
  vim.keymap.set("n", "<C-v>",          api.node.open.vertical,             opts("Open: Vertical Split"))
  vim.keymap.set("n", "<C-x>",          api.node.open.horizontal,           opts("Open: Horizontal Split"))
  vim.keymap.set("n", "<BS>",           api.node.navigate.parent_close,     opts("Close Directory"))
  vim.keymap.set("n", "<CR>",           api.node.open.edit,                 opts("Open"))
  vim.keymap.set("n", "<Tab>",          api.node.open.preview,              opts("Open Preview"))
  vim.keymap.set("n", ">",              api.node.navigate.sibling.next,     opts("Next Sibling"))
  vim.keymap.set("n", "<",              api.node.navigate.sibling.prev,     opts("Previous Sibling"))
  vim.keymap.set("n", ".",              api.node.run.cmd,                   opts("Run Command"))
  vim.keymap.set("n", "-",              api.tree.change_root_to_parent,     opts("Up"))
  vim.keymap.set("n", "a",              api.fs.create,                      opts("Create File Or Directory"))
  vim.keymap.set("n", "bd",             api.marks.bulk.delete,              opts("Delete Bookmarked"))
  vim.keymap.set("n", "bt",             api.marks.bulk.trash,               opts("Trash Bookmarked"))
  vim.keymap.set("n", "bmv",            api.marks.bulk.move,                opts("Move Bookmarked"))
  vim.keymap.set("n", "B",              api.tree.toggle_no_buffer_filter,   opts("Toggle Filter: No Buffer"))
  vim.keymap.set("n", "c",              api.fs.copy.node,                   opts("Copy"))
  vim.keymap.set("n", "C",              api.tree.toggle_git_clean_filter,   opts("Toggle Filter: Git Clean"))
  vim.keymap.set("n", "[c",             api.node.navigate.git.prev,         opts("Prev Git"))
  vim.keymap.set("n", "]c",             api.node.navigate.git.next,         opts("Next Git"))
  vim.keymap.set("n", "d",              api.fs.remove,                      opts("Delete"))
  vim.keymap.set("n", "D",              api.fs.trash,                       opts("Trash"))
  vim.keymap.set("n", "E",              api.tree.expand_all,                opts("Expand All"))
  vim.keymap.set("n", "e",              api.fs.rename_basename,             opts("Rename: Basename"))
  vim.keymap.set("n", "]e",             api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  vim.keymap.set("n", "[e",             api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        on_attach = nvim_tree_on_attach,
      }
    end,
  },
  {"nvim-tree/nvim-web-devicons"},
}
