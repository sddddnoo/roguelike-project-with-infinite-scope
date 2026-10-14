extends Area2D


var itemdata = Swordtype.new()

func _init() -> void: #on initialisation instead of ready, why? idk
	itemdata.name = "wooden sword"
	itemdata.damage = 5
	itemdata.cooldown = 1
	itemdata.range = 5
	itemdata.weapontype = Swordtype.Weapontype.WOOD


var player_node : Node

@export var initial_state : Node

var current_state : State

var states := {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(_on_child_transition)
			
			
	if initial_state:
		current_state = initial_state

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.PHYSICS_UPDATE(delta)
	
func _process(delta: float) -> void:
	if current_state:
		current_state.UPDATE(delta)


func _on_pick_up(player): #signal connected to pickupnode when 
	print("sword picked up")
	
	if current_state == initial_state:
		current_state.ispickedup = true
	player_node = player



		
func _on_child_transition(state,new_state_name):
	if state != current_state:
		return
	print("trans")
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.EXIT()
		
	new_state.ENTER()
	
	current_state = new_state
