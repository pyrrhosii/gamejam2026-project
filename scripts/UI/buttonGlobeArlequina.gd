extends TextureButton

@onready var panel = $dialogueBoxTableau/Panel
var zoomLayer
var cabinetArlequina
var downText

func _ready():
	# Cache le panel au démarrage
	panel.visible = false

	downText = $dialogueBoxTableau/Panel/container/downText
	
	# Connecte le signal de clic
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	# Affiche le panel quand on clique
	downText.text = Dialogues.INFORMATIONS["GLOBE"]["ARLEQUINA"]["firstClick"]
	panel.visible = !panel.visible
	
	
