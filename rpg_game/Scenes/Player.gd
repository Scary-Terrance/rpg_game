extends KinematicBody2D

var speed : = 40.0
var path : = PoolVector2Array() setget set_path

func set_path(value : PoolVector2Array) -> void:
	path = value

func _process(delta: float) -> void:
	if path.size() > 0:
		var move_distance : = speed * delta
		move_along_path(move_distance)
	
func move_along_path(distance : float) -> void:
	var start_point : = position
	for i in range(path.size()):
		var distance_to_next : = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			break
		elif distance < 0.0:
			position = path[0]
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
