import Foundation
import CoreLocation

let timeInterval: TimeInterval = 86400
Measurement<UnitDuration>(timeInterval: timeInterval)

let dateInterval = DateInterval(start: Date(), duration: timeInterval)
Measurement<UnitDuration>(dateInterval)

UnitEnergy(EnergyFormatter.Unit.joule).symbol
UnitLength(LengthFormatter.Unit.meter).symbol
UnitMass(MassFormatter.Unit.kilogram).symbol

Measurement<UnitAngle>(clLocationDegrees: 180.0)
Measurement<UnitAngle>(clLocationDirection: 180.0)
Measurement<UnitLength>(clLocationAccuracy: 10.0)
Measurement<UnitLength>(clLocationDistance: 10.0)
Measurement<UnitSpeed>(clLocationSpeed: 5.0)

let loggedFlyingTime =
    Measurement<UnitDuration>(value: 220, unit: .hours)

let formatter = DateComponentsFormatter()
formatter.allowedUnits = [.day]
formatter.unitsStyle = .full
formatter.includesApproximationPhrase = true
formatter.string(from: loggedFlyingTime) // About 9 days
