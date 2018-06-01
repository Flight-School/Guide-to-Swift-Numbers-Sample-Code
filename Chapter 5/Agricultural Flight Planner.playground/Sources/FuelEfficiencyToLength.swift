import Foundation

public func *(lhs: Measurement<UnitFuelEfficiency>, rhs: Measurement<UnitVolume>) -> Measurement<UnitLength> {
    return .init(value: lhs.converted(to: .litersPer100Kilometers).value * rhs.converted(to: .liters).value, unit: .kilometers)
}
