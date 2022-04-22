extends CanvasLayer


var is_Turn_X = true
var turnTotal = 0
onready var myButtons = get_tree().get_nodes_in_group('all_buttons')


func _ready():
	startGame()


func _process(delta):
	if turnTotal == 9:
		endGame()


func winCheck():
	rowCheck()
	columnCheck()
	acrossCheck()



func rowCheck():
	var row1 = get_tree().get_nodes_in_group('row_1')
	var row2 = get_tree().get_nodes_in_group('row_2')
	var row3 = get_tree().get_nodes_in_group('row_3')
	var rows = [row1, row2, row3]
	for row in rows:
		sumXO(row)


func columnCheck():
	var col1 = get_tree().get_nodes_in_group('column_1')
	var col2 = get_tree().get_nodes_in_group('column_2')
	var col3 = get_tree().get_nodes_in_group('column_3')
	var cols = [col1, col2, col3]
	for col in cols:
		sumXO(col)


func acrossCheck():
	var acr1 = get_tree().get_nodes_in_group('across_1')
	var acr2 = get_tree().get_nodes_in_group('across_2')
	var acrs = [acr1, acr2]
	for acr in acrs:
		sumXO(acr)


func sumXO(target):
	var x = "HAS_X"
	var o = "HAS_O"
	var x_ct = []
	var o_ct = []
	var goal = target.size()/2
	var active = true
	
	for i in target:
		if i.state == x:
			x_ct.append(i)
			print("x score: ")
			print(x_ct)
		elif i.state == o:
			o_ct.append(i)
			print("o_score: ")
			print(o_ct)

	if active:
		if x_ct.size() == goal:
			print("x wins!")
			endGame()
		if o_ct.size() == goal:
			print("o wins!")
			endGame()
		else:	
			active = false



func startGame():
	for button in myButtons:
		button.set_button_icon(null)
	is_Turn_X = true
	print("Game start!")


func endGame():
	print("Game over.")
	get_tree().paused = true
