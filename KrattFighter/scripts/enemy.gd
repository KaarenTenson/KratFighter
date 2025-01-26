extends Node2D
class_name Enemy
@onready var head: BodyPart = $Head
@onready var chest: BodyPart = $chest
@onready var left_hand: BodyPart = $LeftHand
@onready var right_hand: BodyPart = $rightHand
@onready var left_leg: BodyPart = $leftLeg
@onready var right_leg: BodyPart = $rightleg

@export var chance_for_item:=0.5
signal attack(body_part: int, is_left:bool)
var loot_pool:Dictionary={
	ItemManager.BODY_PART.HEAD:[],
	ItemManager.BODY_PART.CHEST:[],
	ItemManager.BODY_PART.HAND:[],
	ItemManager.BODY_PART.LEG:[],
}
var body_class:=ItemManager.KrattBodyClass.new()
func start_attack():
	var body_part:int=ItemManager.BODY_PART.values().pick_random()
	var is_left:bool= randf()>0.5
	attack.emit(body_part, is_left)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fill_loot_pool()
	create_random_body()
	create_body()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func fill_loot_pool():
	for item in ItemManager.ITEMS.values():
		print(item)
		var item_obj:Items=ItemManager.items_dict[item]
		if(item_obj.default):
			continue
		loot_pool[item_obj.body_part].append(item)
func create_random_body():
	if(randf_range(0,1)>chance_for_item):
		body_class.head=(loot_pool[ItemManager.BODY_PART.HEAD] as Array).pick_random()
	else:
		body_class.head=ItemManager.ITEMS.WOOD_HEAD
	if(randf_range(0,1)>chance_for_item):
		body_class.body=(loot_pool[ItemManager.BODY_PART.CHEST] as Array).pick_random()
	else:
		body_class.body=ItemManager.ITEMS.WOOD_CHEST
	if(randf_range(0,1)>chance_for_item):
		body_class.left_hand=(loot_pool[ItemManager.BODY_PART.HAND] as Array).pick_random()
	else:
		body_class.left_hand=ItemManager.ITEMS.WOOD_HAND
	if(randf_range(0,1)>chance_for_item):
		body_class.right_hand=(loot_pool[ItemManager.BODY_PART.HAND] as Array).pick_random()
	else:
		body_class.right_hand=ItemManager.ITEMS.WOOD_HAND
	if(randf_range(0,1)>chance_for_item):
		body_class.left_leg=(loot_pool[ItemManager.BODY_PART.LEG] as Array).pick_random()
	else:
		body_class.left_leg=ItemManager.ITEMS.WOOD_LEG
	if(randf_range(0,1)>chance_for_item):
		body_class.right_hand=(loot_pool[ItemManager.BODY_PART.HAND] as Array).pick_random()
	else:
		body_class.right_hand=ItemManager.ITEMS.WOOD_HAND
func create_body():
	head.set_items(ItemManager.items_dict[body_class.head])
	chest.set_items(ItemManager.items_dict[body_class.body])
	left_hand.set_items(ItemManager.items_dict[body_class.left_hand])
	right_hand.set_items(ItemManager.items_dict[body_class.right_hand])
	left_leg.set_items(ItemManager.items_dict[body_class.left_leg])
	right_leg.set_items(ItemManager.items_dict[body_class.right_leg])
