extends Area2D

signal died
@export var speed = 400
@onready var visible_notifier = $VisibleNotifier2D

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exit)

func _physics_process(delta):
	global_position.y += speed * delta
	
func _on_screen_exit():
	queue_free()
	
func die():
	emit_signal("died")
	queue_free()

func _on_body_entered(body):
	body.take_damage()
	die()
