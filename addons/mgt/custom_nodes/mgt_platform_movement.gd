extends KinematicBody2D

signal direction_changed(to)

# Movement settings
export(float) var acceleration = 3000
export(float) var deceleration = 3000
export(float) var current_maximum_speed = 500
export(float) var gravity = 2000
export(float) var maximum_fall_speed = 600
export(float) var jump_speed = -650
export(float) var jump_height_factor = 2
export(Vector2) var floor_normal = Vector2(0, -1)
export(float) var slope_stop_min_velocity = 5
export(int) var max_bounces = 4
export(float) var floor_max_angle = 0.785398 

# Processing variables
var jump_pressed = false
var jump_just_pressed = false
var input_direction = Vector2()
var last_movement_direction = 1
var current_speed = Vector2()
var _target_speed = 0.0
var movement_remainder = Vector2()
var _lastmovement_remainder = Vector2()

func calculate_speed(delta):
	var variation
	var difference
	var weight
	
	# Horizontal speed
	if current_speed.x and last_movement_direction != sign(current_speed.x):
		last_movement_direction = sign(current_speed.x)
		emit_signal("direction_changed", input_direction.x)
	
	_target_speed = current_maximum_speed * input_direction.x
	
	# current_speed calculation
	variation = deceleration * delta if input_direction.x == 0 or sign(input_direction.x) != sign(current_speed.x) else acceleration * delta
	
	difference = abs(_target_speed - current_speed.x)
	weight = variation / difference if difference > 0 and variation < difference else 1
	
	current_speed.x = lerp(current_speed.x, _target_speed, weight)
	
	# Vertical speed
	variation = gravity * delta
	if not jump_pressed and current_speed.y < 0 and not is_on_floor():
		variation = variation * jump_height_factor
	
	difference = abs(maximum_fall_speed - current_speed.y)
	weight = variation / difference if difference > 0 and variation < difference else 1
	
	current_speed.y = lerp(current_speed.y, maximum_fall_speed, weight)
	
	if can_jump() and jump_just_pressed:
		jump()
	
	# Reset input direction for next frame
	input_direction = Vector2()

func move():
	# Some ramp movement hacks and tweaks
	movement_remainder = move_and_slide(current_speed, floor_normal, slope_stop_min_velocity, max_bounces, floor_max_angle)
	_lastmovement_remainder = movement_remainder if movement_remainder else _lastmovement_remainder
	
	if is_on_floor():
		var speed_along_floor = abs(current_speed.x)
		current_speed.y = speed_along_floor * movement_remainder.normalized().y
		current_speed.x = speed_along_floor * movement_remainder.normalized().x
	
	if is_on_ceiling():
		current_speed.y = movement_remainder.y
	
	if is_on_wall():
		current_speed.x = movement_remainder.x

func get_input_direction():
	return input_direction

func update_position(delta):
	calculate_speed(delta)
	move()

func can_jump():
	return is_on_floor()

func jump():
	current_speed.y = jump_speed
