@tool
@icon("res://addons/Mournguard-ECS/Entity/icon.png")
class_name Entity extends TypeAccessor

func _ready() -> void:
	child_order_changed.connect(_on_child_order_changed)

func _on_child_order_changed():
	update_configuration_warnings()

func C(property: Variant) -> Component: return __(property)
