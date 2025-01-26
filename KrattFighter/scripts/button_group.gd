extends VBoxContainer
@onready var option_panel: MarginContainer = $"../../../OptionPanel"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	$"../../../ColorRect/AnimationPlayer".play("fade_in")
	await get_tree().create_timer(1.75).timeout
<<<<<<< Updated upstream
	get_tree().change_scene_to_file("res://scenes/MapScene.tscn")
=======
	get_tree().change_scene_to_file("res://scenes/Opening.tscn")
>>>>>>> Stashed changes


func _on_exit_button_pressed() -> void:
	get_tree().quit()
