extends Node2D


var savePath = "res://SaveLoad_test/SaveState.cfg"
var conf = ConfigFile.new()
var loadResult = conf.load(savePath)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func saveValue(section,key, savedData):
	conf.set_value(section,key,savedData)
	conf.save(savePath)
	
func loadValue(section,key, savedData):
	savedData = conf.get_value(section,key,savedData)
