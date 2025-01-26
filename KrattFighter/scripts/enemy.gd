extends Node2D
class_name Enemy
@onready var animation_player: AnimationPlayer = $AnimationPlayer


@onready var head: BodyPart = $Head
@onready var chest: BodyPart = $chest
@onready var left_hand: BodyPart = $LeftHand
@onready var right_hand: BodyPart = $rightHand
@onready var left_leg: BodyPart = $leftLeg
@onready var right_leg: BodyPart = $rightleg

@onready var head_HP_label = $"../UILayer/EnemyPanel/VBoxContainer/HeadContainer/CurrentHPLabel"
@onready var chest_HP_label = $"../UILayer/EnemyPanel/VBoxContainer/BodyContainer/CurrentHPLabel"
@onready var left_hand_HP_label = $"../UILayer/EnemyPanel/VBoxContainer/LHanContainer/CurrentHPLabel"
@onready var right_hand_HP_label = $"../UILayer/EnemyPanel/VBoxContainer/RHandContainer/CurrentHPLabel"
@onready var left_leg_HP_label = $"../UILayer/EnemyPanel/VBoxContainer/LLegContainer/CurrentHPLabel"
@onready var right_leg_HP_label = $"../UILayer/EnemyPanel/VBoxContainer/RLegContainer/CurrentHPLabel"

@export var chance_for_item:=0.5
@export var defence_chance_defending:=0.75
@export var defence_change:=0.25
var failed_attack_count:=0


enum ENEMY_STATE{IDLE, ATTACK, DEFEND, ATTACKING}
var current_state=ENEMY_STATE.IDLE
var current_weapon:BodyPart=null
signal attack_signal(body_part: int, is_left:bool, damage:int)
var loot_pool:Dictionary={
	ItemManager.BODY_PART.HEAD:[],
	ItemManager.BODY_PART.CHEST:[],
	ItemManager.BODY_PART.HAND:[],
	ItemManager.BODY_PART.LEG:[],
}
var body_class:=ItemManager.KrattBodyClass.new()
func attack():
	var body_part:int=ItemManager.BODY_PART.values().pick_random()
	var is_left:bool= randf()>0.5
	current_weapon=get_random_weapon()
	attack_signal.emit(body_part, is_left, current_weapon.item.damage)
func get_result(success:bool):
	if(success==false):
		failed_attack_count+=1
		if(failed_attack_count>2):
			current_state=ENEMY_STATE.DEFEND
			failed_attack_count=0
func get_damage(damage:int, body_part:int, is_left:bool)->bool:
	var part:BodyPart=translate_body_part(body_part, is_left)
	if(!is_instance_valid(part)):
		return false
	if(current_state==ENEMY_STATE.DEFEND and body_part!= ItemManager.BODY_PART.LEG):
		if randf()>defence_chance_defending:
			part.get_damage(damage)
			return true
		else:
			return false
	else:
		if(randf()>defence_change):
			part.get_damage(damage)
			return true
		else:
			return false
func get_damage_to_part(body_part:int,is_left:bool ):
	translate_body_part(body_part, is_left)
func get_random_weapon()->BodyPart:
	var is_left:=randf()>0.5
	var body_parts:int
	if(randf()>0.5):
		body_parts=ItemManager.BODY_PART.HAND
	else:
		body_parts=ItemManager.BODY_PART.LEG
	var part:= translate_body_part(body_parts, is_left)
	if(!is_instance_valid(part)):
		return get_random_weapon()
	return part
# Called when the node enters the scene tree for the first time.

func set_HP_labels():	
	head_HP_label.text=validate_part(head)
	chest_HP_label.text = validate_part(chest)
	left_hand_HP_label.text = validate_part(left_hand)
	right_hand_HP_label.text =validate_part(right_hand)
	left_leg_HP_label.text = validate_part(left_leg)
	right_hand_HP_label.text = validate_part(right_hand)
func validate_part(part)->String:
	if(is_instance_valid(part)):
		return str(head.current_hp)
	else:
		return "dead"

func _ready() -> void:
	get_parent().start.connect(func(): current_state=ENEMY_STATE.ATTACK)
	fill_loot_pool()
	create_random_body()
	create_body()
	set_HP_labels()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_HP_labels()
	match current_state:
		ENEMY_STATE.IDLE:
			return
		ENEMY_STATE.ATTACK:
			current_state=ENEMY_STATE.ATTACKING
			attack()
			animation_player.play(get_attack_animation())
			await animation_player.animation_finished
			await get_tree().create_timer(current_weapon.item.attack_speed).timeout
			if(current_state==ENEMY_STATE.ATTACKING):
				current_state=ENEMY_STATE.ATTACK
		ENEMY_STATE.DEFEND:
			return
		ENEMY_STATE.ATTACKING:
			return
func get_attack_animation()->String:
	match current_weapon:
		left_leg:
			return "attack_leg_left"
		right_leg:
			return "attack_leg_right"
		left_hand:
			return "attack_hand_left"
		right_hand:
			return "attack_hand_right"
	return ""
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
func translate_body_part(body_part:int, is_left:bool)->BodyPart:
	match body_part:
		ItemManager.BODY_PART.HEAD:
			return head
		ItemManager.BODY_PART.CHEST:
			return chest
		ItemManager.BODY_PART.HAND:
			if(is_left):
				return left_hand
			else:
				return right_hand
		ItemManager.BODY_PART.LEG:
			if(is_left):
				return left_leg
			else:
				return right_leg
	return null
func create_body():
	head.set_items(ItemManager.items_dict[body_class.head])
	chest.set_items(ItemManager.items_dict[body_class.body])
	left_hand.set_items(ItemManager.items_dict[body_class.left_hand])
	right_hand.set_items(ItemManager.items_dict[body_class.right_hand])
	left_leg.set_items(ItemManager.items_dict[body_class.left_leg])
	right_leg.set_items(ItemManager.items_dict[body_class.right_leg])
