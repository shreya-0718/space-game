extends Node2D

@onready var astronaut = $astronaut
@onready var progress_bar = $CanvasLayer/Control/ProgressBar
@onready var level_start = $levelstart
@onready var level_end = $levelend

func _ready():
	await get_tree().process_frame

	print("Parent size:", progress_bar.get_parent().size)
	print("Bar size:", progress_bar.size)
	
	progress_bar.add_theme_color_override("font_color", Color.WHITE)
	progress_bar.add_theme_stylebox_override("background", StyleBoxFlat.new())
	progress_bar.add_theme_stylebox_override("fill", StyleBoxFlat.new())

	var fill = progress_bar.get_theme_stylebox("fill")
	fill.bg_color = Color.RED
	progress_bar.value = 50
	
func _process(delta):
	update_progress_bar()
	progress_bar.visible = true

func update_progress_bar():
	var player_x = astronaut.position.x
	var start_x = level_start.position.x
	var end_x = level_end.position.x
	
	print("player", player_x)
	print("start", start_x)
	print("end", end_x)
	
	if end_x == start_x:
		return
	
	
	var progress = abs(100* (player_x - start_x) / (end_x - start_x))
	print()
	print(progress)
	print()
	# progress = clamp(progress, 5, 10)
	
	progress_bar.value = progress
