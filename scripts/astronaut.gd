extends CharacterBody2D

var move_speed : float = Global.move_speed
var jump_force : float = Global.jump_force
var glide_gravity_scale : float = Global.glide_gravity_scale 

@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	var direction = 0.0
	var input = Input.get_axis("left", "right")

	if input != 0:
		anim.flip_h = input < 0

	if is_on_floor():
		Global.num_jumps = 0
		if input == 0:
			anim.play("idle")
		else:
			anim.play("run")

	velocity.x = input * move_speed

	var gravity : float = Global.mercury_gravity   

	if Input.is_action_pressed("space") and Input.is_action_pressed("jump") and not is_on_floor() and velocity.y > 0:
		velocity.y += gravity * glide_gravity_scale * delta
	elif not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and not Input.is_action_pressed("space") and Global.num_jumps < 2:
		velocity.y = -jump_force
		anim.play("jump")
		Global.num_jumps += 1
	elif is_on_floor():
		velocity.y = 0
	
	move_and_slide()

func die():
	var startpoint = get_node("../startpoint")
	if startpoint:
		position = startpoint.position

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
		
	
