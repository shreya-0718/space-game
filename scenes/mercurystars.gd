extends Node2D

@onready var stars = [$star_container/star1, $star_container/star2, $star_container/star3]

func _ready():
	update_stars()

func update_stars():
	for i in range(stars.size()):
		stars[i].modulate = Color(1, 1, 1, 1) if i < global.mercury_stars else Color (1, 1, 1, 0.3)

	
