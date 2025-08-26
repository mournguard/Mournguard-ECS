@tool
@icon("res://addons/Mournguard-ECS/Entity/icon.png")
class_name Entity extends TypeAccessor3D

const PASSTHROUGH_PROPERTIES = ["basis", "global_basis", "global_position", "global_rotation", "global_rotation_degrees", "global_transform", "position", "quaternion", "rotation", "rotation_degrees", "rotation_edit_mode", "rotation_order", "scale", "transform"]

signal transform_changed()

static var Id: int = 0
static var Instances: Dictionary = {}

static func ById(id: int) -> Entity: return Instances[id]

@export var display_name: String
@export var description: String
@export var portrait: Texture2D
@export var detailed_inspector: bool = false
@export var detailed_description: String

var unique_id: int

func _get(property: StringName) -> Variant:
	if PASSTHROUGH_PROPERTIES.has(property):
		if C(Body) and C(Body).get_collision_object():
			if C(Body).get_collision_object().get_property_list().find_custom(func(_v: Dictionary) -> bool: return _v.name == property):
				return C(Body).get_collision_object()[property]
	return null

func _set(property: StringName, value: Variant) -> bool:
	if PASSTHROUGH_PROPERTIES.has(property):
		if C(Body) and C(Body).get_collision_object():
			if C(Body).get_collision_object().get_property_list().find_custom(func(_v: Dictionary) -> bool: return _v.name == property):
				C(Body).get_collision_object()[property] = value
				return true
	return false

func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		if C(Body) and C(Body).get_collision_object():
			C(Body).get_collision_object().global_transform = global_transform
			transform_changed.emit()

func _init() -> void:
	unique_id = Id
	Instances[unique_id] = self
	Id += 1

func _ready() -> void:
	set_notify_transform(true)
	child_order_changed.connect(_on_child_order_changed)

func _on_child_order_changed() -> void:
	update_configuration_warnings()

func C(property: Variant) -> Component: return __(property)
