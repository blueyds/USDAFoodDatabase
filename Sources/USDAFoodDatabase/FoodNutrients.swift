import Foundation


public struct USDAFoodNutrient: Decodable{
    public var _id: Int?
    public var amount: Double?
    public var dataPoints: Int?
    public var min: Double?
    public var max: Double?
    public var median: Double?
    public var type: String?
    public var nutrient: USDANutrient?
    public var foodNutrientDerivation: USDAFoodNutrientDerivation?
    
    
    public func amountPer(grams: Double)->Double{
        var result:Double = .zero
        if let nutrientValuePer100 = amount{
            result = nutrientValuePer100 * grams / 100
            result.round(.toNearestOrAwayFromZero)
        }
        return result
    }


    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decodeIfPresent(forKey: ._id)
        amount = try container.decodeIfPresent(forKey: .amount)
        dataPoints = try container.decodeIfPresent(forKey: .dataPoints)
        min = try container.decodeIfPresent(forKey: .min)
        max = try container.decodeIfPresent(forKey: .max)
        median = try container.decodeIfPresent(forKey: .median)
        type = try container.decodeIfPresent(forKey: .type)
        nutrient = try container.decodeIfPresent(forKey: .nutrient)
        foodNutrientDerivation = try container.decodeIfPresent(forKey: .foodNutrientDerivation)
    }
    
    
    
    public enum CodingKeys: String, CodingKey{
        case _id = "id"
        case amount
        case dataPoints
        case min 
        case max 
        case median
        case type 
        case nutrient
        case foodNutrientDerivation
    }
}
