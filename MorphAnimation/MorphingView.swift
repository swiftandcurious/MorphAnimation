//
//  MorphingView.swift
//  MorphAnimation
//
//  Created by swiftandcurious on 24/05/2026.
//

import SwiftUI

struct MorphingView<From: View, To: View>: View {
    
    var blurRadius: CGFloat
    var toggle: Bool
    
    @ViewBuilder var from: From
    @ViewBuilder var to: To
    
    var body: some View {
        ZStack {
            if !toggle {
                from
                    .contentTransition(.identity)
                    .transition(.opacity)
            } else {
                to
                    .contentTransition(.identity)
                    .transition(.opacity)
            }
        }
        .modifier(MorphingModifier(
            progress: toggle ? 1 : 0,
            blurRadius: blurRadius
        ))
    }
}

// Animatable Modifier to blur and gooey effect:
@Animatable
fileprivate struct MorphingModifier: ViewModifier {
    var progress: CGFloat
    @AnimatableIgnored var blurRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .compositingGroup()
            .blur(radius: blurRadius * blurProgress)
            .visualEffect { content, proxy in
                content
                    .layerEffect(
                        ShaderLibrary.alphaThreshold(),
                        maxSampleOffset: proxy.size
                    )
            }
    }
    
    private var blurProgress: CGFloat {
        return progress > 0.5 ? abs(1.0 - progress) : progress
    }
    
}


#Preview {
    ContentView()
}
