extends CharacterBody2D

#Variabler
@export var speed = 200
@export var jump = -300

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#Jump funktioner
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump
	
	#movement funtioner
	var direction = Input.get_axis("Left","Right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0 , speed)
	move_and_slide()
