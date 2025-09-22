import Foundation


public struct USDAFoodAttributeType: Decodable{
    public var id: Int?
    public var name: String?
    public var _description: String?
    
    
     public init(from decoder: any Decoder) throws {    
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(forKey: .id)
        name = try container.decodeIfPresent(forKey: .name)
        _description = try container.decodeIfPresent(forKey: ._description)
    }
    
    public enum CodingKeys: String, CodingKey{
        case id
        case name
        case _description = "description" 
    }
}
