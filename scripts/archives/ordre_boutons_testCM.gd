extends CanvasGroup

# La séquence CORRECTE (0=Omottan, 1=Chinapon, 2=Dindia)
var sequence_correcte = [0, 1, 2]
var sequence_joueur = []  # Ce que le joueur clique
var etape_actuelle = 0    # Combien de clics corrects

@onready var CanvasText = $CanvasLabelSuccess  # Change par le nom de ton Label
@onready var texte = CanvasText.get_node("LabelSuccess")
@onready var bouton_omottan = $EmpireOmottan
@onready var bouton_chinapon = $Chinapon
@onready var bouton_dindia = $Dindia
@onready var bouton_sultanat = $Sultanat
@onready var bouton_capistan = $Capistan
@onready var bouton_europea = $Europea

func _ready():
	# CONNECTE les boutons (ultra important !)
	var omot = bouton_omottan.get_node("BoutonOmottan")
	var china = bouton_chinapon.get_node("BoutonChinapon")
	var dindia = bouton_dindia.get_node("BoutonDindia")
	var sult = bouton_sultanat.get_node("BoutonSultanat")
	var cap = bouton_capistan.get_node("BoutonCapistan")
	var eur = bouton_europea.get_node("BoutonEuropea")
	
	omot.pressed.connect(_on_bouton_omottan)
	china.pressed.connect(_on_bouton_chinapon)
	dindia.pressed.connect(_on_bouton_dindia)
	sult.pressed.connect(_on_bouton_sultanat)
	cap.pressed.connect(_on_bouton_capistan)
	eur.pressed.connect(_on_bouton_europea)
	
	texte.visible = false
	
	reset_sequence()  # Remet tout à zéro au début

func _on_bouton_omottan():
	verifie_clic(0)  # 0 = Omottan

func _on_bouton_chinapon():
	verifie_clic(1)  # 1 = Chinapon

func _on_bouton_dindia():
	verifie_clic(2)  # 2 = Dindia
	
func _on_bouton_sultanat():
	verifie_clic(3)
	
func _on_bouton_capistan():
	verifie_clic(4)
	
func _on_bouton_europea():
	verifie_clic(5)  

func verifie_clic(bouton_id):
	# Ajoute le clic du joueur
	sequence_joueur.append(bouton_id)
	
	# Vérifie si c'est le bon ordre
	if bouton_id == sequence_correcte[etape_actuelle]:
		etape_actuelle += 1
		texte.text = "✅ BON ! Étape " + str(etape_actuelle) + "/3"
		print("✅ BON ! Étape " + str(etape_actuelle) + "/3")
		
		# SÉQUENCE COMPLÈTE !
		if etape_actuelle == 3:
			texte.visible = true
			texte.text = "🎉 PARFAIT ! Tu as réussi !"
			reinitialise_tout()
	else:
		print("❌ MAUVAIS ORDRE ! Recommence.")
		texte.visible = true
		texte.text = "❌ MAUVAIS ORDRE ! Recommence."
		reinitialise_tout()

func reset_sequence():
	sequence_joueur.clear()
	etape_actuelle = 0
	#texte.text = "Clique : Rouge → Bleu → Vert"

func reinitialise_tout():
	# Attendre 2 secondes puis reset
	#await get_tree().create_timer(2.0).timeout
	reset_sequence()
