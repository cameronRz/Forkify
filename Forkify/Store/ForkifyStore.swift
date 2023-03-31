//
//  ForkifyStore.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

fileprivate let apiEndpoint = "https://forkify-api.herokuapp.com/api/v2/recipes/"

class ForkifyStore: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var recipes = [FSRecipe]()
    
    func searchRecipes(withPhrase phrase: String) {
        isLoading = true
        let url = URL(string: "\(apiEndpoint)?search=\(phrase)&key=78543e3c-c035-4275-9c43-999a5d4d12cc")!
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let err = error {
                print(err)
                return
            }
            
            if let safeData = data {
                do {
                    let decodedData = try JSONDecoder().decode(FSResponse.self, from: safeData)
                    
                    if let recipeSearchResults = decodedData.data?.recipes {
                        DispatchQueue.main.async {
                            self.recipes = recipeSearchResults
                        }
                    }
                    
                    // Else render no results found for UI
                } catch {
                    print(error)
                }
                
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        })

        task.resume()
    }
    
    func getRecipe(byId id: String) {
        //
    }
}
