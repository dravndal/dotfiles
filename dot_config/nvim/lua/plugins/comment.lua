return {
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    {
      "echasnovski/mini.comment",
      event = "VeryLazy",
      opts = {
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end,
        },
      },
    },
    {
      "echasnovski/mini.pairs",
      event = "VeryLazy",
      opts = {},
    },
    {
      "echasnovski/mini.ai",
      -- keys = {
      --   { "a", mode = { "x", "o" } },
      --   { "i", mode = { "x", "o" } },
      -- },
      event = "VeryLazy",
      dependencies = { "nvim-treesitter-textobjects" },
      opts = function()
        local ai = require("mini.ai")
        return {
          n_lines = 500,
          custom_textobjects = {
            o = ai.gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {}),
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
            c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          },
        }
      end,
      config = function(_, opts)
        require("mini.ai").setup(opts)
      end,
    },
    {
        "kylechui/nvim-surround",
        version = false,
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    }
}
