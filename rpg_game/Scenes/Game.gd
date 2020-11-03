extends Node2D

onready var nav_2d : Navigation2D = $Navigation2D
onready var path_line : Line2D = $Line2D
onready var player : KinematicBody2D = $Player

func _unhandled_input(event) -> void:
	# Make sure we right clicked
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_RIGHT or not event.pressed:
		return
	# Set the path to where the player clicks
	var new_path : = nav_2d.get_simple_path(player.global_position, event.global_position / 2)
	path_line.points = new_path
	player.path = new_path
