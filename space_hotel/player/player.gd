extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var actionable_finder: Area2D = $Direction/ActionableFinder
@onready var sprite := get_node("AnimatedSprite2D")


func _unhandled_input(_event: InputEvent) -> void:
	if (Input.is_anything_pressed()) and is_on_floor():
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			# DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "start")
			return
		

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# Flip the sprite based off direction.
	if (direction > 0):
		sprite.flip_h = true 
	if (direction < 0):
		sprite.flip_h = false 
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
