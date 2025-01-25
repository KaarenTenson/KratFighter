extends StaticBody2D
class_name BodyPart
@export var sprite: Sprite2D
var item:Items

func set_items(item:Items):
	if(item==null): return
	self.item=item
	print(item.texture)
	if(item.texture!=null):
		self.sprite.texture=item.texture
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
