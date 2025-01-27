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
	var root:=get_tree().root
	if(current_hp<=0):
		die()
func _ready() -> void:
	pass # Replace with function body.

func die():
	var scene_root:=get_tree().root
	part_dead.emit(self)
	var falling_part:=RigidBody2D.new()
	falling_part.global_position=self.global_position
	for child in self.get_child(0).get_children():
		child.reparent(falling_part)
	scene_root.add_child(falling_part)
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
