extends Sprite2D

var player

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		player = get_node("../../../Player/Player")
		print(player.global_position)
