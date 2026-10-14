extends Area2D


var itemdata = Swordtype.new()

func _init() -> void: #on initialisation instead of ready, why? idk
	itemdata.name = "wooden sword"
	itemdata.damage = 5
	itemdata.cooldown = 1
	itemdata.range = 5
	itemdata.weapontype = Swordtype.Weapontype.WOOD


var pickupcomp := preload("res://scenes/pickupcomponent.tscn")
var player_node : Node


enum State {
	PICKUP,
	EQUIPPED
}

var current_state : State



func _ready() -> void:
	current_state = State.PICKUP

func _physics_process(delta: float) -> void:
	
	match current_state:
		State.PICKUP: pickup_state()
		State.EQUIPPED: equip_state()


func _on_pick_up(player):
	player_node = player
	current_state = State.EQUIPPED




func equip_state():
	
	position = player_node.position
	rotation = (get_global_mouse_position()-global_position).angle()+PI/2
	
func pickup_state():
	var instance = pickupcomp.instantiate()
	instance.pickupnode = self
	add_child(instance)
		
