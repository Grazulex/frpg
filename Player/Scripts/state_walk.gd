class_name State_Walk extends State

@export var move_speed : float = 50.0

@onready var idle : State =  $"../Idle"
@onready var axe : State = $"../Axe"

func Enter() -> void:
	player.sprite_walk.show()
	player.UpdateAnimation("walk")
	pass

func Exit() -> void:
	player.sprite_walk.hide()
	pass
	
func Process( _delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null
	
func Physics( _delta : float) -> State:
	return null
	
func HandelInput( _event : InputEvent) -> State:
	if _event.is_action_pressed("axe"):
		return axe
	return null
