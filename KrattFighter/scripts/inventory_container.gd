extends GridContainer
const INVENTORY_SLOT = preload("res://scenes/InventorySlot.tscn")
var inv_instance:InventorySlot
var cur_button:InventorySlot=null
@onready var info_box:InfoBox=$"../../../../info_box"
@onready var equipment_panel: EquipmentPanel = $"../../Equipment/EquipmentMargin/EquipmentPanel"

signal high_light(body_part:int)
signal un_high_light(body_part:int)
signal remove_btn(btn:InventorySlot)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inv_instance=INVENTORY_SLOT.instantiate()
	for item in ItemManager.current_items:
		var new_obj :=inv_instance.duplicate()
		find_empty().add_child(new_obj)
		new_obj.pressed.connect(handle_btn_input.bind(new_obj))
		new_obj.mouse_entered.connect(handle_hover.bind(new_obj))
		new_obj.mouse_exited.connect(handle_hover_exit.bind(new_obj))
		new_obj.set_item(ItemManager.items_dict[item])
		new_obj.set_position(Vector2(0,0))
		

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
	btn.top_level=true
	btn.in_air=true
	high_light.emit(btn.item.body_part)
	await get_tree().create_timer(0.2).timeout
	cur_button=btn

func _on_input_manager_global_clicked() -> void:
	if(cur_button)==null:
		return
	var is_in_invetory=false
	if(equipment_panel.btn_dict.values().has(cur_button)):
		is_in_invetory=true
	if(equipment_panel.is_equpping(cur_button.item.body_part)):
		if(!is_in_invetory):
			equipment_panel.add_item(cur_button)
	else:
		if(is_in_invetory):
			remove_btn.emit(cur_button)
			cur_button.reparent(find_empty())
	un_high_light.emit(cur_button.item.body_part)
	cur_button.free_mouse()
	await  get_tree().create_timer(0.2).timeout
	cur_button=null


func _on_equipment_panel_switch_btn(btn: InventorySlot) -> void:
	await get_tree().create_timer(0.21).timeout
	cur_button=null
	btn.reparent(find_empty())
	handle_btn_input(btn)
func handle_hover(btn:InventorySlot):
	if(btn.in_air):
		info_box.visible=false
		return
	info_box.visible=true
	info_box.set_item(btn.item)
	info_box.global_position=btn.global_position+ btn.get_rect().size
func handle_hover_exit(btn:InventorySlot):
	info_box.visible=false
