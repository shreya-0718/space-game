extends Node2D

@onready var objects := {
	"spaceship": {"node": $spaceship, "depth": 3},
	"window": {"node": $spaceship/window, "depth": 100000000},
	"asteroid1": {"node": $asteroid1, "depth": 1.7},
	"asteroid2": {"node": $asteroid2, "depth": 0.8},
	"planet": {"node": $planet, "depth": 5.0},
	"comet": {"node": $comet, "depth": 3},
	"Galactico": {"node": $Galactico, "depth": 0.5},
	"Button": {"node": $Button, "depth": 0.5}
}

var rocking_names = ["spaceship", "asteroid1", "asteroid2", "planet", "comet"]

@onready var cam := $Camera2D
@onready var white := $WhiteRect

var original_positions := {}
var original_scales := {}


func _ready():
	for name in objects.keys():
		original_positions[name] = objects[name]["node"].position

	for name in objects.keys():
		original_positions[name] = objects[name]["node"].position
		original_scales[name] = objects[name]["node"].scale

	start_rocking() # have id crisis


func start_rocking():
	for name in rocking_names:
		var obj = objects[name]["node"]
		var depth = objects[name]["depth"]

		var amount = 5 * depth
		var speed = depth

		var t = create_tween().set_loops()
		t.tween_property(obj, "rotation_degrees", amount, speed).as_relative()
		t.tween_property(obj, "rotation_degrees", -amount, speed).as_relative()


func camera_dolly_in(duration := 1.5):
	var t = create_tween()
	t.tween_method(self._update_parallax, 0.0, 1.0, duration)


func _update_parallax(progress):
	var screen_center = get_viewport_rect().size / 2

	var eased = progress * progress
	
	for name in objects.keys():
		if name == "window":
			continue

		var obj = objects[name]["node"]
		var depth = objects[name]["depth"]
		var start_pos = original_positions[name]

		if name == "spaceship":
			var scale_amount = 1.0 + eased * (3.0 / depth)
			var base_scale = original_scales[name]
			obj.scale = base_scale * scale_amount

			var window_offset = screen_center - $spaceship/window.global_position
			obj.position += window_offset * eased
			continue
		
		var dir = (start_pos - screen_center).normalized()

		var fly_distance = 1800 * eased * (1.0 / depth)
		obj.position = start_pos + dir * fly_distance

		var scale_amount = 1.0 + eased * (3.0 / depth)
		var base_scale = original_scales[name]
		obj.scale = base_scale * scale_amount

	cam.zoom = Vector2(1.0 + eased * 0.2, 1.0 + eased * 0.2)

func _on_button_pressed():
	print("Clicked on button")
	camera_dolly_in(1.5)

	await get_tree().create_timer(1.5).timeout
	
	cam.position = $spaceship/window.global_position
	var t = create_tween()
	t.tween_property(cam, "zoom", Vector2(15, 15), 3).set_ease(Tween.EASE_IN)
	
	var w = create_tween()
	w.tween_property($WhiteRect, "modulate:a", 1.0, 0.8)
	await w.finished
	
	get_tree().change_scene_to_file("res://scenes/Test.tscn")
	
	# move this code to inside-rocket scene instead:
	var w2 = create_tween()
	w2.tween_property($WhiteRect, "modulate:a", 0, 0.8)
	await w2.finished
	
