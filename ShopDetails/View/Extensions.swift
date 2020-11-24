//
//  Extensions.swift
//  ShopDetails
//
//  Created by developer on 23/11/20.
//  Copyright © 2020 blockchain. All rights reserved.
//
import UIKit
import Alamofire
public enum ApiErrors: String,Error,CustomStringConvertible {
       case networkError
       case dataError
       case encodingError
       case unknownError
       
    public var description: String {
           return "\(self.rawValue)"
       }
   }

typealias resultData = (Result<Data, ApiErrors>) -> ()
class Extensions: NSObject {
    static var deviceiOSArray = Array<Any>()
    static var deviceAndroidArray = Array<Any>()
    //Saving the mobile number
    class func setUserMobileNumber(_ number:String)->Void
        {
            UserDefaults.standard.set(number, forKey: "UserMobileNumber")
            UserDefaults.standard.synchronize()
        }
    //This method will return the mobile number of the user
     
        class func getUserMobileNumber()->String
        {
            let number = UserDefaults.standard.object(forKey: "UserMobileNumber")
            if number == nil
            {
                return "123456"
            }
            else
            {
                return number as! String
            }
        }
    class func isValidMobileNumber(_ mob:String)->Bool
       {
           //Mobile Number Validation
           let charcter  = CharacterSet(charactersIn: "0123456789").inverted
           var filtered:NSString!
           let inputString:NSArray = mob.components(separatedBy: charcter) as NSArray
           filtered = inputString.componentsJoined(by: "") as NSString?
          // if  mob == filtered && mob
           if  mob .isEqual(filtered) && mob
           .count < 8
           {
               return false
           }
           else
           {
               //return mob == filtered
               return mob.isEqual(filtered)
           }
           
           
       }
    
    class var iOSDetailsList : [Shops]?
    {
        get {
            var iOSDetail: [Shops]? = nil
            
            if let data = UserDefaults.standard.value(forKey: "iOSDetails") as? Data {
                
                do {
                    let decoder = JSONDecoder()
                    iOSDetail = try decoder.decode([Shops].self, from: data)
                    
                    return iOSDetail
                } catch let exception {
                    print(exception.localizedDescription)
                }
            }
            return iOSDetail
        } set {
            
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(newValue)
                UserDefaults.standard.set(data, forKey: "applanguageDetails")
                
            } catch let exception {
                print(exception.localizedDescription)
            }
        }
    }
   class func getResponse()
        {
          AF.request("https://foodie.deliveryventure.com/shops/data").responseData { response in
              switch response.result {
              case .success(let value):
                do {
                   
                    if let result = try JSONSerialization.jsonObject(with: value, options: .mutableContainers) as? NSDictionary{
                        let shopsArray = (result.object(forKey: "shops") as! NSArray)
                        for i in 0...shopsArray.count-1{
                            if "\(((shopsArray[i] as AnyObject).object(forKey: "device_type") as AnyObject))" == "ios"{
                                deviceiOSArray.append(shopsArray[i])
                                
                            }
                            else{
                                deviceAndroidArray.append(shopsArray[i])
                            }
                        }
                   }
                } catch {
                    print(error.localizedDescription)
                }
              case .failure(let error):
                  print(error)
              }
          }

        }

           

    class DecodeHelper {
        
        class func ParseData<H:Codable>(with responseData:Data ,Completion: @escaping (Result<H, ApiErrors>) -> ()) {
            do{
             let decoder = JSONDecoder()
             let getValues = try decoder.decode(H.self, from: responseData)
//             print("Result Dictionary----->",try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as! NSDictionary)
             Completion(.success(getValues))
            }
            catch {
             print("error: ", error)
             Completion(.failure(.dataError))
            }
        }
        
    }
    

}

    
extension KeyedDecodingContainer {
    
    func decodeWrapper<H>(key: K, defaultValue: H) throws -> H
          where H: Decodable {
          return try decodeIfPresent(H.self, forKey: key) ?? defaultValue
      }
    
    
}
