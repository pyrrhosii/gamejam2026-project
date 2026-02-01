extends Node2D

var sequence_correcte = ["Ottoman", "Chinapon", "Dindia"]
var sequence_joueur = []  # Ce que le joueur clique
var etape_actuelle = 0    # Combien de clics corrects


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On clique sur une marque", shape_idx)
		$AreaSultanat/Sultanat/Panel.visible = !$AreaSultanat/Sultanat/Panel.visible
		verifySequence("Sultanat")

func _on_area_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On clique sur une marque", shape_idx)
		$AreaChinapon/Chinapon/Panel.visible = !$AreaChinapon/Chinapon/Panel.visible
		verifySequence("Chinapon")

func _on_area_2d_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On clique sur une marque", shape_idx)
		$AreaOttoman/Ottoman/Panel.visible = !$AreaOttoman/Ottoman/Panel.visible
		verifySequence("Ottoman")

func _on_area_capistan_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On clique sur une marque", shape_idx)
		$AreaCapistan/Capistan/Panel.visible = !$AreaCapistan/Capistan/Panel.visible
		verifySequence("Capistan")

func _on_area_dindia_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On clique sur une marque", shape_idx)
		$AreaDindia/Dindia/Panel.visible = !$AreaDindia/Dindia/Panel.visible
		verifySequence("Dindia")

func _on_area_europea_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		print("On clique sur une marque", shape_idx)
		$AreaEuropea/Europea/Panel.visible = !$AreaEuropea/Europea/Panel.visible
		verifySequence("Europea")

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
