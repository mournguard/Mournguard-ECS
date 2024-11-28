@tool
class_name ECSPlugin extends EditorPlugin

const EntityInspectorPlugin = preload("res://addons/Mournguard-ECS/Entity/entity_inspector.gd")
var entity_inspector_plugin: EditorInspectorPlugin
const ComponentInspectorPlugin = preload("res://addons/Mournguard-ECS/Component/component_inspector.gd")
var component_inspector_plugin: EditorInspectorPlugin

func _enter_tree():
	_add_inspector_plugins()

func _exit_tree():
	_remove_inspector_plugins()

func _add_inspector_plugins():
	entity_inspector_plugin = EntityInspectorPlugin.new()
	add_inspector_plugin(entity_inspector_plugin)
	component_inspector_plugin = ComponentInspectorPlugin.new()
	add_inspector_plugin(component_inspector_plugin)

func _remove_inspector_plugins():
	remove_inspector_plugin(entity_inspector_plugin)
	remove_inspector_plugin(component_inspector_plugin)
