extends Control

@export var parts: Array[String] = ["Texte1","Texte2"]

@onready var label = $PanelContainer/RichTextLabel
var textIndex = 0

func _ready() -> void:
	label.text = parts[textIndex]

func _on_button_pressed() -> void:
	textIndex = (textIndex + 1) 
	if textIndex == parts.size():
		hide()
		textIndex = 0
		DialogConst.dialogIsOpen = false
	else:
		label.text = parts[textIndex]
