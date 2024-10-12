class_name State_Walk extends State

@export var move_speed : float = 50.0

@export var walk_sound : AudioStream

@onready var audio : AudioStreamPlayer2D  =  $"../../Audio/AudioStreamPlayer2D"

@onready var idle : State =  $"../Idle"
@onready var axe : State = $"../Axe"
@onready var sickle : State = $"../Sickle"
@onready var water : State = $"../Water"
@onready var planting : State = $"../Planting"
@onready var fishing : State = $"../FishIdle"

func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

func Exit() -> void:
	pass
	
func Process( _delta : float) -> State:	
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.UpdateAnimation("walk")
	
	return null
	
func Physics( _delta : float) -> State:
	return null
	
func HandelInput( _event : InputEvent) -> State:
	if _event.is_action_pressed("axe"):
		return axe
	if _event.is_action_pressed("sickle"):
		return sickle
	if _event.is_action_pressed("water"):
		return water	
	if _event.is_action_pressed("planting"):
		return planting		
	if _event.is_action_pressed("fishing"):
		return fishing				
	return null
