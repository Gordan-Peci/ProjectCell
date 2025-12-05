extends CharacterBody3D

@export var speed: = 10
@export var gravity: = 15
var player:Node3D = null

func _ready():
	$DetectionArea.body_entered.connect(_on_body_entered)
	$DetectionArea.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_body_exited(body):
	if body == player:
		player = null

func _physics_process(delta):
	velocity.y -= gravity * delta

	if player != null:
		var direction = (player.global_transform.origin - global_transform.origin).normalized()
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = 0
		velocity.z = 0

	move_and_slide()

func _on_detection_area_body_entered(body: Node3D) -> void:
	pass # Replace with function body.


func _on_detection_area_body_exited(body: Node3D) -> void:
	pass # Replace with function body.
