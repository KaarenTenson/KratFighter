extends PanelContainer
class_name EquipmentPanel
@onready var head_panel: Panel = $EquipmentContainer/HeadPanel
@onready var l_hand_panel: Panel = $"EquipmentContainer/Hand&BodyMargin/HBoxContainer/LHandMargin/LHandPanel"
@onready var body_panel: Panel = $"EquipmentContainer/Hand&BodyMargin/HBoxContainer/BodyPanel"
@onready var r_hand_panel: Panel = $"EquipmentContainer/Hand&BodyMargin/HBoxContainer/RHandMargin/RHandPanel"
@onready var l_leg_panel: Panel = $EquipmentContainer/LegMargin/HBoxContainer/LHandMargin/L_LegPanel
@onready var r_leg_panel: Panel = $EquipmentContainer/LegMargin/HBoxContainer/MarginContainer/RLegPanel

var btn_dict:Dictionary
var translate_enum_dict:Dictionary
var translate_side_dict:Dictionary
var active_panel:Panel
signal switch_btn(btn: InventorySlot)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	translate_enum_dict={
	ItemManager.BODY_PART.HAND:[l_hand_panel,r_hand_panel],
	ItemManager.BODY_PART.LEG:[l_leg_panel ,r_leg_panel],
	ItemManager.BODY_PART.HEAD: [head_panel],
	ItemManager.BODY_PART.CHEST: [body_panel]
	}
	btn_dict={
		head_panel: null,
		body_panel: null,
		l_hand_panel:null,
		r_hand_panel:null,
		l_leg_panel:null,
		r_leg_panel:null,
		
	}
	translate_side_dict={
		l_hand_panel: true,
		r_hand_panel: false,
		l_leg_panel: true,
		r_leg_panel:false,
		head_panel: false,
		body_panel:false,
	}
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _process(delta: float) -> void:
	pass

func _on_inventory_container_high_light(body_part: int) -> void:
	for el in translate_enum_dict[body_part]:
		el.add_theme_stylebox_override("panel", load("res://themes/high_ligh_panel.tres"))


func _on_inventory_container_un_high_light(body_part: int) -> void:
	for el in translate_enum_dict[body_part]:
		el.add_theme_stylebox_override("panel", load("res://themes/un_high_light_panel.tres"))

func is_equpping(body_part:int):
	match body_part:
		ItemManager.BODY_PART.HAND:
			return is_inside(l_hand_panel) or is_inside(r_hand_panel)
		ItemManager.BODY_PART.LEG:
			return is_inside(l_leg_panel) or is_inside(r_leg_panel)
		ItemManager.BODY_PART.HEAD:
			return is_inside(head_panel)
		ItemManager.BODY_PART.CHEST:
			return is_inside(body_panel)
func is_inside(panel:Panel)->bool:
	var panel_size:Vector2=panel.get_global_rect().size
	var mouse_pos:Vector2=get_global_mouse_position()
	var panel_pos:Vector2=panel.get_global_rect().position
	if (mouse_pos.x > panel_pos.x and 
	mouse_pos.x < panel_pos.x + panel_size.x and 
	mouse_pos.y > panel_pos.y and 
	panel_pos.y < panel_pos.y + panel_size.y):
		active_panel=panel
		return true
	return false
func is_button_equipped(button: InventorySlot)-> bool:
	for btn in btn_dict.values():
		if(btn==button):
			return true
	return false
func add_item(button:InventorySlot):
	if(btn_dict[active_panel]!=null):
		if(btn_dict[active_panel]==button):
			return
		remove_btn(button)
		switch_btn.emit(btn_dict[active_panel])
	if(is_button_equipped(button)):
		remove_btn(button)
	var btn_item=button.item
	ItemManager.set_bodypart(btn_item.name, translate_side_dict[active_panel])
	btn_dict[active_panel]=button
	button.reparent(active_panel)
	
func remove_btn(btn: InventorySlot) -> void:
	for key in btn_dict.keys():
		if(btn_dict[key]==btn):
			var btn_item:Items=btn_dict[key].item
			ItemManager.remove_item(btn_item.body_part, translate_side_dict[key])
			btn_dict[key]=null
			
