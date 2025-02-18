HSerializedBuffer�� EventHandler�� Cursor�� ModTime��   8��EventHandler�� 	UndoStack�� 	RedoStack��   '��TEStack�� Top�� Size   *��Element�� Value�� Next��   B��	TextEvent�� C�� 	EventType Deltas�� Time��   Z��Cursor�� Loc�� LastVisualX CurSelection�� OrigSelection�� Num   ��Loc�� X Y   ��[2]buffer.Loc�� ��  ��[]buffer.Delta�� ��  0��Delta�� Text
 Start�� End��   ��Time��   ����@ @ B @ B  
@ B     �c25�� < |B |B D B D  ?    config.BindKey("Ctrl-Shift-Down", "selecttoparagraphnext")
B D     �c/(��� < ��B ��B D B D  A    config.BindKey("Ctrl-Shift-Up", "selecttoparagraphprevious")
B D     �c/�2 < JB JB D B D  &    -- Associe les raccourcis clavier
B D     �c.8 �n <       ��local config = import("micro/config")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function SelectToParagraphPrevious(bp)
    local cursor = bp.Cursor
    local origLine = cursor.Y

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Sélectionne entre la position d'origine et la nouvelle
    cursor:StartSelection()
    cursor:LineDown(origLine - cursor.Y) -- Nombre de lignes à remonter
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function SelectToParagraphNext(bp)
    local cursor = bp.Cursor
    local origLine = cursor.Y

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Sélectionne entre la position d'origine et la nouvelle
    cursor:StartSelection()
    cursor:LineDown(cursor.Y - origLine) -- Nombre de lignes à descendre
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selecttoparagraphprevious", SelectToParagraphPrevious, config.NoComplete)
    config.MakeCommand("selecttoparagraphnext", SelectToParagraphNext, config.NoComplete)

    -- Associe les raccourcis clavier
    config.BindKey("Ctrl-Shift-Up", "selecttoparagraphprevious")
    config.BindKey("Ctrl-Shift-Down", "selecttoparagraphnext")
end
 J     �c*��& <      
   @    �c:)�TV < 