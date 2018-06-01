import Foundation

public func /(lhs: Measurement<UnitVolume>, rhs: Measurement<UnitArea>) -> Measurement<UnitLength> {
    return .init(value: lhs.converted(to: .cubicMeters).value / rhs.converted(to: .squareMeters).value, unit: .meters)
}
