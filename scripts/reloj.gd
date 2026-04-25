extends CanvasLayer
@export var tiempoNivel = 60 

var tiempoActual = 0

func _ready() -> void:
	tiempoActual = tiempoNivel
	$Label.text = "Tiempo restante: " + str(tiempoActual)
	$Timer.timeout.connect(timeout)

func timeout() -> void:
	tiempoActual -= 1
	$Label.text = "Tiempo: " + str(tiempoActual)
	
	if tiempoActual <= 0:
		$Timer.stop()
		
		var fantasmas = get_tree().get_nodes_in_group("fantasma")
		if fantasmas.size() > 0: 
			fantasmas[0].perdiste() 
