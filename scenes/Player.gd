extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -600
export (int) var GRAVITY = 1200

const UP = Vector2(0,-1)

var velocity = Vector2()
var can_double_jump = true
var can_dash = true
var dashing = false

var prev_key = "empty"
var dash_timestamp = 0.0
var dash_cd_timestamp = 0.0
var dashing_timestamp = 0.0

func get_input():
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_double_jump = true
	if !is_on_floor() and can_double_jump and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		can_double_jump = false
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed
		$Sprite.flip_h = false
	if Input.is_action_just_pressed("ui_right"):
		if prev_key == "right" and dash_timestamp >= 0 and can_dash:
			can_dash = false
			prev_key = "empty"
			dashing = true
			dashing_timestamp += 0.5
			dash_cd_timestamp += 1
		elif prev_key == "empty" or prev_key == "left":
			prev_key = "right"
			dash_timestamp += 0.7	
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed
		$Sprite.flip_h = true
	if Input.is_action_just_pressed("ui_left"):
		if prev_key == "left" and dash_timestamp >= 0 and can_dash:
			can_dash = false
			prev_key = "empty"
			dashing = true
			dashing_timestamp += 0.5
			dash_cd_timestamp += 1
		elif prev_key == "empty" or prev_key == "right":
			prev_key = "left"
			dash_timestamp += 0.7
		

func _physics_process(delta):
	dash_timestamp -= delta
	if dash_timestamp <= 0:
		prev_key = "empty"
	dash_cd_timestamp -= delta
	if dash_cd_timestamp <= 0:
		can_dash = true
	dashing_timestamp -= delta
	if dashing_timestamp <= 0:
		dashing = false
	velocity.y += delta * GRAVITY
	get_input()
	if dashing:
		velocity.x *= 10
	velocity = move_and_slide(velocity, UP)
