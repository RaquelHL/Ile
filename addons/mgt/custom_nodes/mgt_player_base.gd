extends "mgt_platform_movement.gd"

signal state_changed(to)

# Finite State Machine variables
var _stack = []
var _states = {}
var _current_state = null
var _states_container
export(int) var _states_stack_limit = 10
export(String) var _inicial_state = "Idle"
export(String) var _states_container_name = "States"

# Powerups System variables
var _powerups = {}
var _active_powerups = [] setget , get_active_powerups
var _powerups_container = null
export(String) var _powerups_container_name = "Powerups"

func _ready():
	# check if there is a state container for a FSM
	_states_container = get_node(_states_container_name)
	if _states_container :
		# Register all the states into the states container
		for state in _states_container.get_children():
			register_state(state)
	
	_powerups_container = get_node(_powerups_container_name)
	if _powerups_container:
		for powerup in _powerups_container.get_children():
			register_powerup(powerup)
	
	add_to_group("can_trigger_access")

func _process(delta):
	for powerup_name in _active_powerups:
		_powerups[powerup_name].update(delta)
		
	if _current_state :
		_states[_current_state].update(delta)

func _physics_process(delta):
	for powerup_name in _active_powerups:
		_powerups[powerup_name].physics_update(delta)
		
	if _current_state :
		_states[_current_state].physics_update(delta)

func _input(event):
	for powerup_name in _active_powerups:
		_powerups[powerup_name].handle_input(event)
		
	if _current_state :
		_states[_current_state].handle_input(event)
	
# STATES RELATED FUNCTIONS

func register_state(state):
	_states[state.get_name()] = state
	state.FSM = self

func change_state(new_state):
	if _current_state:
		_states[_current_state].exit()
		push_state(_current_state)
		if _stack.size() > _states_stack_limit:
			_stack.remove(0)
	
	_current_state = new_state
	_states[_current_state].enter()
	
	emit_signal("state_changed", _current_state)

func get_state():
	return _current_state

func push_state(state):
	_stack.push_back(state)

func pop_state():
	
	if _states.size() == 0 : return
	
	if _current_state:
		_states[_current_state].exit()
	
	_current_state = _stack.pop_back()
	emit_signal("state_changed", _current_state)
	
	_states[_current_state].enter()

# POWERUPS RELATED FUNCTIONS

func register_powerup(powerup):
	_powerups[powerup.get_name()] = powerup
	powerup.FSM = self

func activate_powerup(powerup_name):
	if not _active_powerups.has(powerup_name):
		_active_powerups.append(powerup_name)

func deactivate_powerup(powerup_name):
	_active_powerups.erase(powerup_name)

func is_powerup_active(powerup_name):
	return _active_powerups.has(powerup_name)

func get_active_powerups():
	return _active_powerups
