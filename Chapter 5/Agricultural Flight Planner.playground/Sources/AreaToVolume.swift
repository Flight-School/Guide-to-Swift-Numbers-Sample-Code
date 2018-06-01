import Foundation

public func *(lhs: Measurement<UnitArea>, rhs: Measurement<UnitLength>) -> Measurement<UnitVolume> {
    return .init(value: lhs.converted(to: .squareMeters).value * rhs.converted(to: .meters).value, unit: .cubicMeters)
}
