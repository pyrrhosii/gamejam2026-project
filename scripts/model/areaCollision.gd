extends Node2D

var correctSequence := ["Sultanat", "Chinapon", "Ottoman","Capistan","Dindia","Europea"]
var currentStep := 0    # Combien de clics corrects

func showAndHide(panel: Panel, country: String) -> void:
	print("On clique sur une marque", country)
	panel.show()
	verifySequence(country)
	await get_tree().create_timer(1.0).timeout
	panel.hide()

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaSultanat/Sultanat/Panel, "Sultanat" )

func _on_area_2d_2_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaChinapon/Chinapon/Panel, "Chinapon" )

func _on_area_2d_3_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaOttoman/Ottoman/Panel, "Ottoman" )

func _on_area_capistan_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaCapistan/Capistan/Panel, "Capistan" )

func _on_area_dindia_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaDindia/Dindia/Panel, "Dindia" )

func _on_area_europea_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaEuropea/Europea/Panel, "Europea" )
		
func verifySequence(country) -> void:
	if country != correctSequence[currentStep]:
		print("❌ MAUVAIS ORDRE ! Recommence.")
		currentStep = 0
		return
	
	print("✅ BON ! Étape " + str(currentStep) + "/5")
	currentStep += 1
		
	if currentStep == correctSequence.size():
		$CanvasLayer/PanelSuccess.show()
		currentStep = 0
		await get_tree().create_timer(6.0).timeout
		get_tree().change_scene_to_file("res://scenes/final/final_capitan_arlequina.tscn")
