extends Node2D
class_name Player
@onready var head: BodyPart = $Head
@onready var chest: BodyPart = $chest
@onready var left_hand: BodyPart = $LeftHand
@onready var right_hand: BodyPart = $rightHand
@onready var left_leg: BodyPart = $leftLeg
@onready var right_leg: BodyPart = $rightleg

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var focus

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_body()
	ItemManager.kratt_changed.connect(refresh_body)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func refresh_body():
	for child in get_children():
		if(child is StaticBody2D):
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

func _on_head_container_focus_entered():
	if (focus != "head"):
		focus = "head"
		var head_container = get_node("../UILayer/EnemyPanel/VBoxContainer/HeadContainer")
		if head_container:
			for child in head_container.get_children():
				if child is CanvasItem:
					child.modulate = Color(0.435, 0.961, 0)

func _on_body_container_focus_entered():
	if (focus != "body"):
		focus = "body"
		var body_container = get_node("../UILayer/EnemyPanel/VBoxContainer/BodyContainer")
		if body_container:
			for child in body_container.get_children():
				if child is CanvasItem:
					child.modulate = Color(0.435, 0.961, 0)

func _on_l_han_container_focus_entered():
	if (focus != "Lhand"):
		focus = "Lhand"
		var Lhand_container = get_node("../UILayer/EnemyPanel/VBoxContainer/LHanContainer")
		if Lhand_container:
			for child in Lhand_container.get_children():
				if child is CanvasItem:
					child.modulate = Color(0.435, 0.961, 0)

func _on_r_hand_container_focus_entered():
	if (focus != "Rhand"):
		focus = "Rhand"
		var Rhand_container = get_node("../UILayer/EnemyPanel/VBoxContainer/RHandContainer")
		if Rhand_container:
			for child in Rhand_container.get_children():
				if child is CanvasItem:
					child.modulate = Color(0.435, 0.961, 0)

func _on_l_leg_container_focus_entered():
	if (focus != "Lleg"):
		focus = "Lleg"
		var Lleg_container = get_node("../UILayer/EnemyPanel/VBoxContainer/LLegContainer")
		if Lleg_container:
			for child in Lleg_container.get_children():
				if child is CanvasItem:
					child.modulate = Color(0.435, 0.961, 0)

func _on_r_leg_container_focus_entered():
	if (focus != "Rleg"):
		focus = "Rleg"
		var Rleg_container = get_node("../UILayer/EnemyPanel/VBoxContainer/RLegContainer")
		if Rleg_container:
			for child in Rleg_container.get_children():
				if child is CanvasItem:
					child.modulate = Color(0.435, 0.961, 0)

# Color(1, 1, 1)
func _on_head_container_focus_exited():
		var head_container = get_node("../UILayer/EnemyPanel/VBoxContainer/HeadContainer")
		if head_container:
			for child in head_container.get_children():
				if child is CanvasItem:
					child.modulate = Color(1, 1, 1)

func _on_body_container_focus_exited():
	var body_container = get_node("../UILayer/EnemyPanel/VBoxContainer/BodyContainer")
	if body_container:
		for child in body_container.get_children():
			if child is CanvasItem:
				child.modulate = Color(1, 1, 1)

func _on_l_han_container_focus_exited():
	var Lhand_container = get_node("../UILayer/EnemyPanel/VBoxContainer/LHanContainer")
	if Lhand_container:
		for child in Lhand_container.get_children():
			if child is CanvasItem:
				child.modulate = Color(1, 1, 1)

func _on_r_hand_container_focus_exited():
	var Rhand_container = get_node("../UILayer/EnemyPanel/VBoxContainer/RHandContainer")
	if Rhand_container:
		for child in Rhand_container.get_children():
			if child is CanvasItem:
				child.modulate = Color(1, 1, 1)

func _on_l_leg_container_focus_exited():
	var Lleg_container = get_node("../UILayer/EnemyPanel/VBoxContainer/LLegContainer")
	if Lleg_container:
		for child in Lleg_container.get_children():
			if child is CanvasItem:
				child.modulate = Color(1, 1, 1)

func _on_r_leg_container_focus_exited():
	var Rleg_container = get_node("../UILayer/EnemyPanel/VBoxContainer/RLegContainer")
	if Rleg_container:
		for child in Rleg_container.get_children():
			if child is CanvasItem:
				child.modulate = Color(1, 1, 1)
