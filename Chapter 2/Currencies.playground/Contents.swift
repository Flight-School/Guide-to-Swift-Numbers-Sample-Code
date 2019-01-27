import Foundation

let formatter = NumberFormatter()

let 🇺🇸 = Locale(identifier: "en-US")
let 🇬🇧 = Locale(identifier: "en-GB")
let 🇩🇪 = Locale(identifier: "de-DE")
let 🇯🇵 = Locale(identifier: "ja-JP")

let styles: [NumberFormatter.Style] =
    [.currency, .currencyAccounting, .currencyISOCode, .currencyPlural]

for style in styles {
    formatter.numberStyle = style
    for locale in [🇺🇸, 🇬🇧, 🇩🇪, 🇯🇵] {
        formatter.locale = locale
        let string = formatter.string(for: 1234.567)
        
        print(Locale.current.localizedString(forIdentifier: locale.identifier)!,
              terminator: ": ")
        print(string!)
    }
    
    print()
}
