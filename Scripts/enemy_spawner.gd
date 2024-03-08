extends Node

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

var enemy_scene = preload("res://Scenes/enemy.tscn")
var path_enemy_scene = preload("res://Scenes/path_enemy.tscn")
@onready var spawn_positions = $SpawnPositions

func spawn_enemy():
	var new_enemy = enemy_scene.instantiate()
	var pos_array = spawn_positions.get_children()
	var new_spawn_pos = pos_array.pick_random()
	new_enemy.global_position = new_spawn_pos.global_position
	emit_signal("enemy_spawned", new_enemy)

func _on_timer_timeout():
	spawn_enemy()

func spawn_path_enemy():
	var path_enemy = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy)

func _on_path_enemy_timer_timeout():
	spawn_path_enemy()
