return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",  -- Predefined snippets for many languages
  },
  config = function()
    local luasnip = require("luasnip")

    -- Set up LuaSnip
    luasnip.config.setup({
      history = true,  -- Keep track of snippet history
      updateevents = "TextChanged,TextChangedI",  -- Update snippets as you type
    })

    -- Custom Go snippets
    luasnip.add_snippets("go", {
      -- Main function
      luasnip.snippet("main", {
        luasnip.text_node([[
          package main

          func main() {
        ]]),
        luasnip.insert_node(1, "// Your code here"),
        luasnip.text_node([[
          }
        ]]),
      }),

      -- Struct definition
      luasnip.snippet("struct", {
        luasnip.text_node([[
          type ]]),
        luasnip.insert_node(1, "MyStruct"),
        luasnip.text_node([[ struct {
        ]]),
        luasnip.insert_node(2, "Field1 string"),
        luasnip.text_node([[
          }
        ]]),
      }),

      -- Method definition
      luasnip.snippet("method", {
        luasnip.text_node([[
          func (]]),
        luasnip.insert_node(1, "receiver *MyStruct"),
        luasnip.text_node([[) ]]),
        luasnip.insert_node(2, "MyMethod"),
        luasnip.text_node([[() {
        ]]),
        luasnip.insert_node(3, "// Method implementation"),
        luasnip.text_node([[
          }
        ]]),
      }),

      -- Error handling
      luasnip.snippet("err", {
        luasnip.text_node([[
          if err != nil {
        ]]),
        luasnip.insert_node(1, "return err"),
        luasnip.text_node([[
          }
        ]]),
      }),

      -- Print statement
      luasnip.snippet("print", {
        luasnip.text_node([[
          fmt.Println(]]),
        luasnip.insert_node(1, "Hello, World!"),
        luasnip.text_node([[)
        ]]),
      }),
    })

    -- Keybindings for LuaSnip
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
  end,
}
