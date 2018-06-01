import Foundation

public func /(lhs: Measurement<UnitArea>, rhs: Measurement<UnitLength>) -> Measurement<UnitLength> {
    return .init(value: lhs.converted(to: .squareMeters).value / rhs.converted(to: .meters).value, unit: .meters)
}
