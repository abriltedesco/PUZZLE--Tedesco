extends Node

var nivelActual = 1 :
	set(value):
		nivelActual = value
		nivelCambiado(value)

func _ready() -> void:
	pass # Replace with function body.

func nivelCambiado(nivel):
	nivelActual = nivel

func _process(delta: float) -> void:
	pass
