extends Node2D

## Clock to be spawned
@export var clock_scene = preload("res://scenes/clock.tscn")
@export var clock_radius := 128.

func _ready() -> void:
	# Window size is initialized together with the _ready function, not before
	var window_size := get_window().size
	($Bottom as Node2D).position.y = window_size.y + 2.0 * clock_radius
	
	# StaticBody2D is not affected by outside forces. 
	var ground := $Ground as Node2D
	# Position is measured from centre of the rectangle
	ground.position = Vector2(
		0.5 * window_size.x,
		window_size.y + 0.5 * clock_radius
	)
	# This multiplies the original size, which is now 1px, 1px
	ground.scale = Vector2(window_size.x, clock_radius)
	

# This is a function that was connected from the Area2D node to the Main node. 
# whenever a body enters the 2D area node, this function is triggered. This is 
# done both under the hood and through the UI
func _on_bottom_body_entered(body: Node2D) -> void:
	# free() deletes the node immediately. 
	# queue_free() deletes the node at the end of the frame
	body.queue_free()
	


func _on_spawn_timer_timeout() -> void:

	var mat = PhysicsMaterial.new()
	mat.bounce = 1
	mat.friction = 0.1
	
	# The clock's own _ready function gets called
	var window_size = get_window().size
	var clock := clock_scene.instantiate() as Node2D
	clock.position = Vector2(
		randf_range(clock_radius, window_size.x - clock_radius),
		clock_radius * -3.0
	)
	var random_number = randi_range(0, 100)
	if random_number % 2 == 0:
		clock.physics_material_override = mat
	add_child(clock)
