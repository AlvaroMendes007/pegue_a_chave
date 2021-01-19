extends KinematicBody2D

export var vel = 200 #velocidade

func _ready():
	pass
	
func _process(delta):
	var dir = Vector2(0,0)
	if Input.is_action_pressed("up"):
		dir.y = -1
	if Input.is_action_pressed("down"):
		dir.y = 1
	if Input.is_action_pressed("left"):
		dir.x = -1	
	if Input.is_action_pressed("right"):
		dir.x = 1
	
	move_and_slide(dir * vel)
