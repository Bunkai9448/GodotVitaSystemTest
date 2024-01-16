extends Node


func _ready():
	if !$SpookySound.playing:
		$SpookySound.play()

