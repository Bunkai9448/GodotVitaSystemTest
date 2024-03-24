extends KinematicBody2D

export (int) var speed = 100
var velocity = Vector2()
var dir = 0 # to select the sprite

func get_input():
	# reset input and sprite values
	velocity = Vector2.ZERO
	.get_child(dir).set_visible(false)
	dir = 4 # Sprite for IDDLE position

	# actually getting player input
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	# Update Sprite accordingly
	if velocity.x == 0 and velocity.y < 0:  # UP
		dir = 0
	if velocity.x < 0 and velocity.y < 0:  # UP_LEFT
		dir = 1
	if velocity.x > 0 and velocity.y < 0:  # UP_RIGHT
		dir = 2
	if velocity.x < 0 and velocity.y == 0: # LEFT
		dir = 3
	if velocity.x > 0 and velocity.y == 0: # RIGHT
		dir = 5
	if velocity.x < 0 and velocity.y > 0:  # DOWN_LEFT
		dir = 6
	if velocity.x > 0 and velocity.y > 0:  # DOWN_RIGHT
		dir = 7
	if velocity.x == 0 and velocity.y > 0:  # DOWN
		dir = 8
	.get_child(dir).set_visible(true)


func _physics_process(_delta):
		get_input()
		velocity = move_and_slide(velocity)

