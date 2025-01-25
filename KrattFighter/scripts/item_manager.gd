extends Node

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
	ITEMS.PITCHFORK: "es"
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
func _ready() -> void:
	kratt_body.left_hand=ITEMS.SWORD
