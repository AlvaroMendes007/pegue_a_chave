extends KinematicBody2D

export var vel = 200 #velocidade
var key = false
var perto_chave = false
var porta = false
onready var chave = get_parent().get_node("chave")
onready var node_porta = $"../porta"

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

func _input(event):
	if key and perto_chave and Input.is_key_pressed(KEY_X):
		chave.queue_free()
		perto_chave = false
		
	if porta and key and Input.is_key_pressed(KEY_X):
		node_porta.queue_free()

func _on_area_body_entered(body):
	if body.name == "chave":
		perto_chave = true
		key = true
		
	if body.name == "porta":
		porta = true
	


func _on_area_body_exited(body):
	if body.name == "porta":
		porta = false
	
	if body.name == "key":
		key = false
