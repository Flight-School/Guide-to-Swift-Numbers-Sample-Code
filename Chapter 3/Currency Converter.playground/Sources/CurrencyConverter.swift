import Foundation

public protocol UnidirectionalCurrencyConverter {
    associatedtype Fixed: CurrencyType
    associatedtype Variable: CurrencyType
    
    var rate: Decimal { get set }
}

extension UnidirectionalCurrencyConverter {
    public func convert(_ value: Money<Fixed>) -> Money<Variable> {
        return Money<Variable>(value.amount * rate)
    }
}

public protocol BidirectionalCurrencyConverter: UnidirectionalCurrencyConverter {}

extension BidirectionalCurrencyConverter {
    public func convert(_ value: Money<Variable>) -> Money<Fixed> {
        return Money<Fixed>(value.amount / rate)
    }
}

public struct CurrencyPair<Fixed, Variable>: BidirectionalCurrencyConverter where Fixed: CurrencyType, Variable: CurrencyType {
    public var rate: Decimal
    
    public init(rate: Decimal) {
        precondition(rate > 0)
        self.rate = rate
    }
}

extension CurrencyPair: CustomStringConvertible {
    public var description: String {
        return "\(Fixed.code)/\(Variable.code) \(rate)"
    }
}
