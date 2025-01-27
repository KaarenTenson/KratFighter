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
		part_dead.emit(self)
		var node:=RigidBody2D.new()
		for child in self.get_children():
			if(child is CollisionPolygon2D):
				child.reparent(node)
		self.reparent(node)
		root.add_child(node)
		await  get_tree().create_timer(2).timeout
		queue_free()
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
