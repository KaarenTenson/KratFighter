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
		self.sprite.position=item.sprite_position
		self.sprite.rotation=deg_to_rad(item.sprite_rotation)
		self.sprite.region_enabled=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
