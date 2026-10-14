extends State
@export var statecontroller : Node
@export var sword : Node
var pickupcomp := preload("res://scenes/pickupcomponent.tscn")

var instance : Node

func ENTER():
	instance = pickupcomp.instantiate()
	instance.pickupnode = self
	instance.position = sword.position
	add_child(instance)
	
	
	
func _on_pick_up(player): #signal connected to pickupnode when 
	print("sword picked up")
	sword.player_node = player
	Transitioned.emit(self,"equipstate")
		
func EXIT():
	instance.queue_free()
