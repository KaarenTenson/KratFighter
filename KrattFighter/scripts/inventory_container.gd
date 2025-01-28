extends GridContainer
const INVENTORY_SLOT = preload("res://scenes/InventorySlot.tscn")
var inv_instance:InventorySlot
@onready var info_box:InfoBox=$"../../../../info_box"
@onready var equipment_panel: EquipmentPanel = $"../../Equipment/EquipmentMargin/EquipmentPanel"

signal high_light(body_part:int)
signal un_high_light(body_part:int)
signal remove_btn(btn:InventorySlot)
var wait_before_click:bool=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inv_instance=INVENTORY_SLOT.instantiate()
	for item in ItemManager.current_items:
		var new_obj :=inv_instance.duplicate()
		if(find_empty()==null):
			return
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
	if(btn.is_active):
		if equipment_panel.is_equpping(btn.item.body_part):
			equipment_panel.add_item(btn)
			btn.is_iniventory=false
		elif(not btn.is_iniventory):
			equipment_panel.remove_btn(btn)
			btn.reparent(find_empty())
		btn.is_active=false
		un_high_light.emit(btn.item.body_part)
	else:
		info_box.visible=false
		btn.is_active=true
		high_light.emit(btn.item.body_part)

func _on_equipment_panel_switch_btn(btn: InventorySlot) -> void:
	handle_btn_input(btn)
	
func handle_hover(btn:InventorySlot):
	if(btn.is_active):
		info_box.visible=false
		return
	info_box.visible=true
	info_box.set_item(btn.item)
	info_box.global_position=btn.global_position+ btn.get_rect().size
func handle_hover_exit(btn:InventorySlot):
	info_box.visible=false
