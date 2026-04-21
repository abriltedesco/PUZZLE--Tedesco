extends CharacterBody2D

@export var esVertical = false # para poder aclarar cuando debe moverse verticalmente y cuando horizontalmente
@export var velocidad = 300.0 # cambie esto ya q chocaban los pacmans en el niv4 
var direccion = Vector2.RIGHT

func _ready() -> void:
	if esVertical == true:
		direccion = Vector2.UP
		
func _physics_process(delta: float) -> void:
	velocity = direccion * velocidad
	move_and_slide()
	
	for i in get_slide_collision_count():	
		if get_slide_collision(i).get_collider().name == "fantasmita":
			if get_slide_collision(i).get_collider().cartelGO.visible == false:
				get_slide_collision(i).get_collider().perdiste()
				
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
			
			
