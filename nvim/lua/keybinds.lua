-- On définit notre touche leader sur espace
vim.g.mapleader = " "

-- Raccourci pour la fonction set
local keymap = vim.keymap.set

-- on utilise ;; ou Shift-espace pour sortir du monde insertion
keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })
keymap("i", "<S-Space>", "<ESC>", { desc = "Sortir du mode insertion avec Shift + Espace" })

-- on efface le surlignage de la recherche
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Effacer le surlignage de la recherche" })

-- I déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
keymap("v", "<S-j>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<S-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- I déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
keymap("x", "<S-i>", ":move '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec V)
keymap("x", "<S-k>", ":move '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" })

-- nouvelle ligne sous curseur avec <Enter> et au-dessus curseur avec <S-Enter>
keymap('n', '<CR>', 'o<ESC>', { noremap = true, silent = true }, { desc = "nouvelle ligne sous curseur" })
keymap('n', '<S-CR>', 'O<ESC>', { noremap = true, silent = true }, { desc = "nouvelle ligne sur curseur" })
