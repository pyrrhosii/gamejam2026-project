extends Node2D

@onready var nextScene = preload("res://scenes/final/introduction_capitan.tscn")

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		get_tree().change_scene_to_packed(nextScene)
