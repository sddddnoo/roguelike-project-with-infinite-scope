extends State
@export var sword : Node

func ENTER():
	damage()
	
	
func PHYSICS_UPDATE(delta : float):
	_rotate_along_mouse()
	
func EXIT():
	pass
	
	
	
	
func _rotate_along_mouse(): #bug rn is that when mouse is close to sword the sword bugs out
	
	var mouse_pos = (sword.get_global_mouse_position()-sword.global_position).normalized()
	const _speed := 50
		# Smoothly move the sword toward the target
	var radius = 30
	var target_position = sword.player_node.global_position + mouse_pos * radius
	sword.global_position = target_position

	sword.rotation = mouse_pos.angle()+PI/2
	
func damage():
	if sword is Area2D:
		print("called")
		sword.area_entered.connect(_on_body_entered)
		print("entered")

var canhit : = true

func _on_body_entered(body : Node):
	if canhit:
		print(sword.itemdata.damage," damage dealt on ",body.name)
		canhit = false
		await get_tree().create_timer(sword.itemdata.cooldown).timeout
		canhit = true
