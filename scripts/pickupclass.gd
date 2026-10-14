extends Area2D

signal ispickedup(itemdata : Itemtype)

@export var pickupnode : Node #probably the parent node that gets picked up

func _ready() -> void:
	if pickupnode is Area2D:
		print("area2d",pickupnode.name)
		pickupnode.body_entered.connect(_on_body_entered)

func _on_body_entered(player: Node2D) -> void:
	if player.is_in_group("player"):
		ispickedup.connect(pickupnode._on_pick_up)
		ispickedup.emit(player) #transfers player node to the pickupnode
		#pickupnode.queue_free() instead of queue_free im only gonna send the signal to the pickup node and each pickup node now decides what to do so that i dont need to create a separate weapon handler
