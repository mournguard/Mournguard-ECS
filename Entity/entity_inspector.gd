class_name EntityInspectorPlugin extends EditorInspectorPlugin

const INSPECTOR_PROPERTY_CATEGORY = preload("res://addons/ECS/Editor/InspectorPropertyCategory.tscn")
const ENTITY_ICON = preload("res://addons/ECS/Entity/icon.png")
const COMPONENT_ICON = preload("res://addons/ECS/Component/icon.png")

func _can_handle(object): return object is Entity

func _has_components(object) -> bool:
	var has_components = false
	for c in object.get_children():
		if c is Component:
			has_components = true
			break
	return has_components

func _parse_end(object: Object) -> void:
	if not _has_components(object): return

	var container = MarginContainer.new()
	container.add_theme_constant_override("margin_top", 4)
	container.add_theme_constant_override("margin_bottom", 4)

	var vbox = VBoxContainer.new()
	vbox.size_flags_vertical = Control.SIZE_EXPAND_FILL

	var header2 = INSPECTOR_PROPERTY_CATEGORY.instantiate()
	header2.icon = COMPONENT_ICON
	header2.text = "Components"
	vbox.add_child(header2)

	for c in object.get_children():
		if c is Component:
			var btn = Button.new()
			btn.text = c.name
			btn.pressed.connect(func():EditorInterface.edit_node(c), CONNECT_DEFERRED)
			vbox.add_child(btn)

	vbox.add_child(HSeparator.new())

	container.add_child(vbox)
	add_custom_control(container)
