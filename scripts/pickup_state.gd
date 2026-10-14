extends State
@export var statecontroller : Node
@export var sword : Node
var pickupcomp := preload("res://scenes/pickupcomponent.tscn")

var instance : Node

func ENTER():
	instance = pickupcomp.instantiate()
	instance.pickupnode = sword
	instance.position = sword.position
	add_child(instance)
	
	
	
func picked_up_by(player): #function thats initiated by the sword
	print("sword picked up")
	Transitioned.emit(self,"equipstate")
		
func EXIT():
	instance.queue_free()
