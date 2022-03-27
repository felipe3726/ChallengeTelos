//
//  Movie.swift
//  Challenge
//
//  Created by Felipe Martinez on 24/03/22.
//

import Foundation

public class Movie {
    
    struct Top250Data
    {
        public var ErrorMessage: String
        public var Items: Array<TopMovies>
        
        
    }
    
    public struct TopMovies
    {
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
    

    
    public func getData(){
        let semaphore = DispatchSemaphore (value: 0)
         
        var request = URLRequest(url: URL(string: "https://imdb-api.com/en/API/MostPopularMovies/k_1jwwmt8u")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
         
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                let jsonDict = jsonResponse as! NSDictionary
                let items = jsonDict["items"] as! NSArray
                let jsonArray = items as! [[String: Any]]
                
                var model = [TopMovies]()
                for dic in jsonArray{
                    model.append(TopMovies(dic))
                }
            } catch {
                print(error.localizedDescription)
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
}
