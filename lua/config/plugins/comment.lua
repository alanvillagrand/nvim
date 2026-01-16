return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("Comment").setup({
      -- If default mapping are getting in the way, set this to false:
      -- mappings = false,
      -- Enable TS-based commentstring
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })

    local api = require("Comment.api")

    -- Normal mode: toggle current line
    vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, {
      desc = "Toggle comment (line)",
    })

    -- vim.keymap.set("n", "<C-/><C-b>", api.toggle.blockwise.current, {
    --   desc = "Toggle comment (line, blockwise)",
    -- })

    -- Visual mode: toggle selected lines
    vim.keymap.set("v", "<C-/>", function()
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
      vim.api.nvim_feedkeys(esc, "nx", false)
      api.toggle.linewise(vim.fn.visualmode())
    end, {
      desc = "Toggle comment (selection)",
    })

    -- vim.keymap.set("v", "<C-/><C-b>", function()
    --   local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    --   vim.api.nvim_feedkeys(esc, "nx", false)
    --   api.toggle.blockwise(vim.fn.visualmode())
    -- end, {
    --   desc = "Toggle comment (selection, blockwise)",
    -- })

  end,
}
