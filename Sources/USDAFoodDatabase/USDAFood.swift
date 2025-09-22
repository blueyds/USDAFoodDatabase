//
//  USDAFoodData.swift
//  FoodLogger
//
//  Created by Craig Nunemaker on 8/9/25.
//
import Foundation


public struct USDAFoodData: Decodable{
    public var fdcId: Int
    public var dataType: String
    public var name: String
    //        
    public var foodClass: String?
    public var foodNutrients: [USDAFoodNutrient]
    public var foodAttributes: [USDAFoodAttribute]
    public var nutrientConversionFactors : [USDANutrientConversionFactor]
    public var isHistoricalReference: Bool?
    public var nbdNumber: Int?
    public var foodCategory: USDAFoodDescription?
    public var foodPortions: [USDAFoodPortion]
    //        public let publicationDate: Date?
    public var inputFoods: [USDAInputFood]


	public func getAmountForNutrient(named name: String)->Double{
		var result: Double = 0
		if let nutrient = foodNutrients.first(where: {$0.nutrient?.name == name}){
			result = nutrient.amount ?? 0
		}
		return result
	}

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fdcId = try container.decode( forKey: .fdcId)
        dataType = try container.decode(forKey: .dataType)
        name = try container.decode(forKey: .name)
        foodClass = try container.decodeIfPresent(forKey: .foodClass)
        foodNutrients = try container.decode(forKey: .foodNutrients)
        foodAttributes = try container.decode(forKey: .foodAttributes)
        nutrientConversionFactors = try container.decode(forKey: .nutrientConversionFactors)
        isHistoricalReference = try container.decodeIfPresent(forKey: .isHistoricalReference)
        nbdNumber = try container.decodeIfPresent(forKey: .nbdNumber)
        foodCategory = try container.decodeIfPresent(forKey: .foodCategory)
         foodPortions = try container.decodeEmptyIfError(forKey: .foodPortions)
        inputFoods = try container.decode(forKey: .inputFoods)
    }
    
    
    public enum CodingKeys:String, CodingKey{
        case fdcId
        case dataType
        case name = "description" 
        case foodClass 
        case foodNutrients
        case foodAttributes
        case nutrientConversionFactors
        case isHistoricalReference
        case nbdNumber
        case foodCategory
        case foodPortions
        case inputFoods
    }
    
}









