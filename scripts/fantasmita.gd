extends CharacterBody2D

const SPEED = 150.0
var direccionActual = Vector2.RIGHT
@onready var tile = get_parent().get_node("tileMapLayers/frente")
@onready var tileSalida = get_parent().get_node("tileMapLayers/fondito/salida")
@onready var cartel = get_parent().get_node("ganasteCartel/Label")
@onready var cartelGO = get_parent().get_node("perdisteCartel/Label")
@onready var cartelGO2 = get_parent().get_node("perdisteCartel/Label2")

func _physics_process(_delta: float) -> void:
	moverse()
	verificarSalida()
	
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
	
	for i in get_slide_collision_count():
		if get_slide_collision(i).get_collider().is_in_group("pacman"):
			perdiste()
	
	if Input.is_action_just_pressed("ui_accept"):
		manejarNiebla()
		

func manejarNiebla() -> void:
	var posFrente = global_position + direccionActual * 32 # donde mira fantasma en pxs
	var celda = tile.local_to_map(tile.to_local(posFrente)) # "traducido" al cuadradito de la grillita del tile
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
		
func verificarSalida():
	var celda_actual = tileSalida.local_to_map(tile.to_local(global_position))
	var tile_data = tileSalida.get_cell_tile_data(celda_actual) #devuelve objeto
	
	if tile_data != null:      
		if tile_data.get_custom_data("esSalida") == true && Global.salidaAbierta:
			ganaste() 
			
func ganaste() -> void:
	velocity = Vector2.ZERO
	set_physics_process(false)
	cartel.visible = true
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://escenas/niveles.tscn")
	
func perdiste() -> void:
	velocity = Vector2.ZERO
	set_physics_process(false)
	cartelGO.visible = true
	cartelGO2.visible = true
	await get_tree().create_timer(3.0).timeout
	get_tree().reload_current_scene()
