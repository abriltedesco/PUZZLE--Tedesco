extends Area2D
@export var colorComida = "-"
func _ready() -> void:
	body_entered.connect(_recolectada)
	
	if colorComida != "-":
		match colorComida:
			"celeste":
				$Sprite2D.modulate = Color(0.0, 12.021, 14.983, 1.0)
			"violeta":
				$Sprite2D.modulate = Color(0.811, 0.064, 0.814, 1.0)
	
func _recolectada(cuerpo) -> void:
	if cuerpo.is_in_group("fantasma"):
		Global.recolectar(colorComida)   
		queue_free()         
