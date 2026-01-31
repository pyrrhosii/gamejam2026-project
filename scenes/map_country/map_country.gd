extends Area2D

@export var id: int = -1
@export var tooltipText: String = "une descriptions..."

signal countryClicked(countryId: int)

@onready var tooltipLocation: Marker2D = $TooltipLocation
@onready var tooltip = $CanvasLayer/Label

func _ready():
	tooltip.hide()
	tooltip.text = tooltipText
	await get_tree().process_frame  # ensure size is valid to adjust the offset with the set text
	tooltip.global_position = tooltipLocation.global_position - tooltip.size * 0.5 
	print("✅ Area2D prête - Label trouvé: ", tooltip)

func _on_mouse_entered():
	tooltip.show()
	print("🖱️ Souris ENTER")

func _on_mouse_exited():
	tooltip.hide()
	print("🖱️ Souris EXIT")

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MASK_LEFT and event.is_pressed():
		countryClicked.emit(id)
		print("emit Country clicked")
