extends Area2D

@onready var label = $CanvasLayer/Label  # Label enfant direct ✅

func _ready():
	label.visible = false
	print("✅ Area2D prête - Label trouvé: ", label)

func _on_mouse_entered():
	label.visible = true
	print("🖱️ Souris ENTER")

func _on_mouse_exited():
	label.visible = false
	print("🖱️ Souris EXIT")
