import Darwin

public struct FloatingPointEnvironmentFlags: OptionSet {
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    
    public static let inexact = FloatingPointEnvironmentFlags(rawValue: FE_INEXACT)
    public static let underflow = FloatingPointEnvironmentFlags(rawValue: FE_UNDERFLOW)
    public static let overflow = FloatingPointEnvironmentFlags(rawValue: FE_OVERFLOW)
    public static let divisionByZero = FloatingPointEnvironmentFlags(rawValue: FE_DIVBYZERO)
    public static let invalid = FloatingPointEnvironmentFlags(rawValue: FE_INVALID)
    public static let denormalOperand = FloatingPointEnvironmentFlags(rawValue: FE_DENORMALOPERAND)
}


public struct FloatingPointEnvironmentError: Error {
    public let flags: FloatingPointEnvironmentFlags
    
    public init(flags: FloatingPointEnvironmentFlags) {
        self.flags = flags
    }
}

@discardableResult
public func detectingFloatingPointErrors<T>(flags: FloatingPointEnvironmentFlags, _ closure: () throws -> T) throws -> T {
    feclearexcept(flags.rawValue)
    let value = try closure()
    guard fetestexcept(flags.rawValue) == 0 else {
        throw FloatingPointEnvironmentError(flags: flags)
    }
    
    return value
}

extension FloatingPointEnvironmentFlags: CustomDebugStringConvertible {
    public var debugDescription: String {
        var components: [String] = []
        if self.contains(.inexact) {
            components.append("inexact")
        }
        
        if self.contains(.underflow) {
            components.append("underflow")
        }
        
        if self.contains(.overflow) {
            components.append("overflow")
        }
        
        if self.contains(.divisionByZero) {
            components.append("divisionByZero")
        }
        
        if self.contains(.invalid) {
            components.append("invalid")
        }
        
        if self.contains(.denormalOperand) {
            components.append("denormalOperand")
        }
        
        return components.joined(separator: ", ")
    }
}

extension FloatingPointEnvironmentError: CustomDebugStringConvertible {
    public var debugDescription: String {
        return self.flags.debugDescription
    }
}
