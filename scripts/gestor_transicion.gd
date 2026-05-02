extends CanvasLayer

func cambiarEscena(ruta_nueva_escena: String) -> void:
	var tween = create_tween().tween_property($ColorRect, "color:a", 1.0, 1.0) 	
	await tween.finished
	get_tree().change_scene_to_file(ruta_nueva_escena)
	create_tween().tween_property($ColorRect, "color:a", 0.0, 1.0)
