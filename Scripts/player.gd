extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animated_sprite
var animation_player

var isBlocked = false

var life = 3

func _ready():
	animated_sprite = $AnimatedSprite2D
	animation_player = $AnimationPlayer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !isBlocked:
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")
		animation_player.play("jump")
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction > 0 and !isBlocked :
		animated_sprite.flip_h = false
	elif direction < 0 and !isBlocked :
		animated_sprite.flip_h = true
	
	if direction and !isBlocked :
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/10)
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	move_and_slide()

func toogle_movie():
	isBlocked = !isBlocked
	
func lost_life(posXEnemy):
	if (life > 0) :
		life = life - 1
		print(life)
		if posXEnemy > position.x :
			velocity.x = JUMP_VELOCITY
		else :
			velocity.x = -JUMP_VELOCITY
		velocity.y = -SPEED
		isBlocked = true
		$Unlocker.start()
	else :
		print("resetear proximamente")
		pass

func _on_unlocker_timeout():
	isBlocked = false
