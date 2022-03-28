//
//  Serie.swift
//  Challenge
//
//  Created by Felipe Martinez on 27/03/22.
//

import Foundation

public class Serie{
    
    public struct TopSeries{
        public var id:  String
        public var Rank:  String
        public var RankUpDown:  String
        public var Title:  String
        public var FullTitle:  String
        public var Year:  String
        public var Image:  String
        public var Crew:  String
        public var IMDbRating:  String
        public var IMDbRatingCount:  String
        
        init(_ dictionary: [String: Any]) {
            self.id = dictionary["id"] as? String ?? ""
            self.Rank = dictionary["rank"] as? String ?? ""
            self.RankUpDown = dictionary["rankUpDown"] as? String ?? ""
            self.Title = dictionary["title"] as? String ?? ""
            self.FullTitle = dictionary["fullTitle"] as? String ?? ""
            self.Year = dictionary["year"] as? String ?? ""
            self.Image = dictionary["image"] as? String ?? ""
            self.Crew = dictionary["crew"] as? String ?? ""
            self.IMDbRating = dictionary["imDbRating"] as? String ?? ""
            self.IMDbRatingCount = dictionary["imDbRatingCount"] as? String ?? ""
        }
    }
    
    public func getData() -> Array<TopSeries>{
        let semaphore = DispatchSemaphore (value: 0)
        var model = [TopSeries]()
        var request = URLRequest(url: URL(string: "https://imdb-api.com/en/API/MostPopularTVs/k_1jwwmt8u")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
         
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                let jsonDict = jsonResponse as! NSDictionary
                let _ = jsonDict["errorMessage"] as! String
                let items = jsonDict["items"] as! NSArray
                let jsonArray = items as! [[String: Any]]
                
                for dic in jsonArray{
                    model.append(TopSeries(dic))
                }
                
            } catch {
                print(error.localizedDescription)
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return model
    }
    
}
