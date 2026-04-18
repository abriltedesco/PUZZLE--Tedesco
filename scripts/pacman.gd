extends CharacterBody2D

@export var esVertical = false # para poder aclarar cuando debe moverse verticalmente y cuando horizontalmente
const SPEED = 300.0
var direccion = Vector2.RIGHT

func _ready() -> void:
	if esVertical == true:
		direccion = Vector2.UP
		
func _physics_process(delta: float) -> void:
	velocity = direccion * SPEED
	move_and_slide()
	if is_on_wall() or is_on_ceiling() or is_on_floor():
		direccion = direccion * -1
		
	if esVertical == true:
		if direccion.y < 0: 
			$Sprite2D.rotation_degrees = -90
		else:
			$Sprite2D.rotation_degrees = 90
	else: 	
		$Sprite2D.rotation_degrees = 0
		if direccion.x < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
