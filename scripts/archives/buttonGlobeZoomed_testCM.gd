extends TextureButton

@onready var panel = $"../Panel"  # Ajuste le chemin selon ta structure
#@onready var textureButton = $TextureButton

var zoomLayer
var zoom

func _ready():
	# Cache le panel au démarrage
	panel.visible = false

	zoom = get_tree().root.get_node("ZonesCliquables")
	
	# Connecte le signal de clic
	self.pressed.connect(_on_button_click)
	
func _on_button_click():
	panel.visible = !panel.visible
	


func _on_pressed() -> void:
	pass # Replace with function body.
