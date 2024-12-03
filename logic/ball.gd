extends Area2D

const DEFAULT_SPEED = 150

var _speed = DEFAULT_SPEED
var direction = Vector2(0,0)
@onready var _initial_pos = position
@onready var song_impact_walls = $SongImpactWalls

func _ready() -> void:
	reset()

func _process(delta):
	# delta e em torno de 0.016;
	
	# direction comeca com (-1,0);
	
	# direction e definida com -1 ou 1 para x e um valor aleatorio
	# entre 1 e -1, depois disso realiza a funcao normilized
	# que mantera a distancia entre x e y em 1. isso acontece
	# pq se o x fosse fixo, o valor aleatorio do y iria impactar
	# na velocidade da bola;
	
	_speed += delta * 4 # delta * 2
	# speed comeca com 100 e e somada com um restinho do delta vezes 2
	# para ir aumentando aos poucos (ela poderia ser multiplicado po 0.3
	# que daria na mesma;
	
	# direction multiplicada com speed e multiplicada
	# novamnete por delta para diminuir o speed e 
	# nao somar muitas casas na position;
	position += _speed * delta * direction

func reset():
	position = _initial_pos
	direction = Vector2(0,0)
	$Timer.start()
	
func _on_timer_timeout() -> void:
	direction = randomize_direction()
	_speed = DEFAULT_SPEED

func randomize_direction() -> Vector2:
	if randi() % 2 == 0:
		return Vector2.LEFT 
	else:
		return Vector2.RIGHT 

func start_song_impact_walls() -> void:
	song_impact_walls.play()
