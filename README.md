
# MorphAnimation

A SwiftUI example demonstrating how to create a smooth morphing transition between SF Symbols using blur effects, custom Metal shaders, and SwiftUI's animation system.

![[MorphingAnimation.gif]]

## Overview

This project showcases a reusable `MorphingView` that creates a gooey morphing animation between SF Symbols.

The effect is achieved by combining:

- SwiftUI animations
- A custom `ViewModifier`
- Blur effects
- A Metal shader
- Alpha thresholding

Together, these techniques create the illusion that one symbol melts into another before reforming as the next symbol.

## Features

- Smooth morphing transitions between SF Symbols
- Reusable generic `MorphingView`
- Custom animatable modifier
- Metal shader integration with SwiftUI
- Beginner-friendly project structure
- Easy to customize with your own symbols

## How It Works

### 1. Two Symbol States

The app maintains two symbol names:

```swift
currentSymbolImage
nextSymbolImage
```

When a new symbol is selected, the hidden symbol is updated first, then a toggle triggers the animation.

### 2. Animatable Modifier

The custom `MorphingModifier` animates a `progress` value from `0` to `1`.

As the animation progresses:

- Blur increases
- Blur reaches its maximum halfway through
- Blur decreases again

This creates the "melting" effect.

### 3. Metal Shader

The custom Metal shader applies an alpha threshold effect.

Pixels with sufficient opacity are kept and made fully opaque, while weaker pixels are removed.

This transforms the blurred symbol into a blob-like shape and creates the characteristic gooey transition.

## Project Structure

```text
MorphAnimation
│
├── ContentView.swift
├── SystemImageView.swift
├── MorphingView.swift
└── AlphaThreshold.metal
```

### ContentView.swift

Application entry point.

### SystemImageView.swift

Displays the current symbol and provides a grid of selectable SF Symbols.

### MorphingView.swift

Contains:

- Generic `MorphingView`
- Custom `MorphingModifier`
- Animation logic

### AlphaThreshold.metal

Contains the Metal shader used to create the gooey morphing effect.

## Understanding the Shader

The shader performs a simple alpha threshold operation:

```metal
return color.a >= thresholdValue
    ? half4(color.rgb / color.a, 1.0)
    : half4(0.0);
```

In simple terms:

- Strong pixels survive
- Weak pixels disappear
- Remaining pixels become fully opaque

This turns a soft blur into a solid blob shape.

## Requirements

- Xcode 26 or later
- iOS 26 or later
- Swift 6

## Learning Goals

This project demonstrates:

- SwiftUI animations
- Generic views
- Custom view modifiers
- The `@Animatable` attribute
- Metal shaders in SwiftUI
- `layerEffect`
- SF Symbols
- Reusable animation components

## Credits

This project was inspired by a tutorial from [Kavsoft](https://www.youtube.com/@Kavsoft)  and expanded with additional explanations and documentation for learning purposes.


---

Happy coding!

**Stay hungry. Stay foolish.**

— _Steve Jobs_

## 👩‍💻 About the Creator

This project is part of the [swiftandcurious](https://swiftandcurious.com) initiative — inspiring and empowering self-taught developers to explore Swift, step by step.

Created by [Karina Schreiber](https://swiftandcurious.com), a hobby app developer and curious mind.

Follow along on [X/Twitter](https://twitter.com/swiftandcurious) for more SwiftUI tutorials and code-alongs!