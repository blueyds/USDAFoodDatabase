import Foundation


public struct USDAFoodNutrientDerivation: Decodable {
    public var id: Int?
    public var code: String?
    public var _description: String?
    public var foodNutrientSource: USDANutrientSource?
    
     public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(forKey: .id)
        code = try container.decodeIfPresent(forKey: .code)
        _description = try container.decodeIfPresent(forKey: ._description)
        foodNutrientSource = try container.decodeIfPresent(forKey: .foodNutrientSource)
    }
    
    public enum CodingKeys: String, CodingKey{
        case id 
        case code 
        case _description = "description"
        case foodNutrientSource 
    }
}
