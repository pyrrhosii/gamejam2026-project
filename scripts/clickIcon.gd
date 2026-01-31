extends Area2D

func _input_event(_viewport, event, _shape_idx):
	print("Input event détecté!")
	if event is InputEventMouseButton and event.pressed:
		print("Clic détecté!")
		queue_free()
