import Foundation



public struct USDAFoodDescription: Decodable {
    public var _description: String?
    
    public enum CodingKeys: String, CodingKey{
        case _description = "description"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _description = try container.decodeIfPresent(forKey: ._description)
    }
}
