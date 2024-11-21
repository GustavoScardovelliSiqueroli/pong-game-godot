extends Node2D

var left_score = 0
var right_score = 0
@onready var left_score_label = $CanvasLayer/Control/LeftScoreLabel
@onready var right_score_label = $CanvasLayer/Control/RightScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_score(wall_name):
	if wall_name == "LeftWall":
		right_score += 1  # Jogador da direita marcou ponto
	elif wall_name == "RightWall":
		left_score += 1  # Jogador da esquerda marcou ponto
	
	# Atualiza os Labels na interface
	left_score_label.text = str(left_score)
	right_score_label.text = str(right_score)


func _on_left_wall_ball_out(wall_name: Variant) -> void:
	update_score(wall_name)


func _on_right_wall_ball_out(wall_name: Variant) -> void:
	update_score(wall_name)
