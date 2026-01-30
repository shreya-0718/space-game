extends HBoxContainer

@export var gray_star: Texture2D
@export var gold_star: Texture2D

func _process(delta):
	set_stars()
func set_stars():
	var stars = get_children()
	for i in range(stars.size()):
		var star = stars[i]
		if i < global.mercury_stars:
			star.texture = gold_star
		else:
			star.texture = gray_star
		if i < global.mercury_stars:
			star.texture = gold_star
		else:
			star.texture = gray_star
