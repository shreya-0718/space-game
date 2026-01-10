extends Node2D

@onready var astronaut = $astronaut
@onready var progress bar = $CanvaLayer/ProgressBar
@onready var level_start = $levelstart
@onready var level_end = $levelend

func _process(delta):
	update_progress_bar()

func update_progress_bar():
	var player_x = player.global_position.x
	var start_x = level_start.global_position.x
	var end_x = level_end.global_position.x
	
	if end_x == start_x:
		return
	
	var progress = (player_x - start_x) / (end_x - start_x)
	progress = clamp(progress)
	
