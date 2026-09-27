extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setup_level();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _setup_level() -> void: 
	var enemies = $LevelRoot.get_node_or_null("Enemies")
	if enemies:
		for enemy in enemies.get_children():
			enemy.player_died.connect(_on_king_is_dead)


func _on_king_is_dead(body):
	body.die()
