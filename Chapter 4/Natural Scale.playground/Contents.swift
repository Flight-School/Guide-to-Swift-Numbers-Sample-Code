import Foundation

let lengthOfRoom = Measurement<UnitLength>(value: 8, unit: .meters)
let distanceToAirport = Measurement<UnitLength>(value: 16, unit: .kilometers)

let formatter = MeasurementFormatter()
formatter.unitOptions = .naturalScale
formatter.string(from: lengthOfRoom)
formatter.string(from: distanceToAirport)
