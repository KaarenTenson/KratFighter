extends Node2D
class_name Player
@onready var head: BodyPart = $Head
@onready var chest: BodyPart = $chest
@onready var left_hand: BodyPart = $LeftHand
@onready var right_hand: BodyPart = $rightHand
@onready var left_leg: BodyPart = $leftLeg
@onready var right_leg: BodyPart = $rightleg

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_body()
	ItemManager.kratt_changed.connect(refresh_body)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func refresh_body():
	for child in get_children():
		(child.get_children()[0] as StaticBody2D).queue_free()
	create_body()
func create_body():
	head.set_items(ItemManager.items_dict[ItemManager.kratt_body.head])
	chest.set_items(ItemManager.items_dict[ItemManager.kratt_body.body])
	left_hand.set_items(ItemManager.items_dict[ItemManager.kratt_body.left_hand])
	right_hand.set_items(ItemManager.items_dict[ItemManager.kratt_body.right_hand])
	left_leg.set_items(ItemManager.items_dict[ItemManager.kratt_body.left_leg])
	right_leg.set_items(ItemManager.items_dict[ItemManager.kratt_body.right_leg])
func left_attack():
	animation_player.play("left_attack")
func get_damage(body_part:int, is_left:bool):
	match body_part:
		ItemManager.BODY_PART.HEAD: print("got damage")
		ItemManager.BODY_PART.CHEST: print("got damage")
		ItemManager.BODY_PART.HAND:
			if(is_left):
				print("got damage")
			else:
				print("got damage")
		ItemManager.BODY_PART.LEG: 
			if(is_left):
				print("got damage")
			else:
				print("got damage")
