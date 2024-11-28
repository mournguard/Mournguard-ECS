class_name ComponentInspectorPlugin extends EditorInspectorPlugin

const INSPECTOR_PROPERTY_CATEGORY = preload("res://addons/ECS/Editor/InspectorPropertyCategory.tscn")
const ENTITY_ICON = preload("res://addons/ECS/Entity/icon.png")
const COMPONENT_ICON = preload("res://addons/ECS/Component/icon.png")

func _can_handle(object): return object is Component

func _parse_end(object: Object) -> void:
	var p = object.get_parent()
	if not p or not p is Entity: return
	p = p as Entity

	var container = MarginContainer.new()
	container.add_theme_constant_override("margin_top", 4)
	container.add_theme_constant_override("margin_bottom", 4)

	var vbox = VBoxContainer.new()
	vbox.size_flags_vertical = Control.SIZE_EXPAND_FILL

	var header2 = INSPECTOR_PROPERTY_CATEGORY.instantiate()
	header2.icon = ENTITY_ICON
	header2.text = "Entity"
	vbox.add_child(header2)

	var btn = Button.new()
	btn.text = p.name
	btn.pressed.connect(func():EditorInterface.edit_node(p), CONNECT_DEFERRED)
	vbox.add_child(btn)

	vbox.add_child(HSeparator.new())

	container.add_child(vbox)
	add_custom_control(container)
