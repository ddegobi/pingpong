extends Area2D

##Dictionary key of the dialog we want to select-
@export var dialog_key: String = ""
##How many times is the dialog gonna be interactable
@export_enum("always","once") var available: String = "always"

var area_active = false

func delete_dialog(key):
	if available == "once" and key == dialog_key:
			print("entered if statement")
			queue_free()

func _input(event):
	if area_active and event.is_action_pressed("ui_accept"):
		SignalBus.emit_signal("display_dialog", dialog_key)

func _on_area_entered(area: Area2D) -> void:
	area_active = true

func _on_area_exited(area: Area2D) -> void:
	area_active = false
	
	#why you say fuck me for right
