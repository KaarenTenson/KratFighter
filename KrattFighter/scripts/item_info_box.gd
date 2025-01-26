extends Panel
class_name InfoBox
@onready var name_label: Label = $MarginContainer/VBoxContainer/name
@onready var damage_label: Label = $MarginContainer/VBoxContainer/damge
@onready var body_label: Label = $MarginContainer/VBoxContainer/body_part
@onready var desc_label: Label = $MarginContainer/VBoxContainer/desc


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func set_item(item:Items):
	self.name_label.text="name: "+ str(item.str_name)
	self.damage_label.text="damage: "+  str(item.damage)
	self.body_label.text="bodypart: "+ translate_body_part(item.body_part)
	self.desc_label.text="desc: "+ item.desc
func translate_body_part(part:int)->String:
	match part:
		ItemManager.BODY_PART.HEAD:
			return "head"
		ItemManager.BODY_PART.CHEST:
			return "chest"
		ItemManager.BODY_PART.HAND:
			return "hand"
		ItemManager.BODY_PART.LEG:
			return "leg"
	return ""
