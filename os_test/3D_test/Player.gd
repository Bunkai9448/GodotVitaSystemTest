extends RigidBody
# https://docs.godotengine.org/en/3.5/tutorials/physics/rigid_body.html

onready var raycast = get_node("RayCast")
onready var start_position = translation


func _physics_process(_delta):
	var dir = Vector3()
	dir.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	dir.z = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")

	apply_central_impulse(dir.normalized() /10)
	# change looking direction

	# Jumping code.
	if on_ground() and Input.is_action_pressed("jump"):
		apply_central_impulse(Vector3.UP)


# Test if there is a body below the player.
func on_ground():
	if raycast.is_colliding():
		return true

