extends CharacterBody2D

const PULL = 50.0
const JUMP_VELOCITY = -800.0

var counting = false
var time_elapsed = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _init():
	pass

func _physics_process(delta):
	if counting:
		time_elapsed += delta
	
	# Add the gravity.
	if not is_on_floor():
		if not counting:
			counting = true
		
		velocity.y += gravity * delta + time_elapsed * PULL
	else:
		counting = false
		time_elapsed = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var collision = move_and_collide(velocity)
	
	if collision.get_collider().get_groups().has("Obstacle"):
		get_tree().quit()
