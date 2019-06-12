import Foundation

/*
 You write code to get data from a URL
 Once you fetch the data, if the request is successfull, you get back Data (bytes)
 We then use iOS build in library to convert that Data to a Dictionary
 Once we convert it into a dictionary, we take values out of that dictionary to populate our Models
 Once we populate our models we inform our UI to update itself
 */


//Funtion to get data from a local JSON file
func getData(forJSONFile fileName : String?) -> Data? {
    if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return jsonData
        } catch {
            print(error)
        }
    }
    return nil
}

//Extension to Print JSON
extension Data {
    
    var prettyPrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}

//Printing Json
let sampleJsonFileName: String = "restaurants"
let data = getData(forJSONFile: sampleJsonFileName)
print(data?.prettyPrintedJSONString ?? "")



//Code to request Data from a URL
let urlString = ""
if let url = URL(string: urlString) {
    let _ = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        print(String(data: data, encoding: .utf8)!)
    }.resume()
}



//Code to Convert Data to Dictionary
func convertToDictionary(data: Data?) -> [String: Any]? {
    guard let data = data else { return nil }
    
    do {
        return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    } catch {
        print(error.localizedDescription)
    }
    return nil
}

let dict = convertToDictionary(data: data)
print("Dictionary: \(String(describing: dict))")




//Sample Model
struct Restaurant {
    var name: String?
}

struct RestaurantData {
    var restaurants: [Restaurant] = []
    var title: String?
}




//Sample Method which takes in a dictionary and returns RestaurantData Model

func getRestaurantData(fromDict dict: [String: Any]) -> RestaurantData {
    
    let restaurantData = RestaurantData(restaurants: [], title: nil)
    
    if let responseObject = dict["res"] as? String {
        print(responseObject)
    }
    
    if let restaurants = dict[""] as? [Any] {
        //Parse each restaurant and append in above array
        print(restaurants)
    }
    
    return restaurantData
}
