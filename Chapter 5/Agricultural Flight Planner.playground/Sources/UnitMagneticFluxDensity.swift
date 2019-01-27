import Foundation

public final class UnitMagneticFluxDensity: Dimension {
    public class var teslas: UnitMagneticFluxDensity {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "T", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitMagneticFluxDensity {
        return .teslas
    }
}
