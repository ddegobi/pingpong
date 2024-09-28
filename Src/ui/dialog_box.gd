extends CanvasLayer

signal dialog_finished(text_key)

@export_file("*.json") var scene_text_file  #reference to our json file (will set in the editor)

var scene_text = {}  #dict used for all the text in the scene
var selected_text = []  #text CURRENTLY being used in the dialog
var in_progress = false  #used to see if the dialog box is still displaying text
var current_text_key: String
#references to our ui
@onready var background = $ControlScale/Background
@onready var text_label = $ControlScale/TextLabel

func _ready():
	background.visible = false
	scene_text = load_scene_text()
	SignalBus.display_dialog.connect(on_display_dialog) #we need to connect our signal bus

func load_scene_text():
	if FileAccess.file_exists(scene_text_file): 
		var dialog_file = FileAccess.open(scene_text_file, FileAccess.READ)
		return JSON.parse_string(dialog_file.get_as_text())

func show_text():
	text_label.text = selected_text.pop_front()

func next_line():
	if !selected_text.is_empty():
		show_text()
	else:
		finish()

func finish():
	text_label.text = ""
	background.visible = false
	in_progress = false
	get_tree().paused = false
	dialog_finished.emit(current_text_key)
	

func on_display_dialog(text_key):
	current_text_key = text_key
	if in_progress:
		next_line()
	else:
		get_tree().paused = true
		background.visible = true
		in_progress = true
		selected_text = scene_text[text_key].duplicate()
		show_text()
