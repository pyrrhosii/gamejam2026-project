extends TextureButton

@onready var panel = $"../Panel"  # Ajuste le chemin selon ta structure

func _ready():
	# Cache le panel au démarrage
	panel.visible = false
	
	# Connecte le signal de clic
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	# Affiche le panel quand on clique
	panel.visible = !panel.visible
