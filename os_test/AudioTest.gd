extends Node


func _ready():
	pass # Replace with function body.

func _on_AudioButton_pressed():
	if !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()
	else:
		$AudioStreamPlayer.stop()	
