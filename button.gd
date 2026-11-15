extends Button

func _on_pressed() -> void:
	var error = get_tree().change_scene_to_file("res://main.tscn")
	
	if error != OK:
		print("Failed to load main scene. Check the file path!")
