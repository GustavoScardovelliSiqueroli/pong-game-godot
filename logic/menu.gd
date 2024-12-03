extends Control

var normal_font_size = 16
var focus_font_size = 20

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED

	$"MarginContainer/VBoxContainer/StartButton".grab_focus()
	$"MarginContainer/VBoxContainer/StartButton".add_theme_font_size_override("font_size",focus_font_size)
	
	for child in $"MarginContainer/VBoxContainer".get_children():
		if child is Button:
			var font_override = FontFile.new()
			font_override.font_data = load("res://assets/quaver.ttf") # Carrega a fonte
			child.focus_entered.connect(_on_button_focus_entered.bind(child))
			child.focus_exited.connect(_on_button_focus_exited.bind(child))

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/pong.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_button_focus_entered(button: Button) -> void:
	button.add_theme_font_size_override("font_size", focus_font_size)
	
func _on_button_focus_exited(button: Button) -> void:
	button.add_theme_font_size_override("font_size", normal_font_size)

