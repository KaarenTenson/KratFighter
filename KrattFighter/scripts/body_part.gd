extends Node2D
class_name BodyPart
var item:Items
var current_hp:int
signal part_dead(body_part_obj:BodyPart)
func set_items(item:Items):
	add_child(item.scene.instantiate())
	current_hp=item.hp
	self.item=item
# Called when the node enters the scene tree for the first time.
func get_damage(damage:int):
	current_hp-=damage
	if(current_hp<=0):
		part_dead.emit(self)
		queue_free()
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
