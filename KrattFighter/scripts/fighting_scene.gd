extends Node2D
signal start

@onready var headLabel_player = $UILayer/PlayerPanel/VBoxContainer/HeadContainer/HeadItemLabel
@onready var bodyLabel_player = $UILayer/PlayerPanel/VBoxContainer/BodyContainer/BodyItemLabel
@onready var LHandLabel_player = $UILayer/PlayerPanel/VBoxContainer/LHandContainer/LHandItemLabel
@onready var RHandLabel_player = $UILayer/PlayerPanel/VBoxContainer/RHandContainer/RHandItemLabel
@onready var LLegLabel_player = $UILayer/PlayerPanel/VBoxContainer/LLegContainer/LLegItemLabel
@onready var RLegLabel_player = $UILayer/PlayerPanel/VBoxContainer/RLegContainer/RLegItemLabel

#const ENEMY=preload("res://scenes/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.emit()
	
#func setLabels():
#	headLabel.text = head.name
#	bodyLabel.text = chest.name
#	LHandLabel.text = left_hand.name
#	RHandLabel.text = right_hand.name
#	LLegLabel.text = left_leg.name
#	RLegLabel.text = right_leg.name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_player():
	pass
func load_enemy():
	pass
