//
//  AddFoodView.swift
//  icalories
//
//  Created by Henrique wagner on 01/05/22.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form{
            Section{
                TextField("Nome da comida", text: $name)
                
                VStack{
                    Text("Calorias: \(Int(calories))")
                    Slider(value: $calories, in: 0...5000,
                    step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Criar"){
                        DataController().addFood(name: name, calories: calories, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
