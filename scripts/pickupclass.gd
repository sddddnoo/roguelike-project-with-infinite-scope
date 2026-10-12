extends Area2D
signal ispickedup(itemdata : Itemtype)
@export var pickupnode : Node


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("_on_pick_up"):
		ispickedup.connect(body._on_pick_up)
		ispickedup.emit(pickupnode.itemdata)
		pickupnode.queue_free()
