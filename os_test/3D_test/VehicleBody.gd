extends VehicleBody
# Hacky way to make the character look at directions without breaking movement

# Called when the node enters the scene tree for the first time.
func _ready():
	.get_node("WheelRequired").disabled = true
	set_disable_scale(true)

func _physics_process(_delta):
	var dir = Vector3()
	dir.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	dir.z = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	# look at aiming direction properly / still needs a few touches
	rotate_y(dir.x/20)
	rotate_y(dir.z/20)
