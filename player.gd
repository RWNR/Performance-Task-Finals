extends Area2D

@onready var speed = 10
@onready var bgm = $"../BGM"
@onready var enemy_hit = $"../EnemyHit"

func _ready():
	bgm.play()

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y +=  1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity.normalized() * delta
	
	position += velocity * speed


func _on_body_entered(body):
	hide()
	bgm.stop()
	enemy_hit.play()
