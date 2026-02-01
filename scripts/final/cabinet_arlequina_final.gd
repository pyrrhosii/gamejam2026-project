extends Node2D

@onready var panel = $dialogueBoxTableau/Panel
@onready var downText = $dialogueBoxTableau/Panel/container/downText
@onready var map_scene = preload("res://scenes/final/zoomed_globe_arlequina_final.tscn")
func _ready():
	# Cache le panel au démarrage
	panel.visible = false

func ouvrir_information():
	# Affiche le panel quand on clique
	downText.text = Dialogues.INFORMATIONS["GLOBE"]["ARLEQUINA"]["firstClick"]
	panel.visible = !panel.visible

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On a cliqué sur on ouvre le globe!")
		ouvrir_information()
		var map = map_scene.instantiate()
		add_child(map)
