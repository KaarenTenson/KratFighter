extends Node2D

@export var nextButton : Button
@export var openingTextPlayer : AnimationPlayer
@export var openingScenePlayer : AnimationPlayer
@onready var scene : int = 0
@onready var animation_names = ["image_transition","image_transition2", "image_transition4", "image_transition5", "image_transition6", "image_transition3", "image_transition8"]
@onready var credits_anims = ["credits1", "credits2", "credits4", "credits5", "credits6", "credits7"]
@onready var scene_texts = ["In the bright plains of what later became Estonia, people prospered under the guidance of the great Uku.",
"One day, however, [shake rate=20.0 level=5 connected=1][color=#c31432]Vanapagan[/color][/shake] struck the innocent villages during his usual mischief.",
"After the destruction, [shake rate=20.0 level=5 connected=1][color=#c31432]Vanapagan[/color][/shake] offered to repair the villages, which [shake rate=20.0 level=5 connected=1][color=##C6FFDD]the people[/color][/shake] agreed to.",
"He was an excellent builder, but he was lazy, and only built the houses [wave amp=50.0 freq=5.0 connected=1]halfway[/wave].",
"After that he went to his mischief again, built the houses halfway up again, and continued so for many days on end..",
"[shake rate=20.0 level=5 connected=1][color=#C6FFDD]The people[/color][/shake] had enough - [shake rate=20.0 level=5 connected=1][color=#F3F9A7]someone[/color][/shake] had to step in and stop him.",
"..By [wave amp=50.0 freq=5.0 connected=1][color=#c31432]all[/color][/wave] means necessary."]
@onready var credits_texts = ["Defeated by his own kin, the humiliated devil ran far north, where nobody could find him.",
"With the malicious [shake rate=20.0 level=5 connected=1][color=#c31432]Vanapagan[/color][/shake] gone, [shake rate=20.0 level=5 connected=1][color=#C6FFDD]the people[/color][/shake] happily returned to their lives of peace.",
"Singing, dancing..", "..till [color=#6DD5FA]the end of their time...[/color]"]
@onready var voices = ["res://assets/sfx/OP1.mp3", "res://assets/sfx/OP2.mp3", "res://assets/sfx/OP3.mp3", "res://assets/sfx/OP4.mp3", "res://assets/sfx/OP5.mp3", "res://assets/sfx/OP6.mp3", "res://assets/sfx/OP7.mp3"]
@onready var creditsVoices = ["res://assets/sfx/Credits1.mp3", "res://assets/sfx/Credits2.mp3", "res://assets/sfx/Credits3.mp3", "res://assets/sfx/Credits4.mp3"]
@export var credits : String
@onready var creditsIndex = 0

func _on_button_pressed() -> void:
	if scene >= 6:
		$ColorRect/AnimationPlayer.play("fade_out")
		await get_tree().create_timer(1.75).timeout
		$"ColorRect/black bg".visible = true
		get_tree().change_scene_to_file("res://scenes/MapScene.tscn")
		scene = 0
		return
	openingTextPlayer.play("text_disappear")
	await get_tree().create_timer(0.6).timeout
	openingScenePlayer.play(animation_names[scene])
	scene += 1
	$PanelContainer/Text/RichTextLabel.text = scene_texts[scene]
	await get_tree().create_timer(0.6).timeout
	openingTextPlayer.play("text_arrive")
	$SFX.set_stream(load(voices[scene]))
	$SFX.play()

func _ready():
	$ColorRect/AnimationPlayer.play("fade_in")
	if (credits == "credits"):
		$SFX.set_stream(load(creditsVoices[scene]))
		$SFX.play()
		await get_tree().create_timer(2).timeout
		openingScenePlayer.play(credits_anims[creditsIndex])
		scene += 1
		print("läks läbi")
	else:
		$SFX.set_stream(load(voices[scene]))
		$SFX.play()
	await get_tree().create_timer(1.75).timeout

func _on_music_finished() -> void:
	$Music.set_stream(load("res://assets/music/Opening (loop).wav"))
	$Music.play()

func _on_music_finished_credits() -> void:
	$Music.set_stream(load("res://assets/music/Credits (loop).wav"))
	$Music.play()


func _on_button_pressed_credits() -> void:
	if (scene >= 4):
		$ColorRect/AnimationPlayer.play("fade_out")
		await get_tree().create_timer(1.75).timeout
		$"ColorRect/black bg".visible = true
		get_tree().change_scene_to_file("res://scenes/End.tscn")
		scene = 0
		return
	else:
		creditsIndex += 1
		openingTextPlayer.play("text_disappear")
		await get_tree().create_timer(0.6).timeout
		openingScenePlayer.play(credits_anims[scene])
		$PanelContainer/Text/RichTextLabel.text = credits_texts[scene]
		scene += 1
		await get_tree().create_timer(0.6).timeout
		openingTextPlayer.play("text_arrive")
		$SFX.set_stream(load(creditsVoices[creditsIndex]))
		$SFX.play()

func waitAnim():
	await get_tree().create_timer(3).timeout
	openingScenePlayer.play(credits_anims[scene])
