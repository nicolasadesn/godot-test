extends Node2D

const SPEED = 10.0
var direction = -1



func _on_area_2d_body_entered(body):
	if body.collision_layer == 1 :
		body.lost_life(position.x)
