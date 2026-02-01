extends Node2D

@onready var map_scene = preload("res://scenes/final/zoomed_globe_pantalone_final.tscn")
@onready var dialogue_capitan = $DialogueCapitan
@onready var dialogue_brighella = $DialogueBrighella

func _ready() -> void:
	dialogue_capitan.visible = false
	dialogue_brighella.visible = false


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On a cliqué sur on ouvre le globe!")
		var map = map_scene.instantiate()
		add_child(map)


func _on_capitan_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		if DialogConst.dialogIsOpen == false:	
			dialogue_capitan.visible = true
			DialogConst.dialogIsOpen = true
			

func _on_brighella_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		if DialogConst.dialogIsOpen == false:	
			dialogue_brighella.visible = true
			DialogConst.dialogIsOpen = true
