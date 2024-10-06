extends Area2D

@export var new_background: Texture

# Reference to the node that handles the background
@onready var background_node = get_node("/root/World/HotelBed-01")

func _ready():
	# Connect the body_entered signal to our custom method
	connect("body_entered", Callable(self, "_on_body_entered"))
func _on_body_entered(body):
	print("Body entered: ", body.name)
	
	print("Player detected, changing background")
	change_background()
	

func change_background():
	print("Changing background")
	if background_node:
		print("Background node found")
		if new_background:
			print("New background texture found")
			background_node.texture = new_background
		else:
			print("New background texture is null")
	else:
		print("Background node not found")
