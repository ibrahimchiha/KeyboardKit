//
//  CalloutContext.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-01-24.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

/**
 This observable context can be used to handle callout state
 for a keyboard.

 The class wraps contexts for both action and input callouts,
 so that we only have to pass around a single instance.

 KeyboardKit automatically creates an instance of this class
 and binds the created instance to the keyboard controller's
 ``KeyboardInputViewController/calloutContext``.
 */
public class KeyboardCalloutContext: ObservableObject {

    /**
     Create a new callout context instance,

     - Parameters:
       - action: The action callout context to use.
       - input: The input callout context to use.
     */
    public init(
        action: ActionContext,
        input: InputContext
    ) {
        self.action = action
        self.input = input
    }

    /**
     The action context that is bound to the context.
     */
    public var action: ActionContext

    /**
     The input context that is bound to the context.
     */
    public var input: InputContext
}

public extension KeyboardCalloutContext {

    /**
     This disabled context can be used to disable callouts.
     */
    static var disabled: KeyboardCalloutContext {
        KeyboardCalloutContext(
            action: .disabled,
            input: .disabled
        )
    }
}
