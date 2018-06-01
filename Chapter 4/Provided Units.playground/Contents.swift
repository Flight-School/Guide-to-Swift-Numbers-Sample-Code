import Foundation

let ingotMass = Measurement<UnitMass>(value: 400, unit: .ouncesTroy)

let formatter = MeasurementFormatter()
formatter.unitOptions = .providedUnit
formatter.string(from: ingotMass)
