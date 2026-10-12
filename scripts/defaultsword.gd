extends Area2D
var itemdata = Swordtype.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	itemdata.name = "wooden sword"
	itemdata.damage = 5
	itemdata.cooldown = 1
	itemdata.range = 5
	itemdata.weapontype = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
