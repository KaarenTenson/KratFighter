extends Node2D
class_name Player
@onready var head: BodyPart = $Head
@onready var chest: BodyPart = $chest
@onready var left_hand: BodyPart = $LeftHand
@onready var right_hand: BodyPart = $rightHand
@onready var left_leg: BodyPart = $leftLeg
@onready var right_leg: BodyPart = $rightleg


@onready var animation_player: AnimationPlayer = $AnimationPlayer
enum PLAYER_STATE{IDLE, ATTACK, DEFEND, ATTACKING}
var defence_change:=0.3
var defence_chance_defending:=0.8
var current_state:int=PLAYER_STATE.IDLE
var current_weapon:BodyPart=null
var focus="head"

signal attack_signal(body_part:int, is_left:bool, damage:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(get_parent() is Node2D):
		get_parent().start.connect(func(): current_state=PLAYER_STATE.ATTACK)
	create_body()
	ItemManager.kratt_changed.connect(refresh_body)

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
func attack():
	var body_part:int=-1
	var is_left:bool=false
	match focus:
		"head":
			body_part=ItemManager.BODY_PART.HEAD
		"body":
			body_part=ItemManager.BODY_PART.CHEST
		"Lhand":
			body_part=ItemManager.BODY_PART.HAND
			is_left=true
		"Rhand":
			body_part=ItemManager.BODY_PART.HAND
		"Lleg":
			body_part=ItemManager.BODY_PART.LEG
			is_left=true
		"Rleg":
			body_part=ItemManager.BODY_PART.LEG
			
	current_weapon=get_random_weapon()
	attack_signal.emit(body_part, is_left, current_weapon.item.damage)
func get_attack_animation()->String:
	match current_weapon:
		left_leg:
			return "left_leg_attack"
		right_leg:
			return "right_leg_attack"
		left_hand:
			return "left_hand_attack"
		right_hand:
			return "right_hand_attack"
	return ""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	match current_state:
		PLAYER_STATE.IDLE:
			return
		PLAYER_STATE.ATTACK:
			current_state=PLAYER_STATE.ATTACKING
			attack()
			animation_player.play(get_attack_animation())
			await animation_player.animation_finished
			current_state=PLAYER_STATE.ATTACK
		PLAYER_STATE.DEFEND:
			return
		PLAYER_STATE.ATTACKING:
			return

func refresh_body():
	for child in get_children():
		if(child is Node2D):
			(child.get_children()[0] as StaticBody2D).queue_free()
	create_body()

func create_body():
	head.set_items(ItemManager.items_dict[ItemManager.kratt_body.head])
	chest.set_items(ItemManager.items_dict[ItemManager.kratt_body.body])
	left_hand.set_items(ItemManager.items_dict[ItemManager.kratt_body.left_hand])
	right_hand.set_items(ItemManager.items_dict[ItemManager.kratt_body.right_hand])
	left_leg.set_items(ItemManager.items_dict[ItemManager.kratt_body.left_leg])
	right_leg.set_items(ItemManager.items_dict[ItemManager.kratt_body.right_leg])
	
func get_damage(body_part: int, is_left: bool, damage: int)->bool:
	var part:BodyPart=translate_body_part(body_part, is_left)
	if(!is_instance_valid(part)):
		return false
	if(current_state==PLAYER_STATE.DEFEND and body_part!= ItemManager.BODY_PART.LEG):
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
