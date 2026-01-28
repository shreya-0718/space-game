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

	if Input.is_action_pressed("glide") and not is_on_floor():
		velocity.y += gravity * glide_gravity_scale * delta
	elif not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump"):
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

#tutorial - very confusing thing but it worked out - probably can write it shorter but who cares since we are running out of time
@onready var left = get_node("../left")
@onready var right = get_node("../right")
@onready var up = get_node("../up")
@onready var skiptutorial = $"../CanvasLayer4/skiptutorial"
@onready var triggeredL = false
@onready var triggeredR = false
@onready var triggeredU = false
@onready var following = false
@onready var continuing = false

#for back button
@onready var usure = get_node("../usure?")

func _ready():
	right.visible = false
	up.visible = false
	usure.visible = false

func _process(delta):
	if left and Input.is_action_just_pressed("left") and not triggeredL:
		following = true
		triggeredL = true
		left.queue_free()
		right.visible = true
	if right and Input.is_action_just_pressed("right") and not triggeredR and following:
		continuing = true
		triggeredR = true
		right.queue_free()
		up.visible = true
	if up and Input.is_action_just_pressed("jump") and not triggeredU and following and continuing:
		triggeredU = true
		up.queue_free()
		skiptutorial.queue_free()
		
	
