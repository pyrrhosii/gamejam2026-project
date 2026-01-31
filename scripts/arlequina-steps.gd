extends Node

var arlequinaAdvance = {
	globe = 0,
	library = 0,
	treasure = 0
}

func globeSuccess() -> void:
	arlequinaAdvance["globe"] = arlequinaAdvance["globe"]+1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
