# Positionne le bouton en haut à droite avec les ancres
# Layout → Top Right
extends Button

func _ready():
	text = "X"
	pressed.connect(_on_close)

func _on_close():
	get_parent().get_parent().queue_free()  # Supprime le parent complètement
