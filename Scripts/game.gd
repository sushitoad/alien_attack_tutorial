extends Node2D

var lives = 3
var score = 0
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_damage_sound = $PlayerDamageSound
var go_screen = preload("res://Scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.add_lives(lives)

func _on_deathzone_area_entered(area):
	area.hit_player()

func _on_player_took_damage():
	player_damage_sound.play()
	lives -= 1
	if lives <= 0:
		player.die()
		await get_tree().create_timer(1).timeout
		var go_instance = go_screen.instantiate()
		$UI.add_child(go_instance)
		go_instance.set_score(score)
	print(lives)
	hud.lose_life(lives)

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
	enemy_hit_sound.play()
