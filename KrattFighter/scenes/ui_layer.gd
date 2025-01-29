extends CanvasLayer
@onready var head_HP_label = $PlayerPanel/VBoxContainer/HeadContainer/CurrentHPLabel
@onready var chest_HP_label = $"PlayerPanel/VBoxContainer/BodyContainer/CurrentHPLabel"
@onready var left_hand_HP_label =$"PlayerPanel/VBoxContainer/LHandContainer/CurrentHPLabel"
@onready var right_hand_HP_label = $"PlayerPanel/VBoxContainer/RHandContainer/CurrentHPLabel"
@onready var left_leg_HP_label =$"PlayerPanel/VBoxContainer/LLegContainer/CurrentHPLabel"
@onready var right_leg_HP_label = $"PlayerPanel/VBoxContainer/RLegContainer/CurrentHPLabel"

@onready var enemy_head_HP_label = $"EnemyPanel/VBoxContainer/HeadContainer/CurrentHPLabel"
@onready var enemy_chest_HP_label = $"EnemyPanel/VBoxContainer/BodyContainer/CurrentHPLabel"
@onready var enemy_left_hand_HP_label = $"EnemyPanel/VBoxContainer/LHanContainer/CurrentHPLabel"
@onready var enemy_right_hand_HP_label = $"EnemyPanel/VBoxContainer/RHandContainer/CurrentHPLabel"
@onready var enemy_left_leg_HP_label = $"EnemyPanel/VBoxContainer/LLegContainer/CurrentHPLabel"
@onready var enemy_right_leg_HP_label = $"EnemyPanel/VBoxContainer/RLegContainer/CurrentHPLabel"

@onready var player: Player = $"../Player"
@onready var enemy: Enemy = $"../Enemy"
var focus=""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func set_HP_labels():	
	head_HP_label.text=validate_part(player.head)
	chest_HP_label.text = validate_part(player.chest)
	left_hand_HP_label.text = validate_part(player.left_hand)
	right_hand_HP_label.text =validate_part(player.right_hand)
	left_leg_HP_label.text = validate_part(player.left_leg)
	right_leg_HP_label.text = validate_part(player.right_hand)
	
	enemy_head_HP_label.text=validate_part(enemy.head)
	enemy_chest_HP_label.text = validate_part(enemy.chest)
	enemy_left_hand_HP_label.text = validate_part(enemy.left_hand)
	enemy_right_hand_HP_label.text =validate_part(enemy.right_hand)
	enemy_left_leg_HP_label.text = validate_part(enemy.left_leg)
	enemy_right_leg_HP_label.text = validate_part(enemy.right_hand)

func validate_part(part)->String:
	if(is_instance_valid(part)):
		return str(part.current_hp)
	else:
		return "dead"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player.focus=focus
	set_HP_labels()
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
