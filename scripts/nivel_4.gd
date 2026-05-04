extends Node2D
@export var numNivel = 4

func _ready() -> void:	
	var cantidad = get_tree().get_nodes_in_group("comidita").size()
	Global.iniciarComiditas(cantidad, true)
	
	$avisoCartel/Label.visible = true
	$avisoCartel/Label2.visible = true
	await get_tree().create_timer(8.0).timeout
	$avisoCartel/Label.visible = false
	$avisoCartel/Label2.visible = false
	get_tree().paused = false
	$reloj/Timer.start()
