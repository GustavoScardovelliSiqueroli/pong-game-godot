extends Node2D

var left_score = 0
var right_score = 0
var all_points = 0
@onready var left_score_label = $CanvasLayer/Control/LeftScoreLabel
@onready var right_score_label = $CanvasLayer/Control/RightScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func update_score(wall_name):
	update_all_points()
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

func update_all_points():
	all_points += 1
	print(all_points)
