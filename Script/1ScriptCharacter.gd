extends CharacterBody2D

#Variabler
@export var speed = 200
@export var jump = -300
@onready var animatedSprite = $AnimatedSprite2D

var isInCombo = false

var timeTillNextInput = 0.5
var time = 0

var currentAttack = 0
var previousAttack = 0

func _ready():
	time = timeTillNextInput

func _process(delta):
	pass
