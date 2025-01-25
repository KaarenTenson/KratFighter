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
var active_panel:Panel

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func high_light_panel(panel:Panel)->void:
	panel.modulate=Color.REBECCA_PURPLE
func un_high_light_panel(panel:Panel)->void:
	panel.modulate=Color.AQUA


func _on_inventory_container_high_light(body_part: int) -> void:
	for el in translate_enum_dict[body_part]:
		high_light_panel(el)


func _on_inventory_container_un_high_light(body_part: int) -> void:
	for el in translate_enum_dict[body_part]:
		un_high_light_panel(el)

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
func add_item(button:InventorySlot):
	btn_dict[active_panel]=button
	button.reparent(active_panel)
	
	
	
func _on_inventory_container_remove_btn(btn: InventorySlot) -> void:
	for key in btn_dict.keys():
		if(btn_dict[key]==btn):
			btn_dict[key]=null
