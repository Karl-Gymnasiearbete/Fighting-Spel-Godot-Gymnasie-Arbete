extends CharacterBody2D

#Variabler
@export var speed = 200
@export var jump = -300
@onready var animatedSprite = $AnimatedSprite2D

var isInCombo = false

var timeTillNextInput = 0.5
var time = 0

var current_Attack = 0
var previous_Attack = 0

func _ready():
	time = timeTillNextInput

func _process(delta):
	if(Input.is_action_just_pressed("ui_punch")):
		if(current_Attack == 0):
			animatedSprite.play("Punch")
		elif(current_Attack == 1):
			animatedSprite.play("Upper Cut")
		elif(current_Attack == 2):
			animatedSprite.play("Kick")
		
		isInCombo = true
		current_Attack += 1
		_Reset_Attack_Timer()
	
	if(isInCombo):
		time -= delta
		
		if(time <0):
			time = timeTillNextInput
			isInCombo = false
			current_Attack = 0
			animatedSprite.play("Idle")


func _Reset_Attack_Timer():
	if(current_Attack < 4):
		time = timeTillNextInput
