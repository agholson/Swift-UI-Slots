//
//  ContentView.swift
//  Challenge13-SwiftUI-Slots
//
//  Created by Andrew Gholson on 7/13/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    // Define array to hold our Images
    let imageList = ["apple", "cherry", "star"]
    
    // We track state of these by randomly assigning one of the array elements to each image
    @State var image1 = "apple"
    @State var image2 = "cherry"
    @State var image3 = "star"
    
    // Tracks the current credits
    @State var credits = 1000
    
    // MARK: UISwift Code
    var body: some View {
        VStack {
            
            Text("SwiftUI Slots!")
                .font(.title)
                .padding()
            
            Spacer()
            
            Text("Credits: \(credits)")
                
            
            Spacer()
            
            HStack {
                Image(image1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Image(image2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(image3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding()
            
            Spacer()
            
            Button(action: {
                // We spin the roulette here in our closure
                spin()
            }, label: {
                Text("Spin")
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                                    .background(Color.red.cornerRadius(10)))
                    
            })
            
            Spacer()
        
        }
        
    }
    
    // MARK: Methods
    func spin() {
        // Generate random images on each of the lines here, based on our list of images
        image1 = imageList[Int.random(in: 0...2)]
        image2 = imageList[Int.random(in: 0...2)]
        image3 = imageList[Int.random(in: 0...2)]
        
        // Setup a variable to track whether/ not the images match
        var imageMatch = false
        
        //Loop through our images
        for image in imageList {
            // See if the current image equals all three of the the images
            if image == image1 {
                if image == image2 {
                    if image == image3 {
                        // Only if all three images match to we set this to true
                        imageMatch = true
                    }
                }
            }
        }
        
        // Update the credits here
        if imageMatch {
            credits += 45
        } else {
            credits -= 5
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
