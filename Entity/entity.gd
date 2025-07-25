@tool
@icon("res://addons/Mournguard-ECS/Entity/icon.png")
class_name Entity extends TypeAccessor

static var Id: int = 0
static var Instances: Dictionary = {}

static func ById(id: int) -> Entity: return Instances[id]

@export var display_name: String
@export var description: String
@export var portrait: Texture2D
@export var detailed_inspector: bool = false
@export var detailed_description: String

var unique_id: int

var position: Vector3:
	get():
		if C(Body) and C(Body).get_collision_object():
			return C(Body).get_collision_object().position
		return Vector3.ZERO

var global_position: Vector3:
	get():
		if C(Body) and C(Body).get_collision_object():
			return C(Body).get_collision_object().global_position
		return Vector3.ZERO

var global_rotation: Vector3:
	get():
		if C(Body) and C(Body).get_collision_object():
			return C(Body).get_collision_object().global_rotation
		return Vector3.ZERO

func _init() -> void:
	unique_id = Id
	Instances[unique_id] = self
	Id += 1

func _ready() -> void:
	child_order_changed.connect(_on_child_order_changed)

func _on_child_order_changed() -> void:
	update_configuration_warnings()

func C(property: Variant) -> Component: return __(property)
