extends Control

@export var parts: Array[String] = ["Texte1","Texte2"]
@onready var label = $PanelContainer/RichTextLabel
var textIndex = 0

func _ready() -> void:
	label.text = parts[textIndex]
	visibility_changed.connect(_on_visibility_changed)

func _on_button_pressed() -> void:
	print("textIndex", textIndex)
	if textIndex == parts.size():
		hide()
		textIndex = 0
		DialogConst.dialogIsOpen = false
	else:
		label.text = parts[textIndex]
		textIndex = (textIndex + 1) 
		
func _on_visibility_changed():
	if visible:
		textIndex = 0
		label.text = parts[textIndex]
		print ("C'est quoi ce bordel?!")
