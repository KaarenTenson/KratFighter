extends Node2D
signal start

const PLAYER = preload("res://scenes/player.tscn")
const ENEMY=preload("res://scenes/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.emit()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func load_player():
	pass
func load_enemy():
	pass
