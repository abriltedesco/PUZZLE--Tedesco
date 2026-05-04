extends Node2D
@export var numNivel = 2

func _ready() -> void:
		
	var cantidad = get_tree().get_nodes_in_group("comidita").size()
	Global.iniciarComiditas(cantidad)
	$ganasteCartel/Label.visible = false
	$perdisteCartel/Label.visible = false
	$perdisteCartel/Label2.visible = false
	
	if Global.esReinicio == true:
		$avisoCartel.visible = false
		Global.esReinicio = false 
		$reloj/Timer.start()
	else:
		get_tree().paused = true
		$avisoCartel.visible = true
		await get_tree().create_timer(5.0).timeout
		$avisoCartel.visible = false
		get_tree().paused = false
		$reloj/Timer.start()
