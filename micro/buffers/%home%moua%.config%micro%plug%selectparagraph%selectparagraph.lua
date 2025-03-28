HSerializedBuffer�� EventHandler�� Cursor�� ModTime��   8��EventHandler�� 	UndoStack�� 	RedoStack��   '��TEStack�� Top�� Size   *��Element�� Value�� Next��   B��	TextEvent�� C�� 	EventType Deltas�� Time��   Z��Cursor�� Loc�� LastVisualX CurSelection�� OrigSelection�� Num   ��Loc�� X Y   ��[2]buffer.Loc�� ��  ��[]buffer.Delta�� ��  0��Delta�� Text
 Start�� End��   ��Time��   �5���., .., ., .,   a,, .,     ���&� < ,, ,,, ,, ,,   a,, .,     ����� <       �local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en Loc (X, Y)

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(startLoc) -- Passe directement le Loc initial
    cursor:SetSelectionEnd(cursor.Loc) -- Nouvelle position après déplacement
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en Loc (X, Y)

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(startLoc) -- Passe directement le Loc initial
    cursor:SetSelectionEnd(cursor.Loc) -- Nouvelle position après déplacement
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
 D     �h#;�� <   D    �local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en type *buffer.Loc

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(*startLoc) -- Déréférencer le pointeur
    cursor:SetSelectionEnd(*cursor.Loc) -- Nouvelle position après déplacement
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en type *buffer.Loc

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(*startLoc) -- Déréférencer le pointeur
    cursor:SetSelectionEnd(*cursor.Loc) -- Nouvelle position après déplacement
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
 D     �h#6z� <       �local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en type *buffer.Loc

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(*startLoc) -- Déréférencer le pointeur
    cursor:SetSelectionEnd(*cursor.Loc) -- Nouvelle position après déplacement
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en type *buffer.Loc

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(*startLoc) -- Déréférencer le pointeur
    cursor:SetSelectionEnd(*cursor.Loc) -- Nouvelle position après déplacement
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
 D     �g�*T�* <   D    ��local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en type Loc (X, Y)

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(startLoc)
    cursor:SetSelectionEnd(cursor.Loc) -- Nouvelle position en Loc
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en type Loc (X, Y)

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(startLoc)
    cursor:SetSelectionEnd(cursor.Loc) -- Nouvelle position en Loc
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
 D     �g�*Mle <       ��local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en type Loc (X, Y)

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(startLoc)
    cursor:SetSelectionEnd(cursor.Loc) -- Nouvelle position en Loc
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en type Loc (X, Y)

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(startLoc)
    cursor:SetSelectionEnd(cursor.Loc) -- Nouvelle position en Loc
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
 D     �gi'm± <   D    ��local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startPos = cursor.Pos -- Position actuelle en offset (pas en coordonnées)

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Active la sélection entre les deux positions
    cursor:SetSelectionStart(startPos)
    cursor:SetSelectionEnd(cursor.Pos) -- Nouvelle position après déplacement
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startPos = cursor.Pos -- Position actuelle en offset

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Active la sélection entre les deux positions
    cursor:SetSelectionStart(startPos)
    cursor:SetSelectionEnd(cursor.Pos) -- Nouvelle position après déplacement
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
 D     �gi'f�� <       ��local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startPos = cursor.Pos -- Position actuelle en offset (pas en coordonnées)

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Active la sélection entre les deux positions
    cursor:SetSelectionStart(startPos)
    cursor:SetSelectionEnd(cursor.Pos) -- Nouvelle position après déplacement
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startPos = cursor.Pos -- Position actuelle en offset

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Active la sélection entre les deux positions
    cursor:SetSelectionStart(startPos)
    cursor:SetSelectionEnd(cursor.Pos) -- Nouvelle position après déplacement
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
 D     �g&0�� <   D    �Flocal config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startLine = cursor.Y

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Active la sélection entre les deux positions
    cursor:SetSelectionStart(cursor.X, startLine)
    cursor:SetSelectionEnd(cursor.X, cursor.Y)
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startLine = cursor.Y

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Active la sélection entre les deux positions
    cursor:SetSelectionStart(cursor.X, startLine)
    cursor:SetSelectionEnd(cursor.X, cursor.Y)
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
 D     �g&0��� < "   " "  selectParagraphNext" 8"     �f�j�� < <" <" <" " <"  SelectToParagraphNext" <"     �f�f� < \@ \  \@ \@  selectParagraphNext\@ ��@     �f���� < ��@ ��\@ ��@ \@ ��@  SelectToParagraphNext\@ ��@     �f��W� <       selectParagraphPrevious @     �f�'2) < D D D  D  SelectToParagraphPrevious D     �f�'/ۜ < d> d  d> d>  selectParagraphPreviousd> ��>     �f}(4 < ��> ��d> ��> d> ��>  SelectToParagraphPreviousd> ��>     �f}%ve < <@ <<@ <@ <@ B  P<@ >@     �fp!��Y < <@ <<@ <@ <@ B  p<@ >@     �fo!R4 < <@ <>@ >@ >@ B  o<@ >@     �fo�-c < <@ <@@ @@ @@ B  t<@ >@     �fo�K� < R@ R@@ @@ @@ B  NR@ T@     �fl�*� < T@ T@@ @@ @@ B  nR@ T@     �fk4̄V < N> N@@ @@ @@ B  PN> P>     �fi�m< < P> P@@ @@ @@ B  pN> P>     �fh(� . < <> <@@ @@ @@ B  P<> >>     �fbHK� < <> <@@ @@ @@ B  p<> >>     �fa4�� < >> >@@ @@ @@ B  t<> >>     �f`*s�� < @> @@@ @@ @@ B  o>> @>     �f` P�� < |B |B D B D  ?    config.BindKey("Ctrl-Shift-Down", "selecttoparagraphnext")
B D     �f!6H�Z < ��B ��B D B D  A    config.BindKey("Ctrl-Shift-Up", "selecttoparagraphprevious")
B D     �f!� < JB JB D B D  &    -- Associe les raccourcis clavier
B D     �f!Q�� < B B D B D  
B D     �f!�$� <       ��local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function SelectToParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startLine = cursor.Y

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Active la sélection entre les deux positions
    cursor:SetSelectionStart(cursor.X, startLine)
    cursor:SetSelectionEnd(cursor.X, cursor.Y)
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function SelectToParagraphNext(bp)
    local cursor = bp.Cursor
    local startLine = cursor.Y

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Active la sélection entre les deux positions
    cursor:SetSelectionStart(cursor.X, startLine)
    cursor:SetSelectionEnd(cursor.X, cursor.Y)
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selecttoparagraphprevious", SelectToParagraphPrevious, config.NoComplete)
    config.MakeCommand("selecttoparagraphnext", SelectToParagraphNext, config.NoComplete)

    -- Associe les raccourcis clavier
    config.BindKey("Ctrl-Shift-Up", "selecttoparagraphprevious")
    config.BindKey("Ctrl-Shift-Down", "selecttoparagraphnext")
end
 L     �f��Z <                                    F J J  J    lesB J     ���ݮ� <        �h)�� < 