extends Node2D
@onready var head: BodyPart = $Head
@onready var chest: BodyPart = $chest
@onready var left_hand: BodyPart = $LeftHand
@onready var right_hand: BodyPart = $rightHand
@onready var left_leg: BodyPart = $leftLeg
@onready var right_leg: BodyPart = $rightleg


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_body()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func create_body():
	head.set_items(ItemManager.items_dict[ItemManager.kratt_body.head])
	chest.set_items(ItemManager.items_dict[ItemManager.kratt_body.body])
	left_hand.set_items(ItemManager.items_dict[ItemManager.kratt_body.left_hand])
	right_hand.set_items(ItemManager.items_dict[ItemManager.kratt_body.right_hand])
	left_leg.set_items(ItemManager.items_dict[ItemManager.kratt_body.left_leg])
	right_leg.set_items(ItemManager.items_dict[ItemManager.kratt_body.right_leg])
