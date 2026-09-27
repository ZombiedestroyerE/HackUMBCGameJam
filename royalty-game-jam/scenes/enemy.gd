extends CollisionShape2D

var SPEED = 100.0
var direction = -1.0


@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction * SPEED * delta
	
func _on_timer_timeout() -> void:
	direction *= -1
	animated_sprite.flip_h = !animated_sprite.flip_h
