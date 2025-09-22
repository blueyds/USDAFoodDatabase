import Foundation



public struct USDANutrientConversionFactor: Decodable, Identifiable {
    public var type: String?
    public var proteinValue: Double?
    public var fatValue: Double?
    public var carbohydrateValue: Double?
    public var value: Double?
    public var id: String{
        type ?? UUID().uuidString
    }
    public enum CodingKeys: String, CodingKey{
        case type 
        case proteinValue 
        case fatValue 
        case carbohydrateValue 
        case value 
    }
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(forKey: .type)
        proteinValue = try container.decodeIfPresent(forKey: .proteinValue)
        fatValue = try container.decodeIfPresent(forKey: .fatValue)
        carbohydrateValue = try container.decodeIfPresent(forKey: .carbohydrateValue)
        value = try container.decodeIfPresent(forKey: .value)
    }
}
