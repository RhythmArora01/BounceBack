extends CharacterBody2D

@export var initial_speed: float = 300.0
var speed: float

func _ready() -> void:
	reset_ball()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var collider = collision.get_collider()
		
		velocity = velocity.bounce(collision.get_normal())
		
		if collider.name == "Paddle":
			speed += 10.0
			velocity = velocity.normalized() * speed

	if position.y > 720:
		game_over()

func reset_ball() -> void:
	position = Vector2(576, 200)
	speed = initial_speed
	var random_angle = randf_range(-0.6, 0.6)
	velocity = Vector2(random_angle, 1).normalized() * speed

func game_over() -> void:
	get_tree().change_scene_to_file("res://gameOver.tscn")
	print("Ball went out of bounds! Game Over.")
	reset_ball()
