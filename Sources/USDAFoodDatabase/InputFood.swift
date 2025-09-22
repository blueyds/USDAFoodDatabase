import Foundation



public struct USDAInputFood: Decodable {
    public var id: Int
    public var _description: String?
    public var inputFood: USDAInputFoodDetail?
    
    
    public enum CodingKeys: String, CodingKey{
        case id 
        case _description = "description"
        case inputFood
    }
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(forKey: .id)
        _description = try container.decodeIfPresent(forKey: ._description)
        inputFood = try container.decodeIfPresent(forKey: .inputFood)
    }
}
