import Foundation

let barometerReading = Measurement<UnitPressure>(value: 29.9, unit: .inchesOfMercury)
let pressureInMillibars = barometerReading.converted(to: .millibars)

let formatter = MeasurementFormatter()
formatter.unitOptions = .providedUnit
formatter.numberFormatter.usesSignificantDigits = true
formatter.numberFormatter.maximumSignificantDigits = 3
formatter.string(from: pressureInMillibars)
