import Foundation

public class UnitMagneticFlux: Dimension {
    public class var webers: UnitMagneticFlux {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "Wb", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitMagneticFlux {
        return .webers
    }
}
