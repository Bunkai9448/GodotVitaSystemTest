extends Node2D


# For external exes, 
# DO NOT USE "/" or "\", they are read  by godot as escape codes
# https://github.com/godotengine/godot/issues/38808
# Include the exe in the "res:://" folder and
# use something like this example below instead
onready var executable =  "CMD.exe"
onready var args = ["echo", "Hello world"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Execute_pressed():
	OS.execute(executable, args, false)
