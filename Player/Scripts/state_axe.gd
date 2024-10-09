class_name State_Axe extends State

var axing : bool = false
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var walk : State = $"../Walk"
@onready var idle : State = $"../Idle"

func Enter() -> void:
	player.sprite_axe.show()
	player.UpdateAnimation("axe")
	animation_player.animation_finished.connect( EndAxe )
	axing = true
	pass

func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAxe )
	axing = false
	player.sprite_axe.hide()
	pass
	
func Process( _delta : float) -> State:
	player.velocity = Vector2.ZERO
	if axing == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null
	
func Physics( _delta : float) -> State:
	return null
	
func HandelInput( _event : InputEvent) -> State:
	return null
	
func EndAxe( _newAnimName: String ) -> void:
	axing = false
	pass
