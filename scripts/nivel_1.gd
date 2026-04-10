extends Node2D
@export var numNivel = 1

func _ready() -> void:
	if numNivel >= Global.nivelActual:
		Global.nivelActual += 1
