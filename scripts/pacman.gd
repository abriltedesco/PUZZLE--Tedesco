extends CharacterBody2D

@export var esVertical = false # para poder aclarar cuando debe moverse verticalmente y cuando horizontalmente
@export var velocidad = 300.0 # cambie esto ya q chocaban los pacmans en el niv4 
@export var persigue = false
var direccion = Vector2.RIGHT

func _ready() -> void:
	if esVertical == true and persigue==false:
		direccion = Vector2.UP
		
func _physics_process(delta: float) -> void:
	velocity = direccion * velocidad
	move_and_slide()

	if persigue :
		var fantasma = get_parent().get_node_or_null("fantasmita")
		if fantasma != null:
			direccion = global_position.direction_to(fantasma.global_position)
	
	for i in get_slide_collision_count():	
		if get_slide_collision(i).get_collider().name == "fantasmita":
			if get_slide_collision(i).get_collider().cartelGO.visible == false:
				get_slide_collision(i).get_collider().perdiste()
				
	if is_on_wall() or is_on_ceiling() or is_on_floor():
		if !persigue:
			direccion = direccion * -1
	
	if persigue == true:
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
			
			
