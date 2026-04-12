extends CharacterBody2D

const SPEED = 150.0
var direccionActual = Vector2.RIGHT
@onready var tile = get_parent().get_node("tileMapLayers/frente")

func _physics_process(_delta: float) -> void:
	moverse()
	
func moverse() -> void:
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		dir = Vector2.RIGHT
		direccionActual = dir
	elif Input.is_action_pressed("ui_left"):
		dir = Vector2.LEFT
		direccionActual = dir
	elif Input.is_action_pressed("ui_down"):
		dir = Vector2.DOWN
		direccionActual = dir
	elif Input.is_action_pressed("ui_up"):
		dir = Vector2.UP
		direccionActual = dir
		
	velocity = dir * SPEED
	move_and_slide()
	
	
	if Input.is_action_just_pressed("ui_accept"):
		manejarNiebla()
		

func manejarNiebla() -> void:
	var posFrente = global_position + direccionActual * 32 
	var celda = tile.local_to_map(tile.to_local(posFrente))

	var destruir = false 
	
	for nodo in get_parent().get_children():
		if nodo.is_in_group("niebla"):
			if posFrente.distance_to(nodo.global_position) < 10:
				nodo.queue_free() 
				destruir = true
				
	if destruir:
		print("niebla destruida")
	else:
		if tile.get_cell_source_id(celda) == -1: # si está vacio
			var niebla = preload("res://escenas/niebla.tscn").instantiate()
			get_parent().add_child(niebla)
			niebla.global_position = tile.to_global(tile.map_to_local(celda))
			
