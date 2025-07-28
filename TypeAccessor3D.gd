@tool
class_name TypeAccessor3D extends Node3D

func __(property: Variant) -> Node: return NodeTools.GetFirstChildOfType(self, property)
