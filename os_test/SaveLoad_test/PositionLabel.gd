extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var ghost = get_parent().get_parent().get_node("KinematicBody2D").get_global_transform().origin
	text = "Ghost Position:\n %s" % str(ghost)
