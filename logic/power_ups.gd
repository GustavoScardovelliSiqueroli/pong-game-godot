extends Control

func _ready():
	# Encontra o primeiro botão na árvore de nós
	var first_button = find_first_button()
	if first_button:
		first_button.grab_focus()  # Define o foco no botão encontrado
		var parent = first_button.get_parent()
		if parent.has_node("AnimatedSprite2D"):  # Verifica se existe um AnimatedSprite2D
			var sprite = parent.get_node("AnimatedSprite2D")
			sprite.play()  # Para a animação do AnimatedSprite2D
	# Conecta os sinais `focus_entered` e `focus_exited` de todos os botões
	connect_button_focus_signals(self)

func find_first_button() -> Button:
	# Procura o primeiro nó do tipo Button na hierarquia
	return find_child("Button")

func connect_button_focus_signals(node: Node):
	for child in node.get_children():
		if child is Button:
			# Conecta os sinais de foco
			child.focus_entered.connect(_on_button_focus_entered.bind(child))
			child.focus_exited.connect(_on_button_focus_exited.bind(child))
		else:
			connect_button_focus_signals(child)  # Repetir para nós filhos

func _on_button_focus_entered(button: Button):
	# Quando o botão recebe o foco, toca a animação
	var parent = button.get_parent()
	if parent.has_node("AnimatedSprite2D"):  # Verifica se existe um AnimatedSprite2D
		var sprite = parent.get_node("AnimatedSprite2D")
		sprite.play("new_animation")  # Substitua pelo nome da animação no AnimatedSprite2D

func _on_button_focus_exited(button: Button):
	# Quando o botão perde o foco, para a animação
	var parent = button.get_parent()
	if parent.has_node("AnimatedSprite2D"):  # Verifica se existe um AnimatedSprite2D
		var sprite = parent.get_node("AnimatedSprite2D")
		sprite.stop()  # Para a animação do AnimatedSprite2D
