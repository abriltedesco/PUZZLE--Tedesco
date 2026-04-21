extends Area2D

func _ready() -> void:
	body_entered.connect(_recolectada)
	
func _recolectada(cuerpo) -> void:
	if cuerpo.is_in_group("fantasma"):
		Global.pisarBoton()     
