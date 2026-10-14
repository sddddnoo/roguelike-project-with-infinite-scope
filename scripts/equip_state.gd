extends State
@export var sword : Node

func ENTER():
	print("done")
	
	
func PHYSICS_UPDATE(delta : float):
	
	var mouse_pos = (sword.get_global_mouse_position()-sword.global_position).normalized()
	const _speed := 50
		# Smoothly move the sword toward the target
	var radius = 40
	var target_position = sword.player_node.global_position + mouse_pos * radius
	sword.global_position = target_position

	sword.rotation = mouse_pos.angle()+PI/2
func EXIT():
	pass
