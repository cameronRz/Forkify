//
//  ForkifyStore.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

fileprivate let apiEndpoint = "https://forkify-api.herokuapp.com/api/v2/recipes/"
fileprivate let apiKey = "78543e3c-c035-4275-9c43-999a5d4d12cc" // Not a secret

class ForkifyStore: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var recipe: FSRecipe? = nil
    @Published var recipes = [FSRecipe]()
    
    // MARK: - Search recipes
    func searchRecipes(withPhrase phrase: String) {
        let url = URL(string: "\(apiEndpoint)?search=\(phrase)&key=\(apiKey)")!
        
        isLoading = true
        makeHTTPRequest(withURL: url) { (response, error) in
            var recipes = [FSRecipe]()
            
            if let recipeResults = response?.data?.recipes {
                recipes = recipeResults
            }
            
            DispatchQueue.main.async {
                self.recipes = recipes
                self.isLoading = false
            }
        }
    }
    
    // MARK: - Get recipe by ID
    func getRecipe(byId id: String) {
        let url = URL(string: "\(apiEndpoint)\(id)?key=\(apiKey)")!
        
        isLoading = true
        makeHTTPRequest(withURL: url) { (response, error) in
            var recipe: FSRecipe?
            
            if let recipeResult = response?.data?.recipe {
                recipe = recipeResult
            }
            
            DispatchQueue.main.async {
                self.recipe = recipe
                self.isLoading = false
            }
        }
    }
    
    // MARK: - Make HTTP Request
    private func makeHTTPRequest(withURL url: URL, completion: @escaping (FSResponse?, Error?) -> Void) {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let err = error {
                return completion(nil, err)
            }
            
            if let safeData = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let decodedData = try decoder.decode(FSResponse.self, from: safeData)
                    completion(decodedData, nil)
                } catch {
                    completion(nil, error)
                }
            }
        })
        
        task.resume()
    }
}
