extends Node2D

@onready var astronaut = $astronaut
@onready var progress_bar = $CanvasLayer/Control/ProgressBar
@onready var level_start = $levelstart
@onready var level_end = $levelend

func _ready():
	await get_tree().process_frame

	progress_bar.add_theme_color_override("font_color", Color.WHITE)
	progress_bar.add_theme_stylebox_override("background", StyleBoxFlat.new())
	progress_bar.add_theme_stylebox_override("fill", StyleBoxFlat.new())

	var fill = progress_bar.get_theme_stylebox("fill")
	fill.bg_color = Color.RED
	progress_bar.value = 50

	
func update_stars():
	var container = get_node("CanvasLayer2/star_container") 
	var stars = container.get_children()
	for i in range(stars.size()):
		stars[i].modulate = Color(1, 1, 1, 1) if i < global.mercury_stars else Color(1, 1, 1, 0.3)

func update_powerups():
	var container = get_node("CanvasLayer3/powerups")
	var powerups = container.get_children()
	for i in range(powerups.size()):
		powerups[0].modulate = Color(1, 1, 1, 1) if global.ice_skates > 0 else Color(1, 1, 1, 0)
		powerups[1].modulate = Color(1, 1, 1, 1) if global.raincoat > 0 else Color(1, 1, 1, 0)

func _process(delta):
	update_progress_bar()
	update_stars()
	update_powerups()
	progress_bar.visible = true

func update_progress_bar():
	var player_x = astronaut.position.x
	var start_x = level_start.position.x
	var end_x = level_end.position.x
	
	
	
	if end_x == start_x:
		return
	
	
	var progress = abs(100* (player_x - start_x) / (end_x - start_x))
	
	# progress = clamp(progress, 5, 10)
	
	progress_bar.value = progress
	
