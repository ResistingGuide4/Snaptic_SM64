extends Node3D

func _ready() -> void:
	var image = Image.load_from_file("res://gdpatch/mod/snaptic_smsixtyfour/big_steely/ball.png")
	var texture = ImageTexture.create_from_image(image)
	$Sprite3D.texture = texture

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ball1_move":
		queue_free()
