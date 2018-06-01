import Foundation

public func /(lhs: Measurement<UnitVolume>, rhs: Measurement<UnitLength>) -> Measurement<UnitArea> {
    return .init(value: lhs.converted(to: .cubicMeters).value / rhs.converted(to: .meters).value, unit: .squareMeters)
}
