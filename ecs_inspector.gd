class_name ECSInspectorPlugin extends EditorInspectorPlugin

const INSPECTOR_PROPERTY_CATEGORY = preload("res://addons/Mournguard-EditorTools/InspectorPropertyCategory/InspectorPropertyCategory.tscn")
const ENTITY_ICON = preload("res://addons/Mournguard-ECS/Entity/icon.png")
const COMPONENT_ICON = preload("res://addons/Mournguard-ECS/Component/icon.png")

func _render_inspector(_name: String, _icon: Texture2D, content: Control) -> Control:
	var container := MarginContainer.new()
	container.add_theme_constant_override("margin_top", 4)
	container.add_theme_constant_override("margin_bottom", 4)

	var vbox := VBoxContainer.new()
	vbox.size_flags_vertical = Control.SIZE_EXPAND_FILL

	var container2 := INSPECTOR_PROPERTY_CATEGORY.instantiate()
	container2.icon = _icon
	container2.text = _name

	vbox.add_child(container2)
	container2.add_content(content)

	vbox.add_child(HSeparator.new())

	container.add_child(vbox)

	return container
