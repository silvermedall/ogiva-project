extends CharacterBody2D

const BASE_SPEED: float = 100.0
@export var sprint_multiplier: float = 2.0


func _ready() -> void:
	pass

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _physics_process(_delta: float) -> void:
	if !is_multiplayer_authority(): 
		return
	
	var direction: Vector2 = Vector2(
		Input.get_action_strength("i_right") - Input.get_action_strength("i_left"), 
		Input.get_action_strength("i_down") - Input.get_action_strength("i_up")
	).normalized()
	
	var speed_multiplier: float = 1.0
	if Input.is_action_pressed("i_sprint"):
		speed_multiplier = sprint_multiplier
	
	velocity = direction * BASE_SPEED * speed_multiplier
	move_and_slide()
