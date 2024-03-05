extends Control

var life_orb_array = []
var life_orb_scene = preload("res://Scenes/life_orb.tscn")
@onready var score = $Score
@onready var life_positions = $LifePositions

func set_score_label(new_score):
	score.text = "SCORE: " + str(new_score)
	
func add_lives(number_of_lives):
	var life_array = life_positions.get_children()
	for n in number_of_lives:
		var new_life = life_orb_scene.instantiate()
		life_orb_array.append(new_life)
		life_array[n].add_child(new_life)

func lose_life(array_number):
	var orb_to_remove = life_orb_array[array_number]
	life_orb_array.remove_at(array_number)
	orb_to_remove.queue_free()
