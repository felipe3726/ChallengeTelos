//
//  Movie.swift
//  Challenge
//
//  Created by Felipe Martinez on 24/03/22.
//

import Foundation

public class Movie {
    
    public struct TopMovies{
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
    
    public func getData() -> Array<TopMovies>{
        let semaphore = DispatchSemaphore (value: 0)
        var model = [TopMovies]()
        var request = URLRequest(url: URL(string: "https://imdb-api.com/en/API/MostPopularMovies/k_6vla0are")!,timeoutInterval: Double.infinity)
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
                    model.append(TopMovies(dic))
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
    
    public func Search(_ movie: String) -> (String, String, URL){
        
        let semaphore = DispatchSemaphore (value: 0)
        var title : String = ""
        var url : URL =  URL(string: "https://imdb-api.com/images/original/MV5BNzA2ZDk2ZTUtMWU2Yi00NDVmLTk1ODEtMmFmMjQyNWYzODI0XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_Ratio0.7273_AL_.jpg")!
        var description: String = ""
        var image : String = ""
        
        var request = URLRequest(url: URL(string: "https://imdb-api.com/API/Search/k_6vla0are/" + movie)!,timeoutInterval: Double.infinity)
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
                let _ = jsonDict["expression"] as! String
                let items = jsonDict["results"] as! NSArray
                let jsonArray = items as! [[String: Any]]
                
                title = jsonArray[0]["title"] as! String
                image = jsonArray[0]["image"] as! String
                url = URL(string: image)!
                description = jsonArray[0]["description"] as! String
                
            } catch {
                print(error.localizedDescription)
            }
          semaphore.signal()
        }
         
        task.resume()
        semaphore.wait()
        return (title, description, url)
    }
}
