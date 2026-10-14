extends CharacterBody2D


var SPEED := 300.0


func _ready() -> void:
	add_to_group("player")


func _physics_process(delta: float) -> void:
	# Handle jump.
	move()
	
	
func move():
	var directiony := Input.get_axis("ui_up", "ui_down")
	var directionx := Input.get_axis("ui_left", "ui_right")
	var direction = Vector2(directionx,directiony).normalized()
	if direction:
		velocity = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
