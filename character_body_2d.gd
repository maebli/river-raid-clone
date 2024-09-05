extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x/2, screen_size.y-50)

const SPEED = 10

func _process(_delta):
	
	screen_size = get_viewport_rect().size
	var velocity = 0

	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("right")
		velocity+=1*SPEED
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("left")
		velocity-=1*SPEED
	else:
		_animated_sprite.play("default")
		
	position += Vector2(velocity,0)

	position.x = clamp(position.x, 0, screen_size.x)
	position.y = screen_size.y - 50



func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
