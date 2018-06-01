import Foundation

public func *(lhs: Measurement<UnitLength>, rhs: Measurement<UnitLength>) -> Measurement<UnitArea> {
    return .init(value: lhs.converted(to: .meters).value * rhs.converted(to: .meters).value, unit: UnitArea.squareMeters)
}
