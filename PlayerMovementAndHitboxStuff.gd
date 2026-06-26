extends CollisionShape2D

var PlayerNode = get_parent()
var speed = 1000.0

func move(dt,DirectionVector: Vector2):
	PlayerNode.position += DirectionVector * dt * speed
	
func handle_input():
	var DirectionVector = Vector2(0.0,0.0)
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		DirectionVector.x += 1
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		DirectionVector.x -= 1
		
	if Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_W):
		DirectionVector.y -= 1
	if Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_S):
		DirectionVector.y += 1
		
	return DirectionVector

func _ready():
	PlayerNode = get_parent()
	print("PN",PlayerNode)

func _process(delta):
	var DirectionVector = handle_input()
	move(delta,DirectionVector)
