return {

  --############################################################################
  -- Parser generator tool 
  --############################################################################
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install=true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "c",
          "cpp",
          "java",
          "yaml",
          "json",
          "lua",
          "python",
          "rust",
        },
        -- lorse de l'appui sur <Ctrl-space> sélectionne le bloc
        -- courant spécifique au langage de programmation
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end
  },

  --############################################################################
  -- api for completion
  --############################################################################
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer", -- source pour compléter le texte déjà présent dans le buffer
      "hrsh7th/cmp-path", -- source pour compléter les chemins des fichiers
      "hrsh7th/cmp-cmdline", -- source pour les completions de la cmdline de vim
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
      },
      "saadparwaiz1/cmp_luasnip", -- ajoute LuaSnip à l'autocompletion
      "rafamadriz/friendly-snippets", -- collection de snippets pratiques
      "hrsh7th/cmp-emoji", -- complétion d'émojis à la saisie de :
      "onsails/lspkind.nvim", -- vs-code pictogrammes
    },
    config = function()
      local cmp = require("cmp")

      local luasnip = require("luasnip")

      local lspkind = require("lspkind")

      -- chargement des snippets (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = { -- on utilise luasnip comme moteur de snippets
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-1),
          ["<C-f>"] = cmp.mapping.scroll_docs(1),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accepte la sélection courante. Mettre à `false` pour ne confirmer que les items explicitement sélectionnés
        },

        -- sources pour l'autocompletion
        sources = cmp.config.sources({
          { name = "nvim_lua" },
          --{ name = "luasnip" }, -- snippets
          { name = "buffer" }, -- texte du buffer courant
          { name = "path" }, -- chemins dy système de fichier
          --{ name = "emoji" }, -- emojis
        }),

        formatting = {
          -- Comportement par défaut
          expandable_indicator = true,
          -- Champs affichés par défaut
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          -- On suffixe chaque entrée par son type
          menu = {
            buffer = "[Buffer]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            path = "[Path]",
            emoji = "[Emoji]",
            },
          }),
        },
      })

      -- `/` complétion
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` complétion
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },

  --############################################################################
  -- A collection of functions for Neovim's LSP client
  --############################################################################
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
  },

  --############################################################################
  -- LSP client configurations for various LSP servers
  --############################################################################
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Va permetre de remplir le plugin de complétion automatique nvim-cmp
      -- avec les résultats des LSP
      "hrsh7th/cmp-nvim-lsp",
      -- Ajoute les « code actions » de type renommage de fichiers intelligent, etc
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      -- import de lsp-zero
      local lsp_zero = require("lsp-zero")

      -- lsp_attach sert à activer des fonctionnalités qui ne seront disponibles
      -- que s'il il y a un LSP d'activé pour le fichier courant
      local lsp_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }

        -- configuration des raccourcis
        -- je ne vous les traduis pas, ils me semblent parler d'eux-même ;)
        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "Show LSP signature help"
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.jump({ count = -1, float = true })
        end, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.jump({ count = 1, float = true })
        end, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Format buffer"
        vim.keymap.set({ "n", "x" }, "F", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end

      lsp_zero.extend_lspconfig({
        -- On affiche les signes des diagnostics dans la gouttière de gauche
        sign_text = true,
        -- On attache notre fonction qui définit les raccourcis
        lsp_attach = lsp_attach,
        -- On augmente les capacités de complétion par défaut avec les propositions du LSP
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- On utilise lsp_zero pour configurer quelques éléments de design
      lsp_zero.ui({
        float_border = "rounded",
        sign_text = {
          error = " ",
          warn = " ",
          hint = "󰠠 ",
          info = " ",
        },
      })
    end,
  },

  --############################################################################
  -- Mason, lsp and other installer and manager
  --############################################################################
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- import de mason
      local mason = require("mason")

      -- import de mason-lspconfig
      local mason_lspconfig = require("mason-lspconfig")

      -- import de lspconfig
      local lspconfig = require("lspconfig")

      -- active mason et personnalise les icônes
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        -- Liste des serveurs à installer par défaut
        -- List des serveurs possibles : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        -- Vous pouvez ne pas en mettre ici et tout installer en utilisant :Mason
        -- Mais au lieu de passer par :Mason pour installer, je vous recommande d'ajouter une entrée à cette liste
        -- Ça permettra à votre configuration d'être plus portable
        ensure_installed = {
          "html",
          "lua_ls",
          "pylsp",
          "ruff",
          "rust_analyzer",
        },
        handlers = {
          -- Fonction appelée au chargement de chaque LSP de la liste ensure_installed
          function(server_name)
            -- On active tous les LSP de ensure_installed avec sa configuration par défaut
            lspconfig[server_name].setup({})
          end,

          -- On peut ensuite configurer chaque LSP comme on veut
          -- Les détails des configurations possibles sont disponibles ici :
          -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
          -- Quelques exemples avec Python (pylsp et ruff) ainsi que Rust ci-dessous
          --
          -- Pour désactiver un LSP il suffit de faire
          -- mon_lsp = require("lsp-zero").noop,

          -- le nom du lsp avant le `= function()` doit être le même que celui après `lspconfig.`
          -- le premier est la clé utilisée par mason_lspconfig, le deuxième est celle utilisée par lspconfig (ce sont les mêmes)
          -- ils correspondent aux entrées du ensure_installed

          -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pylsp
          pylsp = function()
            lspconfig.pylsp.setup({
              settings = {
                pylsp = {
                  plugins = {
                    pyflakes = { enabled = false },
                    pycodestyle = {
                      enabled = true,
                      ignore = { "E501" },
                    },
                  },
                },
              },
            })
          end,

          -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#
          ruff = function()
            lspconfig.ruff.setup({
              init_options = {
                settings = {
                  -- Arguments par défaut de la ligne de commande "ruff server"
                  -- (on ajoute les warnings pour le tri des imports)
                  args = { "--extend-select", "I" },
                },
              },
            })
          end,

          -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rust_analyzer
          rust_analyzer = function()
            lspconfig.rust_analyzer.setup({
              settings = {
                ["rust-analyzer"] = {
                  diagnostics = {
                  enable = true,
                  styleLints = {
                    enable = true,
                  },
                },
              },
            },
          })
        end,

        -- skip enoying vim not global error in nvim config
        lua_ls = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  -- Force le LSP à reconnaître la variable globale `vim`
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      },
    })
  end,
  },

  --############################################################################
  -- Trouble, get and display code error when saved
  --############################################################################
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  
  --############################################################################
  -- autopairs parenthese and other caractere
  --############################################################################
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      -- import nvim-autopairs
      local autopairs = require("nvim-autopairs")

      -- configure autopairs
      autopairs.setup({
        check_ts = true, -- enable treesitter
        disable_filetype = { "TelescopePrompt" },
        ts_config = {
          lua = { "string" }, -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
          java = false, -- don't check treesitter on java
        },
      })

      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- import nvim-cmp plugin (completions plugin)
      local cmp = require("cmp")

      -- make autopairs and completion work together
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  }
}
