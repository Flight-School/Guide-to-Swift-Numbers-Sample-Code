import Foundation

public func /(lhs: Measurement<UnitForce>, rhs: Measurement<UnitArea>) -> Measurement<UnitPressure> {
    return .init(value: lhs.converted(to: .newtons).value / rhs.converted(to: .squareMeters).value, unit: .newtonsPerMetersSquared)
}
