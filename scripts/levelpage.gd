extends Node2D

@onready var stars = [$star_container/star1, $star_container/star2, $star_container/star3]
@onready var venus = get_node("venus")
@onready var lock = get_node("lock")
@onready var rocket = get_node("rocket")
@onready var venusspot = get_node("venusspot")
@onready var earth = get_node("earth")
@onready var lock2 = get_node("lock2")
@onready var earthspot = get_node("earthspot")
@onready var mars = get_node("mars")
@onready var lock3 = get_node("lock3")
@onready var marsspot = get_node("marsspot")

@onready var jupiter = get_node("jupiter")
@onready var lock4 = get_node("lock4")

@onready var saturn = get_node("saturn")
@onready var lock5 = get_node("lock5")

@onready var neptune = get_node("neptune")
@onready var lock6 = get_node("lock6")

@onready var uranus = get_node("uranus")
@onready var lock7 = get_node("lock7")

@onready var pluto = get_node("pluto")
@onready var lock8 = get_node("lock8")

@onready var txt = get_node("Label2")

var mercurydone = false
var venusdone = false
var earthdone = false

func _ready():
	txt.visible = false
	check_venus()
	check_earth()
	check_mars()
	jupiter.modulate = Color(0.5, 0.5, 0.5, 1.0)
	saturn.modulate = Color(0.5, 0.5, 0.5, 1.0)
	neptune.modulate = Color(0.5, 0.5, 0.5, 1.0)
	uranus.modulate = Color(0.5, 0.5, 0.5, 1.0)
	pluto.modulate = Color(0.5, 0.5, 0.5, 1.0)
	
func check_mars():
	if not earthdone:
		mars.modulate = Color(0.5, 0.5, 0.5, 1.0)
		lock3.visible = true
		mars.disabled = true
		if global.passedearth:
			mars.modulate = Color.WHITE
			rocket.global_position = marsspot.global_position
			lock3.visible = false
			mars.disabled = false
			earthdone = true
	

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
	camera.position.x = clamp(camera.position.x, 480, 1700)
