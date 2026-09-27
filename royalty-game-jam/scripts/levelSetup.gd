class_name levelSetup
extends Node


func _setup_level() -> void: 
	var enemies = $LevelRoot.get_node_or_null("Enemies")
	if enemies:
		for enemy in enemies.get_childern():
			enemy.the_king_is_dead.connect(_on_king_is_dead)
			
			
func _on_king_is_dead(body):
	body.die()
