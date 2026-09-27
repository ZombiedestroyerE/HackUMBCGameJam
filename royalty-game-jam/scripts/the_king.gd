extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -300.
var if_alive = true
var has_sword = false 



@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if (if_alive):
		var direction := Input.get_axis("move_left", "move_right")
		
		# if king has gotten sword change sprite animation
		if(!(has_sword)):
			if direction == 0:
				animated_sprite.play("idle")
			elif direction != 0:
				animated_sprite.play("run")
		else:
			if direction == 0:
				animated_sprite.play("idle_sword")
			elif direction != 0:
				animated_sprite.play("run_sword")
			sword_attacks()
			

		# move_and_slide()

func movement(delta, direction)->void: 
	# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		
		
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
			
		
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

func die() -> void:
	if_alive = true
	print("Death")
	
func sword_attacks() -> void:
	pass
	


	
	
