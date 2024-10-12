class_name AnimalStateWalk extends AnimalState

@export var anim_name : String = "walk"
@export var walk_speed : float = 20.0
@export_category( "AI" )
@export var state_animation_duration : float = 0.8
@export var state_animation_cycle_min : int = 1
@export var state_animation_cycle_max : int = 3
@export var next_state : AnimalState

var _timer : float = 0.0
var _direction	: Vector2

func init() -> void:
	pass
	
func enter() -> void:
	_timer = randi_range(state_animation_cycle_min, state_animation_cycle_max) * state_animation_duration
	var rand = randi_range( 0 , 3 )
	_direction = animal.DIR_4[ rand ]
	animal.velocity = _direction * walk_speed
	animal.set_direction( _direction )
	animal.update_animation( anim_name )
	pass
	
func exit() -> void:
	pass
	
func process ( _delta : float) -> AnimalState:
	_timer -= _delta
	
	if _timer < 0:
		return next_state
	return null
	
func physics ( _delta : float) -> AnimalState:
	return null
