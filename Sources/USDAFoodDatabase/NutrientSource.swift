import Foundation



public struct USDANutrientSource: Decodable {
    public var id: Int?
    public var code: String?
    public var _description: String?
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(forKey: .id)
        code = try container.decodeIfPresent(forKey: .code)
        _description = try container.decodeIfPresent(forKey: ._description)
    }
    
    
    public enum CodingKeys: String, CodingKey{
        case id 
        case code 
        case _description = "description"
    }
}
