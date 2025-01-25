extends Node

enum ITEMS {
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
	ITEMS.SWORD: "es",
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
	pass # Replace with function body.
