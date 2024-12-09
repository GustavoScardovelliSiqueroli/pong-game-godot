extends Node2D

var initial_text = "gss"
var typing_speed: float = 0.05 
@onready var logo_label = $Tela/LogoNome
@onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	logo_label.text = initial_text
	animation_player.play("intro_animation")
	_start_typing()

func _start_typing():
	await get_tree().create_timer(1).timeout  # Aguarda o intervalo
	for i in 30:
		var initial_position = initial_text.length()
		logo_label.text += "s"  # Adiciona uma letra de cada vez
		await get_tree().create_timer(typing_speed).timeout  # Aguarda o intervalo

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "intro_animation":
		get_tree().change_scene_to_file("res://cenas/menu.tscn")
