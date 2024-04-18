//
//  Autocomplete+Suggestion.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-09-12.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Autocomplete {
 
    /**
     This struct represents a suggestion that is returned by
     an ``AutocompleteProvider``.
     
     Autocomplete suggestions can be standard suggestions or
     autocorrecting ones that are automatically applies when
     a user taps space.
     
     Autocorrecting suggestions are typically presented with
     a white background, while ``isUnknown`` suggestions are
     wrapped in locale-specific quotation marks.
     */
    struct Suggestion {
        
        /// Create an autocomplete suggestion.
        ///
        /// - Parameters:
        ///   - text: The text that should be sent to the proxy.
        ///   - title: The text that should be displayed, by default `text`.
        ///   - isAutocorrect: Whether or the suggestion is autocorrecting, by default `false`.
        ///   - isUnknown: Whether or the suggestion is unknown, by default `false`.
        ///   - subtitle: An optional subtitle that can complete the title, by default `nil`.
        ///   - additionalInfo: An optional info dictionary, by default `empty`.
        public init(
            text: String,
            title: String? = nil,
            isAutocorrect: Bool = false,
            isUnknown: Bool = false,
            subtitle: String? = nil,
            additionalInfo: [String: Any] = [:]
        ) {
            self.text = text
            self.title = title ?? text
            self.isAutocorrect = isAutocorrect
            self.isUnknown = isUnknown
            self.subtitle = subtitle
            self.additionalInfo = additionalInfo
        }
        
        /// The text that should be sent to the proxy.
        public var text: String
        
        /// The text that should be displayed.
        public var title: String
        
        /// Whether or the suggestion is autocorrecting.
        public var isAutocorrect: Bool
        
        /// Whether or the suggestion is unknown.
        public var isUnknown: Bool
        
        /// An optional subtitle that can complete the title.
        public var subtitle: String?
        
        /// An optional info dictionary.
        public var additionalInfo: [String: Any]
    }
}
