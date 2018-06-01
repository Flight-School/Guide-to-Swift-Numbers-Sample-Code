import Foundation

let formatter = NumberFormatter()
formatter.numberStyle = .scientific
formatter.string(for: 12345.6789)

formatter.locale = Locale(identifier: "en-US_POSIX")
formatter.string(for: 12345.6789)

formatter.locale = Locale(identifier: "fr")
formatter.string(for: 12345.6789)

formatter.locale = Locale(identifier: "el")
formatter.string(for: 12345.6789)

formatter.locale = Locale(identifier: "sv")
formatter.string(for: 12345.6789)

formatter.locale = Locale(identifier: "ar")
formatter.string(for: 12345.6789)

