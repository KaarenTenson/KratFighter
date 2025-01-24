extends MarginContainer

var SFX_bus:int=AudioServer.get_bus_index("SFX")
var Music_bus:int=AudioServer.get_bus_index("Music")
# Called when the node enters the scene tree for the first time.

func _on_button_pressed() -> void:
	self.visible=not self.visible


func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(Music_bus, linear_to_db(value))


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_bus, linear_to_db(value))
