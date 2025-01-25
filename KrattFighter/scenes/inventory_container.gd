extends GridContainer
const INVENTORY_SLOT = preload("res://scenes/InventorySlot.tscn")
var inv_instance:InventorySlot
var cur_button:InventorySlot=null

signal high_light(body_part:int)
signal un_high_light(body_part:int)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inv_instance=INVENTORY_SLOT.instantiate()
	for item in ItemManager.current_items:
		var new_obj :=inv_instance.duplicate()
		new_obj.clicked.connect(handle_btn_input)
		new_obj.set_item(ItemManager.items_dict[item])
		find_empty().add_child(new_obj)

func find_empty()->Panel:
	for child in self.get_children():
		if(len(child.get_children())==0):
			return child
	return null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func handle_btn_input(btn:InventorySlot):
	if(cur_button!=null):
		return
	high_light.emit(btn.item.body_part)
	await get_tree().create_timer(0.2).timeout
	cur_button=btn

func _on_input_manager_global_clicked() -> void:
	if(cur_button)==null:
		return
	un_high_light.emit(cur_button.item.body_part)
	cur_button.free_mouse()
	await  get_tree().create_timer(0.2).timeout
	cur_button=null
	
