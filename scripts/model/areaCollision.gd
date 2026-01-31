extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On a cliqué sur on ouvre le globe!", shape_idx)
		if shape_idx == 0 :
			$Area2D/Capistan/Panel6.visible = !$Area2D/Capistan/Panel6.visible
#		else if shape_idx == 0 :
				
