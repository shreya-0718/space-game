extends Node2D

@onready var stars = [$star_container/star1, $star_container/star2, $star_container/star3]
@onready var venus = get_node("venus")
@onready var lock = get_node("lock")

func _ready():
	update_stars($mercury, global.mercury_stars)
	update_stars($venus, global.venus_stars)
	check_locked()

func update_stars(planet_node: Node, star_count: int):
	var container = planet_node.get_node("star_container")
	var stars = container.get_children()

	for i in range(stars.size()):
		stars[i].modulate = Color(1, 1, 1, 1) if i < star_count else Color(1, 1, 1, 0.3)

func check_locked():
	venus.modulate = Color(0.5, 0.5, 0.5, 1.0)
	lock.visible = true
	venus.disabled = true
	if global.passedmercury:
		venus.modulate = Color.WHITE
		lock.visible = false
		venus.disabled = false
		

#ARROW KEYS
var scroll_speed := 400

@onready var camera = $Camera2D

#Details: for level page background
#Background X = ?
#Background Y must be 640, x can be anything to fit the pictures
#Dimensions of camera = (960, 640)
#clamp MAX = Background X - 480

func _process(delta):
	var move := Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		move.x += 1
	if Input.is_action_pressed("ui_left"):
		move.x -= 1

	camera.position += move * scroll_speed * delta
	
	camera.position.x = clamp(camera.position.x, 480, 1200)
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
	camera.position.x = clamp(camera.position.x, 480, 1200)
