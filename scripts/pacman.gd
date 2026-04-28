extends CharacterBody2D

@export var esVertical = false # para poder aclarar cuando debe moverse verticalmente y cuando horizontalmente
@export var velocidad = 300.0 # cambie esto ya q chocaban los pacmans en el niv4 
@export var persigue = false
@onready var navAgent = $navAgent
var fantasmaDetectado = null 
var direccion = Vector2.RIGHT

func _ready() -> void:
	if esVertical == true and persigue==false:
		direccion = Vector2.UP
		
func _physics_process(delta: float) -> void:
	if persigue and fantasmaDetectado != null:
		if !navAgent.is_navigation_finished():
				var proxPunto = navAgent.get_next_path_position()
				var diferencia = proxPunto - global_position
				if abs(diferencia.x) > abs(diferencia.y):
					direccion = Vector2(sign(diferencia.x), 0)
				else:
					direccion = Vector2(0, sign(diferencia.y))
			
	velocity = direccion * velocidad
	move_and_slide()	
	
	
	for i in get_slide_collision_count():	
		if get_slide_collision(i).get_collider().name == "fantasmita":
			if !get_slide_collision(i).get_collider().cartelGO.visible:
				get_slide_collision(i).get_collider().perdiste()
				
	if is_on_wall() or is_on_ceiling() or is_on_floor():
		direccion = direccion * -1
			
	
		velocity = direccion * velocidad
		move_and_slide()
		
	if persigue and fantasmaDetectado != null :
		if direccion.y != 0: 
			$Sprite2D.flip_h = false
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
	elif esVertical:
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
			
			
func _on_area_vision_body_entered(body: Node2D) -> void:
	if body.name == "fantasmita":
		fantasmaDetectado = body
		
func _on_area_vision_body_exited(body: Node2D) -> void:
	if body.name == "fantasmita":
		fantasmaDetectado = null


func _on_timer_timeout() -> void:
	if persigue and fantasmaDetectado != null:
		navAgent.target_position = fantasmaDetectado.global_position
