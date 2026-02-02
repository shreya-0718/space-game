extends CharacterBody2D

var move_speed : float = Global.move_speed
var jump_force : float = Global.jump_force
var glide_gravity_scale : float = Global.glide_gravity_scale 

func _physics_process(delta):

	velocity.x = move_speed * .5

	var gravity : float = Global.earth_gravity   

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
		Global.num_jumps += 1
	elif is_on_floor():
		velocity.y = 0
	
	move_and_slide()

func die():
	await get_tree().create_timer(1.0).timeout
	var startpoint = get_node("../startpoint")
	if startpoint:
		position = startpoint.position

func respawn(): 
	#dont respawn in earth tho
	await get_tree().create_timer(1.0).timeout
	var spawnpoint = get_node("../spawnpoint") 
	if spawnpoint:
		position = spawnpoint.position
