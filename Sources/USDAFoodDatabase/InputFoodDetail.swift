import Foundation



public struct USDAInputFoodDetail: Decodable {
    public var foodClass: String?
    public var _description: String?
    public var dataType: String?
    public var foodCategory: USDAFoodDataCategory?
    public var fdcId: Int?
//    public let publicationDate: String?
    
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        foodClass = try container.decodeIfPresent(forKey: .foodClass)
        _description = try container.decodeIfPresent(forKey: ._description)
        dataType = try container.decodeIfPresent(forKey: .dataType)
        foodCategory = try container.decodeIfPresent(forKey: .foodCategory)
        fdcId = try container.decodeIfPresent(forKey: .fdcId)
    }
    
    
    public enum CodingKeys: String, CodingKey{
        case foodClass
        case _description = "description"
        case dataType
        case foodCategory
        case fdcId
    }
}
