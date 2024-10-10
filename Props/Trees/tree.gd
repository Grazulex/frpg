class_name Treee extends Node2D

var total_damage: int = 0
@export var total_damage_to_dead : int = 3

@onready var animation_player : AnimationPlayer = $TreeSprite/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.Damaged.connect( TakeDamage )
	pass # Replace with function body.

func TakeDamage( _damage : int ) -> void:
	total_damage += 1
	if total_damage == total_damage_to_dead:
		animation_player.play("fall")
	pass
