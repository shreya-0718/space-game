extends CharacterBody2D

var move_speed : float = Global.move_speed
var jump_force : float = Global.jump_force
var glide_gravity_scale : float = Global.glide_gravity_scale 


func _physics_process(delta):
	var direction = 0.0
	if Input.is_action_pressed("left"):
		direction -= 1
	if Input.is_action_pressed("right"):
		direction += 1

	velocity.x = direction * move_speed

	var gravity : float = Global.mercury_gravity   

	if Input.is_action_pressed("glide") and not is_on_floor() and velocity.y > 0:
		velocity.y += gravity * glide_gravity_scale * delta
	elif not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	elif is_on_floor():
		velocity.y = 0
	
	move_and_slide()

func die():
	respawn()

func respawn():
	var spawnpoint = get_node("../spawnpoint") 
	if spawnpoint:
		position = spawnpoint.position
