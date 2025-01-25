extends Node2D
class_name BodyPart
var item:Items

func set_items(item:Items):
	add_child(item.scene.instantiate())
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
