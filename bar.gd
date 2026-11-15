extends CharacterBody2D

@export var speed: float = 400.0
var fixed_y: float

func _ready() -> void:
	# Save the initial vertical position to lock it in place
	fixed_y = position.y

func _physics_process(delta: float) -> void:
	# Get input direction (-1 for left, 1 for right)
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * speed
	else:
		# Smoothly stop when no keys are pressed
		velocity.x = move_toward(velocity.x, 0, speed)
	
	# Keep vertical velocity at zero to prevent falling
	velocity.y = 0
	
	move_and_slide()
	
	# Hard-lock the Y position so collisions can never push it out of place
	position.y = fixed_y
