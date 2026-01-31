extends TextureButton

@onready var panel = $"../Panel"  # Ajuste le chemin selon ta structure

var zoomLayer
var zoom

func _ready():
	# Cache le panel au démarrage
	panel.visible = false
	zoom = get_tree().root.get_node("ZonesCliquables")
	
	# Connecte le signal de clic
	self.mouse_entered.connect(_on_button_hover)
	self.mouse_exited.connect(_on_button_exit)
	self.pressed.connect(_on_button_click)

func _on_button_hover():
	# Affiche le panel quand on clique
	panel.visible = true
	
func _on_button_exit():
	# Affiche le panel quand on clique
	panel.visible = false
	
func _on_button_click():
	panel.visible = !panel.visible
	
