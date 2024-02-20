extends Node

var obstacle: PackedScene = preload("res://scenes/obstacle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	add_child(obstacle.instantiate())
	$SpawnTimer.wait_time = randf_range(1.2, 3)
	
	$SpawnTimer.start()
