extends CharacterBody2D
class_name Slime


const SPEED = 800.0
const JUMP_VELOCITY = -400.0

@onready var _animationPlayer=$AnimationPlayer

var _direction=1.0

func _ready() -> void:
	_animationPlayer.play("idle")
	
	
func _process(delta: float) -> void:
	velocity.x = _direction * SPEED*delta
	
	move_and_slide()
	
func go_back()->void:
	if _direction==1.0:
		_direction=-1.0
	else:
		_direction=1.0
