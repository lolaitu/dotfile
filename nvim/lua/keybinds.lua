-- On définit notre touche leader sur espace
vim.g.mapleader = " "

-- Raccourci pour la fonction set
local keymap = vim.keymap.set

-- on utilise ;; ou Shift-espace pour sortir du monde insertion
keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })
keymap("i", "<S-Space>", "<ESC>", { desc = "Sortir du mode insertion avec Shift + Espace" })

-- on efface le surlignage de la recherche
keymap("n", "<leader>s", ":nohl<CR>", { desc = "Effacer le surlignage de la recherche" })

-- I déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
keymap("v", "<S-j>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<S-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- ctrl j déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" })
-- ctrl k déplace le texte sélectionné vers le bas en mode visuel (activé avec V)
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" })

-- Nouvelle ligne sous le curseur avec <C-o> et au-dessus avec <C-S-o>
keymap('n', '<C-o>', 'o<ESC>', { noremap = true, silent = true, desc = "Nouvelle ligne sous le curseur" })
keymap('n', '<C-S-o>', 'O<ESC>', { noremap = true, silent = true, desc = "Nouvelle ligne au-dessus du curseur" })

-- Buffer suivant avec leader n et précédent avec leader b
keymap("n", "<leader>n", ":bnext<CR>", { desc = "buffer suivant" })
keymap("n", "<leader>b", ":bprevious<CR>", { desc = "buffer suivant" })
