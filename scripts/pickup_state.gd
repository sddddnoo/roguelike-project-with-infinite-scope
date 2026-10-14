extends State
@export var statecontroller : Node
var pickupcomp := preload("res://scenes/pickupcomponent.tscn")
var ispickedup : bool


func ENTER():
	var instance = pickupcomp.instantiate()
	instance.pickupnode = self
	add_child(instance)
	
	ispickedup = false
	
func UPDATE(delta):
	if ispickedup:
		Transitioned.emit(self,"equipstate")
