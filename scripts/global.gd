extends Node2D

var mercury_stars: int = 0
var venus_stars: int = 0

var ice_skates: int = 0
var raincoat: int = 0

var mercury_gravity = 60
var venus_gravity = 90

var move_speed = 600
var jump_force = 100.0
var glide_gravity_scale := 0.25 

var checkpoint_position: Vector2
var checkpoint_scene: String

func reset_checkpoint():
	checkpoint_position = Vector2.ZERO
	checkpoint_scene = ""
	
#for raincoat
var pressed = false

#for locked levels
var passedmercury = false


#for reverse movement on venus
var reverse = false

#dimming screen
@onready var dim = $CanvasLayer6/dim
	

	
