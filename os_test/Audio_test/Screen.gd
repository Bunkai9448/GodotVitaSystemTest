extends Node2D


onready var batFile = "AutoFshExtractor.bat"
onready var blocking = false
onready var path = str(get_path()) + '&&'
onready var args = ['/C', 'start', path, batFile]
onready var output = [path]

onready var CorrectSound = preload("res://cancion.mp3")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Execute_pressed():
#	OS.shell_open(batFile)
#		OS.execute('cmd',args, blocking ,output)
	if !$AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.stream = CorrectSound
		$AudioStreamPlayer.play()
