extends Node

var enemy_scene = preload("res://Scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPositions

func spawn_enemy():
	var new_enemy = enemy_scene.instantiate()
	var pos_array = spawn_positions.get_children()
	pos_array.pick_random().add_child(new_enemy)
	
func _on_timer_timeout():
	spawn_enemy()
