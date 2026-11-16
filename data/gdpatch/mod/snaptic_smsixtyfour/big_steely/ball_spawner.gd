extends Node3D

const BALL = preload("res://gdpatch/mod/snaptic_smsixtyfour/big_steely/ball.tscn")

@onready var spawner1_timer = $Spawner1/Timer
var spawner1_count = 0;

@onready var spawner2_timer = $Spawner2/Timer
var spawner2_count = 0;

func _ready() -> void:
	spawner1_timer.timeout.connect(_on_timer1_timeout)
	spawner1_timer.start()
	spawner2_timer.timeout.connect(_on_timer2_timeout)
	spawner2_timer.start()
	
	$base_ball1/Node3D/AnimationPlayer.play("base_ball")
	$base_ball2/Node3D/AnimationPlayer.play("base_ball")
	
	var anim_length = $base_ball2/Node3D/AnimationPlayer.get_animation("base_ball").length
	$base_ball2/Node3D/AnimationPlayer.seek(anim_length * 0.25, true)

func _on_timer1_timeout() -> void:
	var new_ball : Node3D = BALL.instantiate()
	$Spawner1.add_child(new_ball)
	new_ball.position = Vector3(0, 0, 0)
	
	var ball_anim : AnimationPlayer = new_ball.find_child("AnimationPlayer", true, false)
	ball_anim.play("mountain_ball1")
	ball_anim.animation_finished.connect(_ball1_finish)
	
	spawner1_count += 1
	print_debug("mountain_spawner1: Spawned Ball. Balls Left: ",  3 - spawner1_count)
	if spawner1_count < 3:
		spawner1_timer.start(3.33)

func _on_timer2_timeout() -> void:
	var new_ball : Node3D = BALL.instantiate()
	$Spawner2.add_child(new_ball)
	new_ball.position = Vector3(0, 0, 0)
	
	var ball_anim : AnimationPlayer = new_ball.find_child("AnimationPlayer", true, false)
	ball_anim.play("mountain_ball2")
	ball_anim.animation_finished.connect(_ball2_finish)
	
	spawner2_count += 1
	print_debug("mountain_spawner2: Spawned Ball. Balls Left: ",  3 - spawner2_count)
	if spawner2_count < 3:
		spawner2_timer.start(3.33)

func _ball1_finish(anim_name : String) -> void:
	spawner1_count -= 1
	print_debug("mountain_spawner1: Spawner 1 Count is now ", spawner1_count)
	if spawner1_timer.is_stopped():
		print_debug("mountain_spawner1: Restarting Timer 1")
		spawner1_timer.start(3.33)

func _ball2_finish(anim_name : String) -> void:
	spawner2_count -= 1
	print_debug("mountain_spawner2: Spawner 2 Count is now ", spawner2_count)
	if spawner2_timer.is_stopped():
		print("mountain_spawner2: Restarting Timer 2")
		spawner2_timer.start(3.33)
