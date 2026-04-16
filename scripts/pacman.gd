extends CharacterBody2D

const SPEED = 300.0
var direccion = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	velocity = direccion * SPEED
	move_and_slide()
	if is_on_wall():
		direccion = direccion * -1
		
	if direccion.x < 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
