extends Node2D
signal start

@onready var headLabel_player = $UILayer/PlayerPanel/VBoxContainer/HeadContainer/HeadItemLabel
@onready var bodyLabel_player = $UILayer/PlayerPanel/VBoxContainer/BodyContainer/BodyItemLabel
@onready var LHandLabel_player = $UILayer/PlayerPanel/VBoxContainer/LHandContainer/LHandItemLabel
@onready var RHandLabel_player = $UILayer/PlayerPanel/VBoxContainer/RHandContainer/RHandItemLabel
@onready var LLegLabel_player = $UILayer/PlayerPanel/VBoxContainer/LLegContainer/LLegItemLabel
@onready var RLegLabel_player = $UILayer/PlayerPanel/VBoxContainer/RLegContainer/RLegItemLabel

var player_body:=ItemManager.kratt_body
#ENEMY
@onready var head_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/HeadContainer/HeadItemLabel
@onready var body_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/BodyContainer/BodyItemLabel
@onready var l_hand_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/LHanContainer/LHandItemLabel
@onready var r_hand_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/RHandContainer/RHandItemLabel
@onready var l_leg_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/LLegContainer/LLegItemLabel
@onready var r_leg_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/RLegContainer/RLegItemLabel

@onready var enemy: Enemy = $Enemy
var enemy_body:ItemManager.KrattBodyClass
#const ENEMY=preload("res://scenes/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_body=enemy.body_class
	setLabels()
	start.emit()
	
func setLabels():
	headLabel_player.text = ItemManager.items_dict[player_body.head].str_name
	bodyLabel_player.text = ItemManager.items_dict[player_body.body].str_name
	LHandLabel_player.text =ItemManager.items_dict[player_body.left_hand].str_name
	RHandLabel_player.text = ItemManager.items_dict[player_body.right_hand].str_name
	LLegLabel_player.text = ItemManager.items_dict[player_body.left_leg].str_name
	RLegLabel_player.text = ItemManager.items_dict[player_body.right_leg].str_name
	
	head_enemy_label.text=ItemManager.items_dict[enemy_body.head].str_name
	body_enemy_label.text=ItemManager.items_dict[enemy_body.body].str_name
	l_hand_enemy_label.text=ItemManager.items_dict[enemy_body.left_hand].str_name
	r_hand_enemy_label.text=ItemManager.items_dict[enemy_body.right_hand].str_name
	l_leg_enemy_label.text=ItemManager.items_dict[enemy_body.left_leg].str_name
	r_leg_enemy_label.text=ItemManager.items_dict[enemy_body.right_leg].str_name
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_player():
	pass
func load_enemy():
	pass
