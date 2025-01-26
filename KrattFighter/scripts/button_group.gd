extends VBoxContainer
@onready var option_panel: MarginContainer = $"../../../OptionPanel"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	$"../../../SFX".set_stream(load("res://assets/sfx/Collect.mp3"))
	play_with_random_pitch()
	$"../../../ColorRect/AnimationPlayer".play("fade_in")
	await get_tree().create_timer(1.75).timeout
	get_tree().change_scene_to_file("res://scenes/Opening.tscn")


func _on_exit_button_pressed() -> void:
	$"../../../SFX".set_stream(load("res://assets/sfx/Collect.mp3"))
	play_with_random_pitch()
	get_tree().quit()

func play_with_random_pitch():
	# Generate a random pitch scale between 0.8 and 1.2 (adjust range as needed)
	var random_pitch = randf_range(0.8, 1.2)
	$"../../../SFX".pitch_scale = random_pitch
	$"../../../SFX".play()
