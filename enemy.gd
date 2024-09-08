extends Node2D

# Preload the enemy scene
var Enemy = preload("res://enemy.tscn")

# Screen size to spawn at random x positions
var screen_size = Vector2()

func _ready():
	# Get the size of the screen
	screen_size = get_viewport_rect().size

	# Create and configure the Timer
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = 1.0  # Spawn every 1 second (adjust as needed)
	spawn_timer.one_shot = false  # Continue spawning indefinitely
	
	# Corrected connect() usage with Callable
	spawn_timer.connect("timeout", Callable(self, "_on_spawn_timeout"))
	
	add_child(spawn_timer)
	
	# Start the timer to begin spawning objects
	spawn_timer.start()

# Function to spawn an enemy when the timer times out
func _on_spawn_timeout():
	# Ensure the scene was preloaded correctly and is a PackedScene
	if Enemy != null:
		# Create an instance of the enemy scene
		var enemy_instance = Enemy.instantiate()
		
		# Add it to the scene tree
		add_child(enemy_instance)
		
		# Set a random x position above the screen (just a bit above 0 on the y-axis)
		enemy_instance.position = Vector2(
			randf_range(0, screen_size.x),  # Random x position across the screen width
			-50  # Just above the top of the screen
		)
