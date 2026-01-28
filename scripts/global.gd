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
	
#dimming screen
@onready var dim = $CanvasLayer6/dim
	
func dim_screen(duration: float = 1.0):
	print(dim)
	var tween = create_tween()
	tween.tween_property(dim.modulate, "a", 0.5, duration)
	
