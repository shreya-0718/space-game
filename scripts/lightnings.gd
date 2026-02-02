extends Node2D

@onready var light1 = get_node("Sprite2D")
@onready var light2 = get_node("Sprite2D2")
@onready var light3 = get_node("Sprite2D3")


func _ready():
	light1.visible = false
	light2.visible = false
	light3.visible = false
	
