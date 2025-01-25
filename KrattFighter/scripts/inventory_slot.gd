extends Button
class_name InventorySlot
signal clicked(btn:InventorySlot)
var in_air:bool=false
var item:Items
var margin:=self.get_rect().size.x/2
func set_item(item:Items):
	self.item=item
	self.icon=item.texture
func _ready():
	pass
func _process(delta: float) -> void:
	if(in_air):
		self.global_position=get_global_mouse_position()+Vector2(-margin, -margin)
func _on_pressed() -> void:
	self.top_level=true
	in_air=true
	#set_process_input(false)
	clicked.emit(self)
func free_mouse():
	self.top_level=false
	in_air=false
	self.set_position(Vector2(0,0))
	self.icon=ItemManager.items_dict[ItemManager.ITEMS.SWORD].texture
