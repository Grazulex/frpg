class_name Plant extends Node2D

@export var stock_value : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.Damaged.connect( TakeDamage )
	pass # Replace with function body.

func TakeDamage( _damage : int ) -> void:
	queue_free()
	pass
