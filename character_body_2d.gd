extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("right")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("left")
	else:
		_animated_sprite.play("default")
