extends CharacterBody2D
signal took_damage
#export is basically serialize field
@export var speed = 300
@export var rocket_spawn_offset = 90
var rocket_scene = preload("res://Scenes/rocket.tscn") # preload means it's loaded once on at the beginning instead of in runtime
#onready basically allows us to do a bunch of initialization logic that needs to be in the ready function without having type it all out in the ready function
@onready var rocket_container = $RocketContainer # get_node("RocketContainer")

func _physics_process(delta):
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("Up"):
		velocity.y = -speed
	if Input.is_action_pressed("Down"):
		velocity.y = speed
	if Input.is_action_pressed("Left"):
		velocity.x = -speed
	if Input.is_action_pressed("Right"):
		velocity.x = speed
	move_and_slide()

	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)
	
func _process(delta):
	if Input.is_action_just_pressed("Shoot"):
		shoot()

func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance) # rocket container doesn't have a transform to child to, so rocket instance uses its own
	rocket_instance.global_position = global_position
	rocket_instance.global_position.y -= rocket_spawn_offset

func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
