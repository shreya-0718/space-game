extends Area2D

@onready var platform = get_node("platform/CollisionShape2D")

func _ready():
	platform.disabled = true
	
func _on_body_entered(body):
	platform.enabled = true
