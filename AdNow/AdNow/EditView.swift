//
//  EditView.swift
//  Bucketlist
//
//  Created by Paul Hudson on 09/12/2021.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    var location: Location
    var onSave: (Location) -> Void
    
    @State private var name: String
    @State private var description: String
    @State private var cityName: String
    //@State private var loadingState = LoadingState.loading
    // @State private var pages = [Page]()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                    TextField("City Name", text: $cityName)
                    
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.cityName = cityName
                    newLocation.name = name
                    newLocation.description = description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
        
        init(location: Location, onSave: @escaping (Location) -> Void) {
            self.location = location
            self.onSave = onSave
            _name = State(initialValue: location.name)
            _description = State(initialValue: location.description)
            _cityName = State(initialValue: location.cityName)
            
        }
        

        
        struct EditView_Previews: PreviewProvider {
            static var previews: some View {
                EditView(location: Location.example) { _ in }
            }
        }
    }

