extends Node

signal enemy_spawned(enemy_instance)

var enemy_scene = preload("res://Scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPositions

func spawn_enemy():
	var new_enemy = enemy_scene.instantiate()
	var pos_array = spawn_positions.get_children()
	var new_spawn_pos = pos_array.pick_random()
	new_enemy.global_position = new_spawn_pos.global_position
	emit_signal("enemy_spawned", new_enemy)
	
func _on_timer_timeout():
	spawn_enemy()
