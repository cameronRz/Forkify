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
    
    @Published var currentRecipeIngredients = [String]()
    @Published var currentRecipeServings: Int = 1
    
    private var ingredientFormatter: IngredientFormatter?
    
    func increaseRecipeServings() {
        if let formatter = ingredientFormatter {
            formatter.increaseServings()
            self.currentRecipeIngredients = formatter.ingredients
            self.currentRecipeServings = formatter.servings
        }
    }
    
    func decreaseRecipeServings() {
        if let formatter = ingredientFormatter {
            formatter.decreaseServings()
            self.currentRecipeIngredients = formatter.ingredients
            self.currentRecipeServings = formatter.servings
        }
    }
}

// MARK: - API HTTP Requests
extension ForkifyStore {
    // MARK: - Search recipes
    func searchRecipes(withPhrase phrase: String) {
        let url = URL(string: "\(apiEndpoint)?search=\(phrase)&key=\(apiKey)")!
        
        isLoading = true
        makeHTTPRequest(withURL: url) { (response, error) in
            DispatchQueue.main.async {
                if let recipes = response?.data?.recipes {
                    self.recipes = recipes
                }
                
                self.isLoading = false
            }
        }
    }
    
    // MARK: - Get recipe by ID
    func getRecipe(byId id: String) {
        let url = URL(string: "\(apiEndpoint)\(id)?key=\(apiKey)")!
        
        isLoading = true
        makeHTTPRequest(withURL: url) { (response, error) in
            DispatchQueue.main.async {
                if let recipe = response?.data?.recipe {
                    self.recipe = recipe
                    
                    let formatter = IngredientFormatter(recipe: recipe)
                    
                    self.ingredientFormatter = formatter
                    self.currentRecipeIngredients = formatter.ingredients
                    self.currentRecipeServings = formatter.servings
                }
                
                self.isLoading = false
            }
        }
    }
    
    // MARK: - Make HTTP Request
    private func makeHTTPRequest(withURL url: URL, completion: @escaping (FSResponse?, Error?) -> Void) {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let err = error {
                print(err) // Remove
                return completion(nil, err)
            }
            
            if let safeData = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let decodedData = try decoder.decode(FSResponse.self, from: safeData)
                    completion(decodedData, nil)
                } catch {
                    print(error) // Remove
                    completion(nil, error)
                }
            }
        })
        
        task.resume()
    }
}
