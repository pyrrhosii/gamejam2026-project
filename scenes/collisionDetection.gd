# Ce script va sur l'Area2D
extends Area2D

var area2d
var container

func _ready():
	var cabinet = get_tree().root.get_node("Cabinet")
	print("node :", cabinet)
	container = cabinet.get_node("dialogueBoxTableau/Area2D/Panel")
	container.visible = false

func _input_event(viewport, event, shape_idx):
	print("event called", event, shape_idx)
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			container.visible = !container.visible
