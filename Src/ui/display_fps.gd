extends CanvasLayer

func _process(delta: float) -> void:
	$FPSLabel.text = "FPS: " + str(Engine.get_frames_per_second())
