extends CharacterBody2D

const BASE_SPEED: float = 100.0
@export var sprint_multiplier: float = 2.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("i_left", "i_right", "i_up", "i_down")
	var multiplier: float = 1.0
	if Input.is_action_pressed("i_sprint"):
		multiplier = sprint_multiplier
	velocity = direction * BASE_SPEED * multiplier
	move_and_slide()
