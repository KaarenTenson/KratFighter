extends Button

var mousePos
var buttonPressed
var iconTexture
@export var stats : Items = null:
	set(value):
		stats = value
		
		if value != null:
			icon = value.texture
		else:
			icon = null

func _ready():
	set_process_input(false)
