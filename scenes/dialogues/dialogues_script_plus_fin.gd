extends Control

@export var parts: Array[String] = ["Texte1","Texte2"]
@export var scene: String = "Scene"

@onready var label = $PanelContainer/RichTextLabel
var textIndex = 0

func _ready() -> void:
	label.text = parts[textIndex]

func goToScene(scene: String) -> void:
	get_tree().change_scene_to_file(scene)

func _on_button_pressed() -> void:
	textIndex = (textIndex + 1) 
	if textIndex == parts.size():
		goToScene(scene)
	else:
		label.text = parts[textIndex]
