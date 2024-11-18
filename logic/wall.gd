extends Area2D

signal ball_out(wall_name)

func _on_wall_area_entered(area):
	if area.name == "Ball":
		#oops, ball went out of game place, reset
		emit_signal("ball_out", name)
		area.reset()
