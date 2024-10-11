class_name State_Fish_Idle extends State

var fish_idle : bool = false

@export var fish_idle_sound : AudioStream
@export_range(1,20,0.5) var decelarate_speed : float = 5.0

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var audio : AudioStreamPlayer2D  =  $"../../Audio/AudioStreamPlayer2D"
@onready var hurt_box : HurtBox = $"../../Interactions/HurtBox"

@onready var walk : State = $"../Walk"
@onready var idle : State = $"../Idle"


func Enter() -> void:
	player.UpdateAnimation("fish_idle")
	animation_player.animation_finished.connect( EndFish )
	
	audio.stream = fish_idle_sound
	audio.pitch_scale = randf_range( 0.9, 1.1 )
	audio.play()
	
	fish_idle = true
	
	await get_tree().create_timer( 0.075 ).timeout
	#hurt_box.monitoring = true
	pass

func Exit() -> void:
	animation_player.animation_finished.disconnect( EndFish )
	fish_idle = false
	#hurt_box.monitoring = false
	pass
	
func Process( _delta : float) -> State:
	player.velocity -= player.velocity * decelarate_speed * _delta
	
	if fish_idle == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null
	
func Physics( _delta : float) -> State:
	return null
	
func HandelInput( _event : InputEvent) -> State:
	return null
	
func EndFish( _newAnimName: String ) -> void:
	fish_idle = false
	pass
