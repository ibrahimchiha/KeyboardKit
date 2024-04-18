//
//  KeyboardLocale+DictionaryTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-02-08.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import XCTest

class KeyboardLocale_DictionaryTests: XCTestCase {
    
    var typedDict: KeyboardLocale.Dictionary<String>!
    var stringDict: KeyboardLocale.Dictionary<String>!
    var intDict: KeyboardLocale.Dictionary<Int>!

    override func setUp() {
        typedDict = KeyboardLocale.Dictionary(
            [
                .english: "English",
                .german: "German",
                .italian: "Italian",
                .swedish: "Swedish"
            ]
        )

        stringDict = KeyboardLocale.Dictionary(
            [
                KeyboardLocale.english.id: "English",
                KeyboardLocale.german.id: "German",
                KeyboardLocale.italian.id: "Italian",
                KeyboardLocale.swedish.id: "Swedish"
            ]
        )

        intDict = KeyboardLocale.Dictionary(
            [
                KeyboardLocale.english.id: 1,
                KeyboardLocale.german.id: 2,
                KeyboardLocale.italian.id: 3,
                KeyboardLocale.swedish.id: 4
            ]
        )
    }

    func testKeyboardLocaleDictionaryCanBeCreatedWithAnyItemType() {
        XCTAssertEqual(typedDict.dictionary.keys.sorted(), ["de", "en", "it", "sv"])
        XCTAssertNotNil(typedDict)
        XCTAssertEqual(stringDict.dictionary.keys.sorted(), ["de", "en", "it", "sv"])
        XCTAssertNotNil(stringDict)
        XCTAssertNotNil(intDict)
    }

    func testKeyboardLocaleDictionaryCanResolveExistingValuesOnLocale() {
        let locale = KeyboardLocale.swedish.locale
        XCTAssertEqual(typedDict.value(for: locale), "Swedish")
        XCTAssertEqual(stringDict.value(for: locale), "Swedish")
        XCTAssertEqual(intDict.value(for: locale), 4)
    }

    func testKeyboardLocaleDictionaryCanResolveExistingValuesOnLocaleLanguageCode() {
        let locale = Locale(identifier: "sv-SE")
        XCTAssertEqual(typedDict.value(for: locale), "Swedish")
        XCTAssertEqual(stringDict.value(for: locale), "Swedish")
        XCTAssertEqual(intDict.value(for: locale), 4)
    }

    func testKeyboardLocaleDictionaryReturnsNilForNonExistingLocale() {
        let locale = Locale(identifier: "abc")
        XCTAssertNil(typedDict.value(for: locale))
        XCTAssertNil(stringDict.value(for: locale))
        XCTAssertNil(intDict.value(for: locale))
    }
    
    func testCanRegisterAdditionalValues() {
        let locale = KeyboardLocale.danish
        XCTAssertNil(intDict.value(for: locale))
        intDict.set(10, for: locale)
        XCTAssertEqual(intDict.value(for: locale), 10)
    }
}
