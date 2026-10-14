extends Area2D
var itemdata = Cointype.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	itemdata.coinvalue = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_pick_up(player):
	print("+1 coins!")
	queue_free()
