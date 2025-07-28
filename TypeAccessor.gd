@tool
class_name TypeAccessor extends Node

func __(property: Variant) -> Node: return NodeTools.GetFirstChildOfType(self, property)
