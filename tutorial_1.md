A scene is the place where something happens or a view of something. 
A scene is a container for anything. A valid scene requires a root node.
Nodes are the building blocks used to make things in scenes. 
SCENE -> ROOT_NODE (2D, 3D, etc.)-> NODES 


Quick Comparison Table

Node Type	Purpose	Has Position/Transform?	Renders?	Best For
Node	Logic, managers, grouping	❌ No	❌ No	Game controllers, logic scripts
Node2D	2D gameplay elements	✅ Yes	✅ Yes	Sprites, tilemaps, buildings
Node3D	3D gameplay elements	✅ Yes (3D)	✅ Yes	Meshes, 3D environments
Control	UI elements	✅ Yes (UI layout)	✅ Yes	Menus, HUDs, overlays

All children nodes are positioned relative to their parent. 
In radians, a full rotation is 2PI, or TAU. TAU divided by 60 is 1 second. 

KEYWORDS: 
	func, to declare a function
	^"", to send to a node path, rather than an arbitrary string
	$SecondArm = get_node(^"SecondArm"), this is a shorthand

FUNCTIONS: 
	_ready() is called once the node is ready, good to initialize variables and such
	_process(delta) is called every frame (or every delta), as long as the node is in the scene

CONCEPTS:
	Godot updates as quickly as the system will allow it. The _process() function is called MAX FPS times per second. 
	
