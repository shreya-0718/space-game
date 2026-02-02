extends Node2D

@onready var quicksand1 = $Node2D/AnimatedSprite2D
@onready var quicksand2 = $Node2D/AnimatedSprite2D2
var started := false

func _ready():
	$Node2D/AnimationPlayer.play("sync")
