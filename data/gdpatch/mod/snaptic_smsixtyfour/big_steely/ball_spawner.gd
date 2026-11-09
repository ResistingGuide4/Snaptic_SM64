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


func _on_timer1_timeout() -> void:
	var new_ball : Node3D = BALL.instantiate()
	$Spawner1.add_child(new_ball)
	new_ball.position = Vector3(0, 0, 0)
	
	var ball_anim : AnimationPlayer = new_ball.find_child("AnimationPlayer", true, false)
	ball_anim.play("ball1_move")
	ball_anim.animation_finished.connect(_ball1_finish)
	
	spawner1_count += 1
	print("Spawned Ball. Balls Left: ",  3 - spawner1_count)
	if spawner1_count < 3:
		spawner1_timer.start(3.33)

func _on_timer2_timeout() -> void:
	pass

func _ball1_finish(anim_name : String) -> void:
	spawner1_count -= 1
	print("Spawner 1 Count is now ", spawner1_count)
	if spawner1_timer.is_stopped():
		print("Restarting Timer")
		spawner1_timer.start(3.33)
