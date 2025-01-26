extends Node2D

@export var nextButton : Button
@export var openingTextPlayer : AnimationPlayer
@onready var openingScenePlayers = []
@onready var scene : int = 0
@onready var scene_texts = ["In the bright plains of what later became Estonia, people prospered under the guidance of the great Uku.",
"One day, however, Vanapagan struck the innocent villages during his usual mischief.",
"After the destruction, Vanapagan offered to repair the villages, which the people agreed to.",
"He was an excellent builder, but he was lazy, and only built the houses halfway.",
"After that he went to his mischief again, built the houses halfway up again, and continued so for many days on end.",
"The people had enough - someone had to step in and stop him.",
"..By all means necessary."]

func _on_button_pressed() -> void:
	scene += 1
	openingTextPlayer.play("text_disappear")
	await get_tree().create_timer(0.6).timeout
	openingScenePlayers[scene].play("image_transition")
	$PanelContainer/Text/RichTextLabel.text = scene_texts[scene]
	await get_tree().create_timer(0.6).timeout
	openingTextPlayer.play("text_arrive")

func _ready():
	openingScenePlayers = get_tree().get_nodes_in_group("animation")
