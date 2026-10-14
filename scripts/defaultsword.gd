extends Area2D

@export var pickup_state : State

var itemdata = Swordtype.new()

func _init() -> void: #on initialisation instead of ready, why? idk
	itemdata.name = "wooden sword"
	itemdata.damage = 5
	itemdata.cooldown = 1
	itemdata.range = 5
	itemdata.weapontype = Swordtype.Weapontype.WOOD


var player_node : Node

func _on_pick_up(player):
	player_node = player
	pickup_state.picked_up_by(player)
