extends Area2D

@export_file("*.tscn") var next_level

func change_scene(scene_path: String):
	get_tree().change_scene_to_file(scene_path)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print(next_level)
		call_deferred("change_scene",next_level)
