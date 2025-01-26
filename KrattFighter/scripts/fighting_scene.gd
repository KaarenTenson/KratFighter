extends Node2D
signal start
signal lost
signal won
@onready var headLabel_player = $UILayer/PlayerPanel/VBoxContainer/HeadContainer/HeadItemLabel
@onready var bodyLabel_player = $UILayer/PlayerPanel/VBoxContainer/BodyContainer/BodyItemLabel
@onready var LHandLabel_player = $UILayer/PlayerPanel/VBoxContainer/LHandContainer/LHandItemLabel
@onready var RHandLabel_player = $UILayer/PlayerPanel/VBoxContainer/RHandContainer/RHandItemLabel
@onready var LLegLabel_player = $UILayer/PlayerPanel/VBoxContainer/LLegContainer/LLegItemLabel
@onready var RLegLabel_player = $UILayer/PlayerPanel/VBoxContainer/RLegContainer/RLegItemLabel

@onready var player: Player = $Player
var player_body:=ItemManager.kratt_body
#ENEMY
@onready var head_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/HeadContainer/HeadItemLabel
@onready var body_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/BodyContainer/BodyItemLabel
@onready var l_hand_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/LHanContainer/LHandItemLabel
@onready var r_hand_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/RHandContainer/RHandItemLabel
@onready var l_leg_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/LLegContainer/LLegItemLabel
@onready var r_leg_enemy_label: Label = $UILayer/EnemyPanel/VBoxContainer/RLegContainer/RLegItemLabel

@onready var enemy: Enemy = $Enemy

@onready var anim = $AnimationPlayer
var enemy_body:ItemManager.KrattBodyClass
#const ENEMY=preload("res://scenes/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_body=enemy.body_class
	setLabels()
	
	await get_tree().create_timer(1).timeout
	anim.play("spawn")
	await anim.animation_finished
	connect_signals()
	start.emit()
func connect_signals():
	player.chest.part_dead.connect(func(obj):lost.emit())
	player.head.part_dead.connect(func(obj):lost.emit())
	
	enemy.chest.part_dead.connect(func(obj):won.emit())
	enemy.head.part_dead.connect(func(ojj):won.emit())
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

func _on_player_attack_signal(body_part: int, is_left: bool, damage: int) -> void:
	var result:=enemy.get_damage(body_part, is_left, damage)
func _on_enemy_attack_signal(body_part: int, is_left: bool, damage: int) -> void:
	var result:bool=player.get_damage(body_part, is_left, damage)
	enemy.get_result(result)


func _on_won() -> void:
	ItemManager.current_items.clear()
	ItemManager.reset_kratt()
	print("yeeee")
	get_tree().change_scene_to_file("res://scenes/Credits.tscn")

func _on_lost() -> void:
	ItemManager.reset_kratt()
	ItemManager.current_items.clear()
	print("yeeee")
	get_tree().change_scene_to_file("res://scenes/MapScene.tscn")

func _on_music_finished() -> void:
	$Music.set_stream(load("res://assets/music/Fight (loop).mp3"))
	$Music.play()
