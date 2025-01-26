extends AudioStreamPlayer2D

const map_music = preload("res://assets/music/Map (loop).mp3")
const fightprep_music = preload("res://assets/music/FightPrep (loop).mp3")
const fight_music = preload("res://assets/music/Fight (loop).mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()
	
func play_music_map():
	_play_music(map_music)


func _on_finished() -> void:
	play_music_map()
