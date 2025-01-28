extends Button
class_name InventorySlot
var is_iniventory:=true
var is_active=false:
	set(value):
		if value==false:
			free_mouse()
			is_active=value
		else:
			is_active=value
			self.top_level = true
var item:Items
var margin:=self.get_rect().size.x/2
func set_item(item:Items):
	self.item=item
	self.icon=item.texture
func _ready():
	pass
func _process(delta: float) -> void:
	if(is_active):
		self.global_position=get_global_mouse_position()+Vector2(-margin, -margin)
func free_mouse():
	self.top_level=false
	self.set_position(Vector2(0,0))
