# Godot – Core Concepts (1–6)

This document summarizes the fundamental concepts Godot is built on.
Understanding these removes most beginner friction and clarifies how to structure games correctly.

---

## 1. Nodes – Everything Is a Node

A **Node** is the smallest building block in Godot.

- Each node does **one specific job**
- Nodes are lightweight and composable

Examples:
- `Sprite2D` → draws an image
- `Area2D` → detects input / overlaps
- `Control` → UI elements
- `AudioStreamPlayer` → sound playback

You do **not** create large all-in-one classes.  
You compose behavior by combining nodes.

> Think **LEGO bricks**, not inheritance hierarchies.

---

## 2. Scene Tree – Nodes Form a Hierarchy

Nodes are organized in a **tree structure** called the *Scene Tree*.

Key properties:
- Parents affect children (position, scale, visibility)
- Hiding a parent hides all children
- Transforms propagate downward

Example:

````md
Area2D
|- Sprite2D
|- CollisionPolygon2D
````


This hierarchy is the backbone of all Godot projects.

---

## 3. Scenes – Reusable Node Trees

A **Scene** is simply a saved node tree.

Scenes act as:
- Prefabs
- Templates
- Reusable components

Examples:
- `Room.tscn`
- `Hotspot.tscn`
- `DetailOverlay.tscn`

Scenes can be instanced inside other scenes, infinitely.

> Godot projects are built by instancing scenes into scenes.

---

## 4. Composition Over Inheritance

Godot strongly favors **composition** instead of deep inheritance.

❌ One giant base class  
✅ Many small nodes, each responsible for one thing

Example:
- Interaction → `Area2D`
- Visuals → `Sprite2D`
- Collision → `CollisionPolygon2D`
- UI → `Control`

This keeps systems modular, debuggable, and flexible.

---

## 5. Two Worlds: Game World vs UI

Godot has **two parallel systems** that must not be mixed casually.

### Game World (2D / 3D)
- Nodes: `Node2D`, `Sprite2D`, `Area2D`
- Uses transforms (position, rotation, scale)
- Used for gameplay and interaction

### UI System
- Nodes: `Control`, `PanelContainer`, `TextureRect`
- Uses anchors and containers
- Used for HUDs, overlays, menus

They are bridged using **CanvasLayer**.

> Rule: **World ≠ UI**

---

## 6. Signals – Decoupled Communication

**Signals** are Godot’s primary communication mechanism.

Instead of tightly coupling objects:
```gdscript
object.do_something()
```
You emit signals:
```gdscript
signal activated
activated.emit()
```
Other nodes connect and react independently.

Common signals:
- pressed
- input_event
- mouse_entered
- Custom gameplay signals
- Benefits:
- Loose coupling
- Cleaner architecture
- Easier reuse and testing
