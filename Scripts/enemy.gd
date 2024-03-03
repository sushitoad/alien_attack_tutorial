extends Area2D

@export var speed = 400
@onready var visible_notifier = $VisibleNotifier2D

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exit)

func _physics_process(delta):
	global_position.y += speed * delta
	
func _on_screen_exit():
	queue_free()
	
func die():
	queue_free()
