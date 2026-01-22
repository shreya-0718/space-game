extends ColorRect

@onready var dim = get_node("../dim")

func _ready():
	dim.visible = true
	dim.modulate.a = 0

func _dim_screen(duration: float = 1.0):
	var tween = create_tween()
	tween.tween_property(dim.modulate, "a", 0.5, duration)
