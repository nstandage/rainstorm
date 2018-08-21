//: Playground - noun: a place where people can play

import Foundation

// Once the json file is in the Resources, we get the URL of file so we can use it.

guard let url = Bundle.main.url(forResource: "darksky", withExtension: "json") else {
    fatalError()
}


// We then try and get the data out of the url

guard let data = try? Data(contentsOf: url) else {
    fatalError()
}

let decoder = JSONDecoder()


do {
    let response = try decoder.decode(DarkSkyResponse.self, from: data)
    print(response.currently)
    print(response.daily.data.count)
} catch {
    print(error)
}

