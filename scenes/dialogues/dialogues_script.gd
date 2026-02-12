extends Control

@export var parts: Array[String] = ["Texte1","Texte2", "Texte3"]

@onready var label := $PanelContainer/RichTextLabel

var textIndex := 0

func _ready() -> void:
	label.text = parts[textIndex]
	visibility_changed.connect(_on_visibility_changed)

func _on_button_pressed() -> void:
	textIndex = textIndex + 1
	if textIndex == parts.size():
		hide()
		DialogConst.dialogIsOpen = false
	else:
		label.text = parts[textIndex]
		
func _on_visibility_changed() -> void:
	if visible:
		textIndex = 0
		label.text = parts[textIndex]
