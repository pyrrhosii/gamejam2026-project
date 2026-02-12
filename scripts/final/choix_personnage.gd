extends Node2D

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		$Pantalone.show()	


func _on_area_2d_2_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		$Arlequina.show()
