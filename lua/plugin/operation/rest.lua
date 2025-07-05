return {
  "rest-nvim/rest.nvim",
  config = function()
    require("rest-nvim").setup({
      response = {
        hooks = {
          decode_url = true,
          format = true,
        },
      },
      ui = {
        winbar = true,
      }
    })
  end,
}
