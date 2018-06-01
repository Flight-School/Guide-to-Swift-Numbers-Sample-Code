import Foundation

extension Measurement {
    public static func / <T>(lhs: Measurement<T>, rhs: Measurement<T>) -> Double where T: Dimension {
        return lhs.value / rhs.converted(to: lhs.unit).value
    }
}
