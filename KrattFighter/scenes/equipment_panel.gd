extends PanelContainer
@onready var head_panel: Panel = $EquipmentContainer/HeadPanel
@onready var l_hand_panel: Panel = $"EquipmentContainer/Hand&BodyMargin/HBoxContainer/LHandMargin/LHandPanel"
@onready var body_panel: Panel = $"EquipmentContainer/Hand&BodyMargin/HBoxContainer/BodyPanel"
@onready var r_hand_panel: Panel = $"EquipmentContainer/Hand&BodyMargin/HBoxContainer/RHandMargin/RHandPanel"
@onready var l_leg_panel: Panel = $EquipmentContainer/LegMargin/HBoxContainer/LHandMargin/L_LegPanel
@onready var r_leg_panel: Panel = $EquipmentContainer/LegMargin/HBoxContainer/MarginContainer/RLegPanel




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func high_light_panel(panel:Panel)->void:
	panel.modulate=Color.REBECCA_PURPLE
func un_high_light_panel(panel:Panel)->void:
	panel.modulate=Color.AQUA


func _on_inventory_container_high_light(body_part: int) -> void:
	match body_part:
		ItemManager.BODY_PART.HAND:
			high_light_panel(l_hand_panel)
			high_light_panel(r_hand_panel)
		ItemManager.BODY_PART.LEG:
			high_light_panel(l_leg_panel)
			high_light_panel(r_leg_panel)
		ItemManager.BODY_PART.HEAD:
			high_light_panel(head_panel)
		ItemManager.BODY_PART.CHEST:
			high_light_panel(body_panel)


func _on_inventory_container_un_high_light(body_part: int) -> void:
	match body_part:
		ItemManager.BODY_PART.HAND:
			high_light_panel(l_hand_panel)
			high_light_panel(r_hand_panel)
		ItemManager.BODY_PART.LEG:
			high_light_panel(l_leg_panel)
			high_light_panel(r_leg_panel)
		ItemManager.BODY_PART.HEAD:
			high_light_panel(head_panel)
		ItemManager.BODY_PART.CHEST:
			high_light_panel(body_panel)
