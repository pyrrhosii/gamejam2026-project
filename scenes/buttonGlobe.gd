extends TextureButton

@onready var panel = $"../Panel"  # Ajuste le chemin selon ta structure
var zoomLayer
var cabinetArlequina

func _ready():
	# Cache le panel au démarrage
	panel.visible = false

	var cabinetArlequina = get_tree().root.get_node("Cabinet-arlequina")
	
	# Connecte le signal de clic
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	# Affiche le panel quand on clique
	zoomLayer = cabinetArlequina.get_node("globeZoomLayer")
	panel.visible = !panel.visible
	
	
