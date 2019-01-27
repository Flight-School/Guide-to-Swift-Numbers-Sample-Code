import Foundation

public final class UnitAngularSpeed: UnitFrequency {
    public class var degreesPerSecond: UnitAngularSpeed {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "deg/s", converter: baseUnitConverter)
    }
    
    public class var radiansPerSecond: UnitAngularSpeed {
        let converter = UnitConverterLinear(coefficient: 0.0174533)
        return .init(symbol: "rad/s", converter: converter)
    }
    
    public class var rotationsPerMinute: UnitAngularSpeed {
        let converter = UnitConverterLinear(coefficient: 1.0 / 360.0)
        return .init(symbol: "rpm", converter: converter)
    }
    
    public override class func baseUnit() -> UnitAngularSpeed {
        return .degreesPerSecond
    }
}
