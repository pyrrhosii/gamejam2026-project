extends Node2D

var sequence_correcte = ["Ottoman", "Chinapon", "Dindia"]
var sequence_joueur = []  # Ce que le joueur clique
var etape_actuelle = 0    # Combien de clics corrects


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func showAndHide(panel: Panel, landName: String) -> void:
	print("On clique sur une marque", landName)
	panel.visible = true
	verifySequence(landName)
	await get_tree().create_timer(1.0).timeout
	panel.visible = false

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaSultanat/Sultanat/Panel, "Sultanat" )

func _on_area_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaChinapon/Chinapon/Panel, "Chinapon" )

func _on_area_2d_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaOttoman/Ottoman/Panel, "Ottoman" )

func _on_area_capistan_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaCapistan/Capistan/Panel, "Capistan" )

func _on_area_dindia_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaDindia/Dindia/Panel, "Dindia" )

func _on_area_europea_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		showAndHide($AreaEuropea/Europea/Panel, "Europea" )
		
func verifySequence(buttonName):
	# Ajoute le clic du joueur
	sequence_joueur.append(buttonName)
	
	# Vérifie si c'est le bon ordre
	if buttonName == sequence_correcte[etape_actuelle]:
		etape_actuelle += 1
		#texte.text = "✅ BON ! Étape " + str(etape_actuelle) + "/3"
		print("✅ BON ! Étape " + str(etape_actuelle) + "/3")
		
		# SÉQUENCE COMPLÈTE !
		if etape_actuelle == 3:
			$CanvasLayer/PanelSuccess.visible = true
			await get_tree().create_timer(6.0).timeout
			$CanvasLayer/PanelSuccess.visible = false
			#texte.visible = true
			#texte.text = "🎉 PARFAIT ! Tu as réussi !"
			reset_sequence()
	else:
		print("❌ MAUVAIS ORDRE ! Recommence.")
		#texte.visible = true
		#texte.text = "❌ MAUVAIS ORDRE ! Recommence."
		reset_sequence()

func reset_sequence():
	sequence_joueur.clear()
	etape_actuelle = 0
	#texte.text = "Clique : Rouge → Bleu → Vert"
