extends Node3D

func _ready() -> void:
	var image : Image = Image.load_from_file("res://gdpatch/mod/snaptic_smsixtyfour/big_steely/ball.png")
	var texture : ImageTexture = ImageTexture.create_from_image(image)
	$Node3D/Sprite3D.texture = texture
	
	$Node3D/CPUParticles3D.visible = false
	var material : StandardMaterial3D = $Node3D/CPUParticles3D.mesh.material
	image = Image.load_from_file("res://gdpatch/mod/snaptic_smsixtyfour/big_steely/puff.png")
	texture = ImageTexture.create_from_image(image)
	material.set_texture(BaseMaterial3D.TEXTURE_ALBEDO, texture)

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	$Node3D/CollisionShape3D.disabled = true
	$Node3D/HitboxArea3D/CollisionShape3D.disabled = true
	$Node3D/Sprite3D.visible = false
	$Node3D/CPUParticles3D.visible = true;
	$Node3D/CPUParticles3D.emitting = true;
	await get_tree().create_timer(0.3).timeout
	queue_free()
