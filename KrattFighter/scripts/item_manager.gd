extends Node
signal kratt_changed()
enum ITEMS {
	WOOD_HAND, # DONE
	WOOD_HEAD, # DONE
	WOOD_CHEST, # DONE
	WOOD_LEG, # DONE
	
	GRIEVING_BLADE, # DONE
	PITCH_FORK, # DONE
	BUCKET, # DONE ++++
	PLATED_ARMOR, # DONE
	AXE, # DONE ++++
	COLORFUL_HEADWEAR, # DONE ++++
	SYCHTE, # DONE
	TIGHTLY_SEALED_SACK, # DONE
	PLOUGH, # DONE
	COOKPOT, # DONE
	SOFT_SHIRT, # DONE
	HOE, # DONE
	STURDY_BRANCH, # DONE
	MILLSTONE, # DONE
	STRAW_HEAD, # DONE
	FERTILITY_GOD_STATUE, # DONE
	FALSE_MAIDENS_TAIL, # DONE
	SMALL_SPRUCE, # DONE
	MOTHER_STONE, # DONE
	CONQUERORS_HELMET, # DONE
	BARREL # DONE ++++
	
}
@export var itemsEnum: ITEMS
enum BODY_PART {
	HEAD,
	CHEST,
	HAND,
	LEG
}
@export var body_Enum:BODY_PART
enum ABILITY {
	NONE,
	FIRE,
}
@export var ability_enum: ABILITY
var items_dict:Dictionary={
	ITEMS.WOOD_HEAD: load("res://items/wood_head.tres"),
	ITEMS.GRIEVING_BLADE: load("res://items/sword.tres"),
	ITEMS.WOOD_CHEST: load("res://items/wood_chest.tres"),
	ITEMS.WOOD_LEG: load("res://items/wood_leg.tres"),
	ITEMS.WOOD_HAND: load("res://items/wood_hand.tres"),
	ITEMS.PITCH_FORK: load("res://items/pitchfork.tres"),
	ITEMS.BUCKET: load("res://items/bucket.tres"),
	ITEMS.PLATED_ARMOR: load("res://items/plated_armor.tres"),
	ITEMS.AXE: load("res://items/axe.tres"),
	ITEMS.COLORFUL_HEADWEAR: load("res://items/colorful_hat.tres"),
	ITEMS.SYCHTE: load("res://items/sychte.tres"),
	ITEMS.TIGHTLY_SEALED_SACK: load("res://items/tightly_sealed_sacktres.tres"),
	ITEMS.PLOUGH: load("res://items/plough.tres"),
	ITEMS.COOKPOT: load("res://items/cookpot.tres"),
	ITEMS.SOFT_SHIRT: load("res://items/soft_shirt.tres"),
	ITEMS.HOE: load("res://items/hoe.tres"),
	ITEMS.STURDY_BRANCH: load("res://items/sturdy_branch.tres"),
	ITEMS.MILLSTONE: load("res://items/millstone.tres"),
	ITEMS.STRAW_HEAD: load("res://items/straw_head.tres"),
	ITEMS.FERTILITY_GOD_STATUE: load("res://items/fertility_god_statue.tres"),
	ITEMS.FALSE_MAIDENS_TAIL: load("res://items/false_maidens_tail.tres"),
	ITEMS.SMALL_SPRUCE: load("res://items/small_spruce.tres"),
	ITEMS.MOTHER_STONE: load("res://items/mother_stone.tres"),
	ITEMS.CONQUERORS_HELMET: load("res://items/conquerors_helmet.tres"),
	ITEMS.BARREL: load("res://items/barrel.tres")
}
class KrattBodyClass: 
	var head: int =ITEMS.WOOD_HEAD
	var body: int =ITEMS.WOOD_CHEST
	var left_hand: int  =ITEMS.WOOD_HAND
	var right_hand: int = ITEMS.WOOD_HAND
	var left_leg: int =ITEMS.WOOD_LEG
	var right_leg: int= ITEMS.WOOD_LEG
var current_items:Array[int]=[ITEMS.BARREL, ITEMS.SYCHTE, ITEMS.STURDY_BRANCH, ITEMS.GRIEVING_BLADE]
var kratt_body:=KrattBodyClass.new()

# Called when the node enters the scene tree for the first time.
func set_bodypart(item:int, isLeft:bool):
	match (items_dict[item] as Items).body_part:
		BODY_PART.HEAD: kratt_body.head=item
		BODY_PART.CHEST: kratt_body.body=item
		BODY_PART.HAND: 
			if(isLeft):
				kratt_body.left_hand=item
			else:
				kratt_body.right_hand=item
		BODY_PART.LEG: 
			if(isLeft):
				kratt_body.left_leg=item
			else:
				kratt_body.right_leg=item
	kratt_changed.emit()
# Called when the node enters the scene tree for the first time.
func remove_item(body_part:int, isLeft:bool):
	match body_part:
		BODY_PART.HEAD: kratt_body.head=ITEMS.WOOD_HEAD
		BODY_PART.CHEST: kratt_body.body=ITEMS.WOOD_CHEST
		BODY_PART.HAND: 
			if(isLeft):
				kratt_body.left_hand=ITEMS.WOOD_HAND
			else:
				kratt_body.right_hand=ITEMS.WOOD_HAND
		BODY_PART.LEG: 
			if(isLeft):
				kratt_body.left_leg=ITEMS.WOOD_LEG
			else:
				kratt_body.right_leg=ITEMS.WOOD_LEG
	kratt_changed.emit()
	
func _ready() -> void:
	kratt_body.head=ITEMS.WOOD_HEAD
	kratt_body.body=ITEMS.WOOD_CHEST
	kratt_body.left_hand=ITEMS.WOOD_HAND
	kratt_body.right_hand=ITEMS.WOOD_HAND
	kratt_body.left_leg=ITEMS.WOOD_LEG
	kratt_body.right_leg=ITEMS.WOOD_LEG
	
