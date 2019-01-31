<a href="https://flight.school/books/codable">
    <img src="cover.jpg" alt="Flight School Guide to Swift Codable Cover" title="Flight School Guide to Swift Codable" width="216" height="332" align="right">
</a>

# Flight School Guide to Swift Numbers Sample Code

[![Build Status][build status badge]][build status]
[![License][license badge]][license]
[![Swift Version][swift version badge]][swift version]

This repository contains sample code used in the
[Flight School Guide to Swift Numbers](https://flight.school/books/numbers).

---

### Chapter 1

Chapter 1 is a conceptual deep-dive into
how numbers work on computers in general
and in Swift specifically.

#### Floating Point Approximates

You know how floating-point arithmetic
sometimes produces unexpected results,
like `0.1 + 0.2 != 0.3`?
(If not, go ahead and read the
[first chapter for free](http://bit.ly/swift-numbers-sample)!)

This sample code implements an "approximately equals" operator (`==~`)
for floating-point number types.

```swift
0.1 + 0.2 == 0.3 // false
0.1 + 0.2 ==~ 0.3 // true

(0.1 + 0.2).isApproximatelyEqual(to: 0.3, within: .ulpOfOne) // true
```

#### Floating Point Environment

Normally, you can't tell the difference between `nan` and `signalingNaN`.
That's because Swift doesn't expose the floating-point environment
in its standard library.

We can still access it from `Darwin`, though.
And that's what this playground demonstrates:

```swift
do {
    try detectingFloatingPointErrors(flags: .invalid) {
        Double.signalingNaN + 1
    }
} catch {
    print("Error: \(error)")
}
```

### Chapter 2

Chapter 2 is all about number formatting.
The sample code in this chapter offers a comprehensive survey
of the various formatting styles of `NumberFormatter`,
and how they work in different locales.

#### Cardinal Numbers

```swift
let formatter = NumberFormatter()
formatter.string(for: 4) // 4

formatter.numberStyle = .spellOut
formatter.string(for: 4) // four
```

#### Ordinal Numbers

```swift
let formatter = NumberFormatter()
formatter.numberStyle = .ordinal
formatter.string(for: 1) // 1st
```

#### Decimal Numbers

```swift
let formatter = NumberFormatter()
formatter.numberStyle = .decimal
formatter.string(for: 1234567.89) 1,234,567.89
```

#### Significant Digits

```swift
let formatter = NumberFormatter()
formatter.usesSignificantDigits = true

formatter.maximumSignificantDigits = 2

formatter.string(from: 123) // 120
formatter.string(from: 123456) // 120000
formatter.string(from: 123.456) // 120
formatter.string(from: 1.230000) // 1.2
formatter.string(from: 0.00123) // 0.0012
```

#### Integer and Fraction Digits

```swift
let formatter = NumberFormatter()
formatter.usesSignificantDigits = false // default

formatter.minimumIntegerDigits = 4
formatter.minimumFractionDigits = 2

formatter.string(from: 123) // 0123.00
formatter.string(from: 123456) // 123456.00
formatter.string(from: 123.456) // 0123.46
formatter.string(from: 1.230000) // 0001.23
formatter.string(from: 0.00123) // 0000.00
```

#### Rounding Modes

```swift
let formatter = NumberFormatter()
formatter.numberStyle = .decimal
formatter.maximumFractionDigits = 1

let numbers = [1.2, 1.22, 1.25, 1.27, -1.25]
let modes: [NumberFormatter.RoundingMode] = [.ceiling, .floor, .up, .down, .halfUp, .halfDown, .halfEven]

for mode in modes {
    formatter.roundingMode = mode

    for number in numbers {
        formatter.string(for: number)
    }
}
```

#### Scientific Notation

```swift
let formatter = NumberFormatter()
formatter.numberStyle = .scientific
formatter.string(for: 12345.6789) // 1.23456789E4
```

#### Percentages

```swift
let formatter = NumberFormatter()
formatter.numberStyle = .percent
formatter.string(for: 0.12) // 12%
```

#### Currencies

```swift
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
```

#### Custom Formats

```swift
let formatter = NumberFormatter()
formatter.numberStyle = .decimal

// Format with thousands and decimal separator
// that rounds to the nearest five tenths
formatter.format = "#,##0.5"

formatter.locale = Locale(identifier: "en-US")
formatter.string(for: 1234.567) // 1,234.5

formatter.locale = Locale(identifier: "fr-FR")
formatter.string(for: 1234.567) // 1 234,5
```

### Chapter 3

Chapter 3 shows the correct way to represent and work with money in code.

#### Money

```swift
let prices: [Money<USD>] = [2.19, 5.39, 20.99, 2.99, 1.99, 1.99, 0.99]
let subtotal = prices.reduce(0.00, +)
let tax = 0.08 * subtotal
let total = subtotal + tax // $39.45
```

#### Currency Converter

```swift
let EURtoUSD = CurrencyPair<EUR, USD>(rate: 1.17) // as of June 1st, 2018

let euroAmount: Money<EUR> = 123.45
let dollarAmount = EURtoUSD.convert(euroAmount) // $144.44
```

### Chapter 4

Chapter 4 covers Foundation's units and measurements APIs.

#### Natural Scale

```swift
let lengthOfRoom = Measurement<UnitLength>(value: 8, unit: .meters)
let distanceToAirport = Measurement<UnitLength>(value: 16, unit: .kilometers)

let formatter = MeasurementFormatter()
formatter.unitOptions = .naturalScale
formatter.string(from: lengthOfRoom) // 26.247 ft
formatter.string(from: distanceToAirport) // 9.942 mi
```

#### Provided Units

```swift
let ingotMass = Measurement<UnitMass>(value: 400, unit: .ouncesTroy)

let formatter = MeasurementFormatter()
formatter.unitOptions = .providedUnit
formatter.string(from: ingotMass) // 400 oz t
```

#### Configuring Precision

```swift
let barometerReading = Measurement<UnitPressure>(value: 29.9, unit: .inchesOfMercury)
let pressureInMillibars = barometerReading.converted(to: .millibars)

let formatter = MeasurementFormatter()
formatter.unitOptions = .providedUnit
formatter.numberFormatter.usesSignificantDigits = true
formatter.numberFormatter.maximumSignificantDigits = 3
formatter.string(from: pressureInMillibars) // 1,010 mbar
```

#### Temperature Formatting

```swift
let temperatureInF = Measurement<UnitTemperature>(value: 72, unit: .fahrenheit)
let temperatureInC = Measurement<UnitTemperature>(value: 20.5, unit: .celsius)

let formatter = MeasurementFormatter()
formatter.locale = Locale(identifier: "en-US")
formatter.string(from: temperatureInF) // 72°F
formatter.string(from: temperatureInC) // 68.9°F

formatter.locale = Locale(identifier: "fr-FR")
formatter.string(from: temperatureInF) // 22,222 °C
formatter.string(from: temperatureInC) // 20,5 °C

formatter.unitOptions = .temperatureWithoutUnit

formatter.locale = Locale(identifier: "en-US")
formatter.string(from: temperatureInF) // 72°
formatter.string(from: temperatureInC) // 20.5° (!)

formatter.locale = Locale(identifier: "fr-FR")
formatter.string(from: temperatureInF) // 72° (!)
formatter.string(from: temperatureInC) // 20,5°
```

#### Units Interoperability

```swift
let loggedFlyingTime =
    Measurement<UnitDuration>(value: 220, unit: .hours)

let formatter = DateComponentsFormatter()
formatter.allowedUnits = [.day]
formatter.unitsStyle = .full
formatter.includesApproximationPhrase = true
formatter.string(from: loggedFlyingTime) // About 9 days
```

### Chapter 5

Chapter 5 extends what we learned about units in the previous chapter
to transform Xcode Playgrounds into an interactive physical calculator.

#### Agricultural Flight Planner

```swift
let takeoffWeight = (
    emptyPlaneWeight +
    payloadWeight +
    fuelWeight +
    pilotWeight
).converted(to: .pounds)

let canTakeOff = takeoffWeight < maximumTakeoffWeight // ???
```

## License

MIT

## About Flight School

Flight School is a book series for advanced Swift developers
that explores essential topics in iOS and macOS development
through concise, focused guides.

If you'd like to get in touch,
feel free to [message us on Twitter](https://twitter.com/flightdotschool)
or email us at <info@flight.school>.

[build status]: https://travis-ci.org/Flight-School/Guide-to-Swift-Numbers-Sample-Code
[build status badge]: https://api.travis-ci.com/Flight-School/Guide-to-Swift-Numbers-Sample-Code.svg?branch=master
[license]: http://img.shields.io/badge/license-MIT-blue.svg?style=flat
[license badge]: http://img.shields.io/badge/license-MIT-blue.svg?style=flat
[swift version]: https://swift.org/download/
[swift version badge]: http://img.shields.io/badge/swift%20version-5.0-orange.svg?style=flat
