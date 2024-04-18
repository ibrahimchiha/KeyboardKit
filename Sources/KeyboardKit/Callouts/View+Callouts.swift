//
//  View+Callouts.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Setup the view as an keyboard callout container.
    ///
    /// - Parameters:
    ///   - calloutContext: The callout context to use.
    ///   - keyboardContext: The keyboard context to use.
    func keyboardCalloutContainer(
        calloutContext: CalloutContext,
        keyboardContext: KeyboardContext
    ) -> some View {
        self.keyboardActionCalloutContainer(
                calloutContext: calloutContext.actionContext,
                keyboardContext: keyboardContext
            )
            .keyboardInputCalloutContainer(
                calloutContext: calloutContext.inputContext,
                keyboardContext: keyboardContext
            )
    }
    
    @available(*, deprecated, message: "Apply style with .actionCalloutStyle and  .inputCalloutStyle instead.")
    func keyboardCalloutContainer(
        calloutContext: CalloutContext,
        keyboardContext: KeyboardContext,
        actionCalloutStyle: Callouts.ActionCalloutStyle = .standard,
        inputCalloutStyle: Callouts.InputCalloutStyle = .standard
    ) -> some View {
        self.keyboardActionCalloutContainer(
                calloutContext: calloutContext.actionContext,
                keyboardContext: keyboardContext,
                style: actionCalloutStyle
            )
            .keyboardInputCalloutContainer(
                calloutContext: calloutContext.inputContext,
                keyboardContext: keyboardContext,
                style: inputCalloutStyle
            )
    }

    /// Setup the view as an action callout container.
    ///
    /// - Parameters:
    ///   - calloutContext: The callout context to use.
    ///   - keyboardContext: The keyboard context to use.
    func keyboardActionCalloutContainer(
        calloutContext: CalloutContext.ActionContext,
        keyboardContext: KeyboardContext
    ) -> some View {
        self.overlay(
            Callouts.ActionCallout(
                calloutContext: calloutContext,
                keyboardContext: keyboardContext
            )
        )
        .coordinateSpace(name: calloutContext.coordinateSpace)
    }
    
    @available(*, deprecated, message: "Apply a style with .actionCalloutStyle instead.")
    func keyboardActionCalloutContainer(
        calloutContext: CalloutContext.ActionContext,
        keyboardContext: KeyboardContext,
        style: Callouts.ActionCalloutStyle = .standard
    ) -> some View {
        self.overlay(
            Callouts.ActionCallout(
                calloutContext: calloutContext,
                keyboardContext: keyboardContext,
                style: style
            )
        )
        .coordinateSpace(name: calloutContext.coordinateSpace)
    }

    /// Apply a keyboard callout shadow to the view.
    ///
    /// - Parameters:
    ///   - style: The style apply, by default `.standard`.
    func keyboardCalloutShadow(
        style: Callouts.CalloutStyle = .standard
    ) -> some View {
        self.shadow(color: style.borderColor, radius: 0.4)
            .shadow(color: style.shadowColor, radius: style.shadowRadius)
    }
    
    /// Setup the view as an input callout container.
    ///
    /// - Parameters:
    ///   - calloutContext: The callout context to use.
    ///   - keyboardContext: The keyboard context to use.
    func keyboardInputCalloutContainer(
        calloutContext: CalloutContext.InputContext,
        keyboardContext: KeyboardContext
    ) -> some View {
        self.overlay(
            Callouts.InputCallout(
                calloutContext: calloutContext,
                keyboardContext: keyboardContext
            )
        )
        .coordinateSpace(name: calloutContext.coordinateSpace)
    }
    
    @available(*, deprecated, message: "Apply a style with .inputCalloutStyle instead.")
    func keyboardInputCalloutContainer(
        calloutContext: CalloutContext.InputContext,
        keyboardContext: KeyboardContext,
        style: Callouts.InputCalloutStyle = .standard
    ) -> some View {
        self.overlay(
            Callouts.InputCallout(
                calloutContext: calloutContext,
                keyboardContext: keyboardContext,
                style: style
            )
        )
        .coordinateSpace(name: calloutContext.coordinateSpace)
    }
}
