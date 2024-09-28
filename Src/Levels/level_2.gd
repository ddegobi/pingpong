extends Node2D

func _ready() -> void:
	$DialogBox.dialog_finished.connect($DialogArea.delete_dialog)
