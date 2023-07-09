//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Nick Sarno on 11/27/21.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let maxWidthForIpad: CGFloat = 700
    
    @State private var selectedPlace: Location?
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width:32,height:32)
            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                Button() {
                    let newLocation = Location(name: "", cityName: "", coordinates: CLLocationCoordinate2D(latitude: vm.mapRegion.center.latitude, longitude: vm.mapRegion.center.longitude), description: "", imageNames: ["rome-colosseum-1",
                        "rome-colosseum-2",
                        "rome-colosseum-3"])
                    vm.locations.append(newLocation)
                    selectedPlace = newLocation
                }label: {
                    Image(systemName: "plus")
                }
                .padding()
                .background(.blue.opacity(0.90))
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
                .padding(.trailing)
                .position(x:365, y: 675)
                Spacer()
               
                  //  locationsPreviewStack
                    
            }
        
            
            
                    }
        .sheet(item: $selectedPlace) { place in
                        EditView(location: place) { newLocation in
                            if let index = vm.locations.firstIndex(of: place){
                                vm.locations[index] = newLocation
                }
            }
            
        }
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
//    private var locationsPreviewStack: some View {
//        ZStack {
//            ForEach(vm.locations) { location in
//                if vm.mapLocation == location {
//                    LocationPreviewView(location: location)
//                        .shadow(color: Color.black.opacity(0.3), radius: 20)
//                        .padding()
//                        .frame(maxWidth: maxWidthForIpad)
//                        .frame(maxWidth: .infinity)
//                        .transition(.asymmetric(
//                            insertion: .move(edge: .trailing),
//                            removal: .move(edge: .leading)))
//                }
//            }
//        }
//    }
    
}
