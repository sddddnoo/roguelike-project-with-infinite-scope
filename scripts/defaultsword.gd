extends Area2D
var itemdata = Swordtype.new()
var isequipped := false
var pickupcomp := preload("res://scenes/pickupcomponent.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	itemdata.name = "wooden sword"
	itemdata.damage = 5
	itemdata.cooldown = 1
	itemdata.range = 5
	itemdata.weapontype = Swordtype.Weapontype.WOOD

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !isequipped:
		var instance = pickupcomp.instantiate()
		instance.pickupnode = self
		add_child(instance)
	else:
		rotation = (get_global_mouse_position()-global_position).angle()+PI/2
		
