import Foundation

public func *(lhs: Measurement<UnitLength>, rhs: Measurement<UnitArea>) -> Measurement<UnitVolume> {
    return .init(value: lhs.converted(to: .meters).value * rhs.converted(to: .squareMeters).value, unit: .cubicMeters)
}
