//
//  EditFoodView.swift
//  icalories
//
//  Created by Henrique wagner on 02/05/22.
//

import SwiftUI

struct EditFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var food : FetchedResults<Food> .Element
    
    
    
    
    
    var body: some View {
        Form{
            Section{
                TextField("\(food.name!)", text: $name)
                    .onAppear{
                        name = food.name!
                        calories = food.calories
                    }
                VStack{
                    Text("Calorias: \(Int(calories))")
                    Slider(value: $calories, in: 0...5000,
                           step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Editar"){
                        DataController().editFood(food: food, name: name, calories: calories, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
                
            }
        }
    }
}




