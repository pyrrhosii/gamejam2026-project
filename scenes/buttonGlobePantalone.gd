extends TextureButton

@onready var panel = $"../Panel"  # Ajuste le chemin selon ta structure
var zoomLayer
var cabinetArlequina
var downText

func _ready():
	# Cache le panel au démarrage
	panel.visible = false

	cabinetArlequina = get_tree().root.get_node("Cabinet-pantalone")
	downText = cabinetArlequina.get_node("dialogueBoxTableau/Panel/container/downText")
	
	# Connecte le signal de clic
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	# Affiche le panel quand on clique
	zoomLayer = cabinetArlequina.get_node("globeZoomLayer")
	downText.text = Dialogues.INFORMATIONS["GLOBE"]["ARLEQUINA"]["firstClick"]
	panel.visible = !panel.visible
	
	
