@tool
@icon("res://addons/Mournguard-ECS/Entity/icon.png")
class_name Entity extends Node3D

func _ready() -> void:
	child_entered_tree.connect(_on_child_entered_tree)

func _on_child_entered_tree(child: Node) -> void:
	if (child is Component): set_editable_instance(child, true)
	update_configuration_warnings()

func C(property: Variant) -> Component: return get_first_child_of_type(property)

func get_first_child_of_type(property: Variant) -> Component:
	for c in get_children():
		if is_instance_of(c, property):
			return c
	return null
