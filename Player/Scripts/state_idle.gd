class_name State_Idle extends State

@onready var walk : State = $"../Walk"
@onready var axe : State = $"../Axe"
@onready var pick : State = $"../Pick"
@onready var water : State = $"../Water"


func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

func Exit() -> void:
	pass

func Process( _delta : float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null
	
func Physics( _delta : float) -> State:
	return null
	
func HandelInput( _event : InputEvent) -> State:
	if _event.is_action_pressed("axe"):
		return axe
	if _event.is_action_pressed("pick"):
		return pick		
	if _event.is_action_pressed("water"):
		return water	
	return null
