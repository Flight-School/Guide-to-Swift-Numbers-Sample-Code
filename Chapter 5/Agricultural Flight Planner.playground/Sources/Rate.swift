import Foundation

public struct Rate<Numerator, Denominator> where Numerator: Unit, Denominator: Unit {
    public var value: Double
    public var numeratorUnit: Numerator
    public var denominatorUnit: Denominator
    
    public var symbol: String {
        return "\(self.numeratorUnit.symbol)/\(self.denominatorUnit.symbol)"
    }
    
    public init(value: Double, unit numeratorUnit: Numerator, per denominatorUnit: Denominator) {
        self.value = value
        self.numeratorUnit = numeratorUnit
        self.denominatorUnit = denominatorUnit
    }
    
    public init(numerator: Measurement<Numerator>, denominator: Measurement<Denominator>) {
        precondition(denominator.value > 0)
        let value = numerator.value / denominator.value
        self.init(value: value, unit: numerator.unit, per: denominator.unit)
    }
}

extension Rate: CustomStringConvertible {
    public var description: String {
        return "\(self.value) \(self.symbol)"
    }
}

public func * <T, U>(lhs: Rate<T,U>, rhs: Measurement<U>) -> Measurement<T> where T: Dimension, U: Dimension {
    return .init(value: Measurement(value: lhs.value, unit: rhs.unit).converted(to: lhs.denominatorUnit).value * rhs.value, unit: lhs.numeratorUnit)
}

public func * <T, U>(lhs: Measurement<U>, rhs: Rate<T,U>) -> Measurement<T> where T: Dimension, U: Dimension {
    return .init(value: Measurement(value: rhs.value, unit: lhs.unit).converted(to: rhs.denominatorUnit).value * lhs.value, unit: rhs.numeratorUnit)
}

public func / <T, U>(lhs: Rate<T,U>, rhs: Measurement<T>) -> Measurement<U> where T: Dimension, U: Dimension {
    return .init(value: Measurement(value: lhs.value, unit: lhs.numeratorUnit).converted(to: rhs.unit).value / rhs.value, unit: lhs.denominatorUnit)
}
