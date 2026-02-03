extends Node2D

@onready var astronaut = $astronaut
@onready var progress_bar = $CanvasLayer/Control/ProgressBar
@onready var level_start = $levelstart
@onready var level_end = $levelend
@onready var spot = $spawnpoint2
@onready var powerups = $CanvasLayer/powerups
func _ready():
	await get_tree().process_frame
	if global.entered:
		astronaut.global_position = spot.global_position
	progress_bar.add_theme_color_override("font_color", Color.WHITE)
	progress_bar.add_theme_stylebox_override("background", StyleBoxFlat.new())
	progress_bar.add_theme_stylebox_override("fill", StyleBoxFlat.new())
	var fill = progress_bar.get_theme_stylebox("fill")
	fill.bg_color = Color.RED
	progress_bar.value = 50	
			
func update_powerups():
	var container = get_node("CanvasLayer/powerups")
	var powerups = container.get_children()
	for i in range(powerups.size()):
		powerups[0].modulate = Color(1, 1, 1, 1) if global.ice_skates > 0 else Color(1, 1, 1, 0)
		powerups[1].modulate = Color(1, 1, 1, 1) if global.raincoat > 0 else Color(1, 1, 1, 0)

		
func _process(delta):
	update_progress_bar()
	update_powerups()
	progress_bar.visible = true
	if global.passedmercury:
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/levelpage1.tscn")
	
func update_progress_bar():
	var player_x = astronaut.position.x
	var start_x = level_start.position.x
	var end_x = level_end.position.x
	if end_x == start_x:
		return
	var progress = abs(100* (player_x - start_x) / (end_x - start_x))
	# progress = clamp(progress, 5, 10)
	
	progress_bar.value = progress
