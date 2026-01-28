extends StaticBody2D

func _process(delta):
	if global.boots > 0:
		queue_free()
