extends Node2D

@onready var stars = [$star_container/star1, $star_container/star2, $star_container/star3]
@onready var venus = get_node("venus")
@onready var lock = get_node("lock")
@onready var rocket = get_node("rocket")
@onready var venusspot = get_node("venusspot")
@onready var earth = get_node("earth")
@onready var lock2 = get_node("lock2")
@onready var earthspot = get_node("earthspot")

var mercurydone = false
var venusdone = false
func _ready():
	check_venus()
	check_earth()
	

func check_venus():
	if not mercurydone:
		venus.modulate = Color(0.5, 0.5, 0.5, 1.0)
		lock.visible = true
		venus.disabled = true
		if global.passedmercury:
			venus.modulate = Color.WHITE
			rocket.global_position = venusspot.global_position
			lock.visible = false
			venus.disabled = false
			mercurydone = true
		
func check_earth():
	if not venusdone:
		earth.modulate = Color(0.5, 0.5, 0.5, 1.0)
		lock2.visible = true
		earth.disabled = true
		if global.passedvenus:
			earth.modulate = Color.WHITE
			rocket.global_position = earthspot.global_position
			lock2.visible = false
			earth.disabled = false
			venusdone = true
		
#ARROW KEYS
var scroll_speed := 400

@onready var camera = $Camera2D

func _process(delta):
	var move := Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		move.x += 1
	if Input.is_action_pressed("ui_left"):
		move.x -= 1

	camera.position += move * scroll_speed * delta
	
	camera.position.x = clamp(camera.position.x, 480, 2132.8)
	camera.position.y = 320
	
#SCROLLING
var pan_speed := 1.0

func _input1(event):
	if event is InputEventPanGesture:
		camera.position.x -= event.delta.x * pan_speed
	
#DRAGGING
var dragging := false
var drag_speed := 1.0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed
	if event is InputEventMouseMotion and dragging:
		camera.position.x -= event.relative.x * drag_speed
	camera.position.y = 320
	camera.position.x = clamp(camera.position.x, 480, 2132.8)
