extends Node
signal kratt_changed()
enum ITEMS {
	WOOD_HAND,
	WOOD_HEAD,
	WOOD_CHEST,
	WOOD_LEG,
	SWORD,
	PITCHFORK
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
	ITEMS.SWORD: load("res://items/sword.tres"),
	ITEMS.WOOD_CHEST: load("res://items/wood_chest.tres"),
	ITEMS.WOOD_LEG: load("res://items/wood_leg.tres"),
	ITEMS.WOOD_HAND: load("res://items/wood_hand.tres")
}
class KrattBodyClass: 
	var head: int 
	var body: int 
	var left_hand: int 
	var right_hand: int 
	var left_leg: int
	var right_leg: int
var current_items:Array[int]=[]
var kratt_body:=KrattBodyClass.new()

# Called when the node enters the scene tree for the first time.
func set_body(item:int, isLeft:bool):
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
				kratt_body.left_hand=item
				kratt_body.right_hand=item
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
				kratt_body.left_hand=ITEMS.WOOD_HAND
				kratt_body.right_hand=ITEMS.WOOD_HAND
	kratt_changed.emit()
	
func _ready() -> void:
	kratt_body.left_hand=ITEMS.WOOD_HAND
	kratt_body.head=ITEMS.WOOD_HEAD
	kratt_body.right_hand=ITEMS.WOOD_HAND
	kratt_body.body=ITEMS.WOOD_CHEST
	kratt_body.left_leg=ITEMS.WOOD_LEG
	kratt_body.right_leg=ITEMS.WOOD_LEG
	
