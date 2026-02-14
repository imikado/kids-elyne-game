extends CharacterBody2D

const IDLE='idle'
const WALK_TOP='walk-top'
const WALK_DOWN='walk-down'

const WALK_LEFT='walk-left'
const WALK_RIGHT='walk-right'


const SPEED = 50.0
const JUMP_VELOCITY = -400.0

var _animation:String=IDLE

@onready var _animationPlayer=$AnimationPlayer

func _ready() -> void:
	anim_play(IDLE)

func _physics_process(_delta: float) -> void:
	
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var new_animation=IDLE

	
	if direction==-1.0:
		new_animation=WALK_LEFT
	elif(direction==1.0):
		new_animation=WALK_RIGHT
	
		
	var direction_vert := Input.get_axis("ui_up", "ui_down")
	
	if direction_vert==-1.0:
		new_animation=WALK_TOP
	elif(direction_vert==1.0):
		new_animation=WALK_DOWN
	
	if direction_vert:
		
		velocity.y = direction_vert * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	
	anim_play(new_animation)

	move_and_slide()
	
func anim_play(new_animation):
	if new_animation==_animation:
		_animationPlayer.play()
		return
		
	_animation=new_animation
	_animationPlayer.play(_animation)
