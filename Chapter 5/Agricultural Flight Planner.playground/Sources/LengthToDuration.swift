import Foundation

public func /(lhs: Measurement<UnitLength>, rhs: Measurement<UnitSpeed>) -> Measurement<UnitDuration> {
    return .init(value: lhs.converted(to: .meters).value / rhs.converted(to: .metersPerSecond).value, unit: .seconds)
}
