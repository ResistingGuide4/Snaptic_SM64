extends Level

@onready var platform_anim1: AnimationPlayer = $Level/CheckerboardLift.get_child(0).get_child(3)
@onready var platform_anim2: AnimationPlayer = $Level/CheckerboardLift2.get_child(0).get_child(3)

func _ready() -> void:
	var stream = AudioStreamMP3.load_from_file("res://gdpatch/mod/snaptic_smsixtyfour/bobomb_battlefield.mp3");
	stream.loop = true;
	stream.loop_offset = 5.68;
	$AudioStreamPlayer.stream = stream
	$AudioStreamPlayer.play();
	for child in $Level/Scenery.get_children():
		var image = Image.load_from_file("res://gdpatch/mod/snaptic_smsixtyfour/tree.png")
		if image:
			var texture = ImageTexture.create_from_image(image)
			child.texture = texture
		else:
			print("Failed to get Image")
		
	platform_anim1.play("move")
	platform_anim2.play("move")
	# Calculate halfway point
	var anim_length = platform_anim2.get_animation("move").length
	platform_anim2.seek(anim_length * 0.5, true)
