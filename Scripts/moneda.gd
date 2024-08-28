extends Area2D

signal coinCollected
@onready var game_manager = $"../../Game_Manager"

func _on_body_entered(body):
	if body.get_collision_layer() == 1:
		var tween = create_tween().set_parallel(true)
		tween.tween_property(self, "position", position + Vector2(0, -50), 0.5)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		
		tween.chain().tween_callback(self.queue_free)
		game_manager.add_point()
