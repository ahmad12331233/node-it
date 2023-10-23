extends Line2D

func _process(_delta):
	position = $"../worldOrigin".position

const GRID_STEP = 30
const GRID_SIZE = 400

func _draw():
	antialiased = true
	for i in range(GRID_SIZE):
		var col = Color.BLACK
		var _width = 2
		if i % 10 == 0 :
			col = Color.BLACK
			_width = 6
		var start = Vector2(i * GRID_STEP, 0)  - Vector2(GRID_SIZE * GRID_STEP / 2.0, GRID_SIZE * GRID_STEP / 2.0)
		var end   = Vector2(i * GRID_STEP, GRID_SIZE * GRID_STEP)  - Vector2(GRID_SIZE * GRID_STEP / 2.0, GRID_SIZE * GRID_STEP / 2.0)
		draw_line(start, end, col, _width)
	
	for j in range(GRID_SIZE):
		var col = Color.BLACK
		var _width = 2
		if j % 10 == 0 :
			col = Color.BLACK
			_width = 6
		var start = Vector2(0, j * GRID_STEP) - Vector2(GRID_SIZE * GRID_STEP / 2.0, GRID_SIZE * GRID_STEP / 2.0)
		var end = Vector2(GRID_SIZE * GRID_STEP, j * GRID_STEP) - Vector2(GRID_SIZE * GRID_STEP / 2.0, GRID_SIZE * GRID_STEP / 2.0)
		draw_line(start, end, col, _width)
	
	if !Events.showXY: return
	
	for i in range(GRID_SIZE):
		if i == GRID_SIZE / 2.0:
			var col = Color.GREEN
			var _width = 10
			var start = Vector2(i * GRID_STEP, 0) - Vector2(GRID_SIZE * GRID_STEP / 2.0, GRID_SIZE * GRID_STEP / 2.0)
			var end   = Vector2(i * GRID_STEP, GRID_SIZE * GRID_STEP) - Vector2(GRID_SIZE * GRID_STEP / 2.0, GRID_SIZE * GRID_STEP / 2.0)
			draw_line(start, end, col, _width)
	
	for j in range(GRID_SIZE):
		if j == GRID_SIZE / 2.0:
			var col = Color.RED
			var _width = 10
			var start = Vector2(0, j * GRID_STEP) - Vector2(GRID_SIZE * GRID_STEP / 2.0, GRID_SIZE * GRID_STEP / 2.0)
			var end = Vector2(GRID_SIZE * GRID_STEP, j * GRID_STEP) - Vector2(GRID_SIZE * GRID_STEP / 2.0, GRID_SIZE * GRID_STEP / 2.0)
			draw_line(start, end, col, _width)
