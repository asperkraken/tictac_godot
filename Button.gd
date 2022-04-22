extends Button


onready var x_icon = preload("res://x.png")
onready var o_icon = preload("res://o.png")
var stateMachine = ["EMPTY", "HAS_X", "HAS_O"]
var state = stateMachine[0]


func _ready():
	self.connect("pressed", self, "on_Button_pressed")


func on_Button_pressed():
	if state == stateMachine[0]:
		if Global.is_Turn_X == true:
			self.set_button_icon(x_icon)
			state = stateMachine[1]
			turnEnd()
		if Global.is_Turn_X == false:
			self.set_button_icon(o_icon)
			state = stateMachine[2]
			turnEnd()


func turnEnd():
	yield(self, "button_up")
	print("State is: " + state)
	var nextState = not Global.is_Turn_X
	Global.winCheck()
	Global.is_Turn_X = nextState
	Global.turnTotal += 1
