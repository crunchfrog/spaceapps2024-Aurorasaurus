extends AnimatedSprite2D

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		player = get_node("../../../Player/Player")
		print(player.global_position)
