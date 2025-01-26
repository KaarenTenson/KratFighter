extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(7.5).timeout
	$ColorRect/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1.75).timeout
	$"ColorRect/black bg".visible = true
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_music_finished() -> void:
	$Music.set_stream(load("res://assets/music/End (loop).wav"))
	$Music.play()
