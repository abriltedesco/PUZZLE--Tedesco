extends CharacterBody2D

const SPEED = 150.0

func _physics_process(delta: float) -> void:
	var direccion = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direccion.x = 1
	elif Input.is_action_pressed("ui_left"):
		direccion.x = -1
	elif Input.is_action_pressed("ui_down"):
		direccion.y = 1
	elif Input.is_action_pressed("ui_up"):
		direccion.y = -1
	
	velocity = direccion * SPEED
	move_and_slide()
