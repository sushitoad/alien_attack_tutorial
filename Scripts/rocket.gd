extends Area2D

@export var speed = 600
@onready var visible_notifier = $VisibleNotifier2D

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.y -= speed * delta
	
func _on_screen_exited():
	queue_free()

func _on_area_entered(area):
	area.die()
	queue_free()
