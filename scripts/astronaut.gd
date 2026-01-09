extends CharacterBody2D

@export var move_speed := 200.0
@export var jump_force := 350.0
@export var glide_gravity_scale := 0.25 

func _physics_process(delta):
	print(Input.is_action_pressed("left"), Input.is_action_pressed("right"))
	
	var direction := 0.0
	if Input.is_action_pressed("left"):
		direction -= 1
	if Input.is_action_pressed("right"):
		direction += 1

	velocity.x = direction * move_speed

	var gravity : float = Global.gravity   

	if Input.is_action_pressed("glide") and not is_on_floor() and velocity.y > 0:
		velocity.y += gravity * glide_gravity_scale * delta
	else:
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	elif is_on_floor():
		velocity.y = 0
	
	move_and_slide()
