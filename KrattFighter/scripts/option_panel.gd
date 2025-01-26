extends MarginContainer
var SFX_bus:int=AudioServer.get_bus_index("SFX")
var Music_bus:int=AudioServer.get_bus_index("Music")
# Called when the node enters the scene tree for the first time.

func _on_button_pressed() -> void:
	$"../SFX".set_stream(load("res://assets/sfx/Collect.mp3"))
	play_with_random_pitch()
	self.visible=not self.visible


func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(Music_bus, linear_to_db(value))


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_bus, linear_to_db(value))

func play_with_random_pitch():
	# Generate a random pitch scale between 0.8 and 1.2 (adjust range as needed)
	var random_pitch = randf_range(0.8, 1.2)
	$"../SFX".pitch_scale = random_pitch
	$"../SFX".play()

func _ready():
	$OptionPanel/MarginContainer/VBoxContainer/sliderSFXBOX/SFXSlider.value = db_to_linear(AudioServer.get_bus_volume_db(SFX_bus))
	$OptionPanel/MarginContainer/VBoxContainer/sliderMusicBox/MusicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(Music_bus))
