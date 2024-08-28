extends CharacterBody2D

@export var animacionDiferente : bool
@export var SPEED : int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	if animacionDiferente:
		$AnimationPlayer.play("fly2")

func _physics_process(delta):
	velocity.x = -SPEED
	move_and_slide()
