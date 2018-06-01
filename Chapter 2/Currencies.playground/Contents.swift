import Foundation

let formatter = NumberFormatter()

let identifiers =
    ["en-US", "en-GB", "de-DE", "ja-JP"]
let styles: [NumberFormatter.Style] =
    [.currency, .currencyAccounting, .currencyISOCode, .currencyPlural]

for style in styles {
    formatter.numberStyle = style
    for identifier in identifiers {
        formatter.locale = Locale(identifier: identifier)
        formatter.string(for: 1234.567)
    }
}
