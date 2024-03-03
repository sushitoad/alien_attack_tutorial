extends Node2D

var enemies_escaped = 0

func _on_deathzone_area_entered(area):
	#If area.collision_layer = 2:
	#	print("enemy hit deathzone")
	area.die()
	enemies_escaped += 1
	print(enemies_escaped)
