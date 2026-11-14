extends CharacterBody2D

var speed = 300
var jump_power = -450
var gravity = 980
var flag_x = 2000  # 

func _physics_process(delta):
	# Restart new game when player reaches the flag
	if position.x >= flag_x:
		get_tree().reload_current_scene()

	# Restart new game if player falls down off the platform
	if position.y > 1000:
		get_tree().reload_current_scene()

	# Apply gravity when horse is in the air
	if not is_on_floor():
		velocity.y += gravity * delta

	# Move the horse forward continuously
	velocity.x = speed

	# Jump when Spacebar is pressed and play jump sound
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_power
		$"../JumpSound".play()
	move_and_slide()
