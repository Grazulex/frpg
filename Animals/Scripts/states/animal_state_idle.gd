class_name AnimalStateIdle extends AnimalState

@export var anim_name : String = "idle"
@export_category( "AI" )
@export var state_duration_min : float = 3.5
@export var state_duration_max : float = 10.5
@export var after_idle_state : AnimalState

var _timer : float = 0.0

func init() -> void:
	pass
	
func enter() -> void:
	animal.velocity = Vector2.ZERO
	_timer = randf_range( state_duration_min, state_duration_max )
	animal.update_animation( anim_name )
	pass
	
func exit() -> void:
	pass
	
func process ( _delta : float) -> AnimalState:
	_timer -= _delta
	if _timer <= 0:
		return after_idle_state
	return null
	
func physics ( _delta : float) -> AnimalState:
	return null
