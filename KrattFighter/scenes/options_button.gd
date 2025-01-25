extends Button
@onready var option_panel: MarginContainer = $"../../../../../OptionPanel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	option_panel.visible = not option_panel.visible


func _on_bagbutton_pressed() -> void:
	$"../../Inventory".visible = not $"../../Inventory".visible


func _on_buildingbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/BuildingScene.tscn")
