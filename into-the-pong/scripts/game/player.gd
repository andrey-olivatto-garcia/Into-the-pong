extends StaticBody2D

var win_height : int
var p_height : int

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y

func _process(delta):
	# pega a posição Y do mouse dentro da viewport
	var mouse_y = get_viewport().get_mouse_position().y

	# interpola suavemente até a posição do mouse (parece mais natural)
	position.y = lerp(position.y, mouse_y, 10 * delta)

	# trava dentro da tela
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
