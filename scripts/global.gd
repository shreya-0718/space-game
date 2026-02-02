extends Node2D

var mercury_stars: int = 0
var venus_stars: int = 0
var earth_stars: int = 0
var mars_stars: int = 0

var ice_skates: int = 0
var raincoat: int = 0
var boots: int = 0

var mercury_gravity = 60
var venus_gravity = 90
var earth_gravity = 90

var move_speed = 300
var jump_force = 100.0
var glide_gravity_scale := 0.25 

#for checkpoint
var passedcheckpoint = false

var num_jumps = 0

#for raincoat
var pressed = false
var entered = false

#for locked levels
var passedmercury = false
var passedvenus = false
var passedearth = false

#for earth
var seashells: int = 0
var climbing = false

#for reverse movement on venus
var reverse = false

#dimming screen
@onready var dim = $CanvasLayer6/dim
	

	
