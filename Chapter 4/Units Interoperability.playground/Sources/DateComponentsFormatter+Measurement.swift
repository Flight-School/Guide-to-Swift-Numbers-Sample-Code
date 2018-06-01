import Foundation

extension DateComponentsFormatter {
    public func string(from duration: Measurement<UnitDuration>) -> String? {
        let (seconds, fractionsOfASeconds) =
            modf(duration.converted(to: .seconds).value)
        let nanoseconds = fractionsOfASeconds * 1000000000
        let dateComponents =
            DateComponents(second: Int(seconds),
                           nanosecond: Int(nanoseconds))
        return string(from: dateComponents)
    }
}
