extends RigidBody
# https://docs.godotengine.org/en/3.5/tutorials/physics/rigid_body.html

onready var raycast = get_node("RayCast") # collision layer 1, like anything else
onready var forThePuck = get_node("ForThePuck") # collision layer 2, only the puck
onready var hasPuck = false

func _integrate_forces(_state):
	var dir = Vector3()
	dir.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	dir.z = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")

	apply_central_impulse(dir.normalized() /10)
	set_disable_scale(true)
	look_at_from_position(get_global_transform().origin, dir , Vector3.UP)
	# Jumping code.
	if on_ground() and Input.is_action_pressed("jump"):
		apply_central_impulse(Vector3(0,1,0))
		
	# Grab puck control
	if puck_on_sight() and !hasPuck:
		get_node("Label").text = "goal"
		hasPuck = true
	
	if !puck_on_sight():
		get_node("Label").text = ""
		hasPuck = false

# Test if there is a body below the player.
func on_ground():
	if raycast.is_colliding():
		return true

# Test if the puck is on sight
func puck_on_sight():
	if forThePuck.is_colliding():
		return true
