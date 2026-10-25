extends Level

func _ready() -> void:
	var stream = AudioStreamMP3.load_from_file("res://gdpatch/mod/snaptic_smsixtyfour/bobomb_battlefield.mp3");
	stream.loop = true;
	stream.loop_offset = 5.68;
	$AudioStreamPlayer.stream = stream
	$AudioStreamPlayer.play();
