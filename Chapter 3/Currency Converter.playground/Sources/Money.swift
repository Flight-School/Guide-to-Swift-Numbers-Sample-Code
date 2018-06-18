import Foundation

public struct Money<C: CurrencyType>: Equatable, Hashable {
    public typealias Currency = C
    
    public var amount: Decimal
    
    public init(_ amount: Decimal) {
        self.amount = amount
    }
    
    public var currency: CurrencyType.Type {
        return Currency.self
    }
}

extension Money: Comparable {
    public static func < <C>(lhs: Money<C>, rhs: Money<C>) -> Bool where C: CurrencyType {
        return lhs.amount < rhs.amount
    }
}

extension Money: CustomStringConvertible {
    public var description: String {
        return "\(self.amount)"
    }
}

extension Money: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = Currency.code
        
        return formatter.string(for: self.amount)!
    }
}

extension Money: LosslessStringConvertible {
    public init?(_ description: String) {
        guard let amount = Decimal(string: description) else {
            return nil
        }
        
        self.init(amount)
    }
}

extension Money: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(Decimal(integerLiteral: value))
    }
}

extension Money: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        var approximate = Decimal(floatLiteral: value)
        var rounded = Decimal()
        NSDecimalRound(&rounded, &approximate, Currency.minorUnit, .bankers)
        self.init(rounded)
    }
}

extension Money: ExpressibleByStringLiteral {
    public init(unicodeScalarLiteral value: Unicode.Scalar) {
        fatalError("Money cannot be initialized from Unicode scalar")
    }
    
    public init(extendedGraphemeClusterLiteral value: Character) {
        fatalError("Money cannot be initialized from extended grapheme cluster")
    }
    
    public init(stringLiteral value: String) {
        self.init(value)!
    }
}

extension Money {
    public static func + (lhs: Money<C>, rhs: Money<C>) -> Money<C> {
        return Money<C>(lhs.amount + rhs.amount)
    }
    
    public static func += (lhs: inout Money<C>, rhs: Money<C>) {
        lhs.amount += rhs.amount
    }
    
    public static func - (lhs: Money<C>, rhs: Money<C>) -> Money<C> {
        return Money<C>(lhs.amount - rhs.amount)
    }
    
    public static func -= (lhs: inout Money<C>, rhs: Money<C>) {
        lhs.amount -= rhs.amount
    }
}

extension Money {
    public static func * (lhs: Money<C>, rhs: Decimal) -> Money<C> {
        return Money<C>(lhs.amount * rhs)
    }
    
    public static func * (lhs: Money<C>, rhs: Double) -> Money<C> {
        return lhs * Decimal(rhs)
    }
    
    public static func * (lhs: Money<C>, rhs: Int) -> Money<C> {
        return lhs * Decimal(rhs)
    }
    
    public static func * (lhs: Decimal, rhs: Money<C>) -> Money<C> {
        return Money<C>(lhs * rhs.amount)
    }
    
    public static func * (lhs: Double, rhs: Money<C>) -> Money<C> {
        return Decimal(lhs) * rhs
    }
    
    public static func * (lhs: Int, rhs: Money<C>) -> Money<C> {
        return Decimal(lhs) * rhs
    }
    
    public static func *= (lhs: inout Money<C>, rhs: Decimal) {
        lhs.amount *= rhs
    }
    
    public static func *= (lhs: inout Money<C>, rhs: Double) {
        lhs.amount *= Decimal(rhs)
    }
    
    public static func *= (lhs: inout Money<C>, rhs: Int) {
        lhs.amount *= Decimal(rhs)
    }
}

extension Money {
    public static prefix func - (value: Money<C>) -> Money<C> {
        return Money<C>(-value.amount)
    }
}

extension Money: Codable {
    private enum CodingKeys: String, CodingKey {
        case amount
        case currencyCode
    }
    
    public init(from decoder: Decoder) throws {
        if let keyedContainer = try? decoder.container(keyedBy: CodingKeys.self) {
            let currencyCode = try keyedContainer.decode(String.self, forKey: .currencyCode)
            guard currencyCode == Currency.code else {
                let context = DecodingError.Context(codingPath: keyedContainer.codingPath, debugDescription: "Currency mismatch: expected \(Currency.code), got \(currencyCode)")
                throw DecodingError.typeMismatch(Money<Currency>.self, context)
            }
            self.amount = try keyedContainer.decode(Decimal.self, forKey: .amount)
        } else if let singleValueContainer = try? decoder.singleValueContainer() {
            self.amount = try singleValueContainer.decode(Decimal.self)
        } else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Couldn't decode Money value")
            throw DecodingError.dataCorrupted(context)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var keyedContainer = encoder.container(keyedBy: CodingKeys.self)
        try keyedContainer.encode(self.amount, forKey: .amount)
        try keyedContainer.encode(Currency.code, forKey: .currencyCode)
    }
}
