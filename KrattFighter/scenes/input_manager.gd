extends Node

signal global_clicked
func _input(event: InputEvent) -> void:
	if(event is InputEventMouse):
		if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
			global_clicked.emit()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
