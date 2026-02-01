extends Node2D

@onready var dialogue_rouge = $DialogueRouge
@onready var dialogue_vert = $DialogueVert
@onready var map_scene = preload("res://scenes/zones_cliquables.tscn")
func _ready():
	# Cache le panel au démarrage
	dialogue_rouge.visible = false
	dialogue_vert.visible = false

func ouvrir_information():
	# Affiche le panel quand on clique
	#downText.text = Dialogues.INFORMATIONS["GLOBE"]["ARLEQUINA"]["firstClick"]
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On a cliqué sur on ouvre le globe!")
		ouvrir_information()
		var map = map_scene.instantiate()
		add_child(map)

func _on_button_rouge_pressed() -> void:
	dialogue_rouge.visible = true

func _on_button_vert_pressed() -> void:
	dialogue_vert.visible = true
