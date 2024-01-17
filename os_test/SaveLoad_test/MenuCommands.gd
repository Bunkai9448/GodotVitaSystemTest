extends Node2D


var ghostPos = Vector2(0,0)


func _process(_delta):
	if Input.is_action_pressed("ui_start"):
		get_tree().change_scene("res://os_test.tscn")
		
	if Input.is_action_pressed("ui_loadButton"):
		SaveConfig.loadValue("values","ValueOne", ghostPos)
		get_node("KinematicBody2D").set_position(ghostPos) 
		
	if Input.is_action_pressed("ui_saveButton"):
		ghostPos = get_node("KinematicBody2D").get_global_transform().origin
		SaveConfig.saveValue("values","ValueOne", ghostPos)

