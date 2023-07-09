//
//  BuyNow.swift
//  meraHoarding
//
//  Created by Mac CSE 12 on 27/04/23.
//

import SwiftUI


//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by Nick Sarno on 11/28/21.
//



struct BuyNow: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
            ZStack {
                Image("WhatsApp Image 2023-04-27 at 20.29.49")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                backButton
                    .position(x: 50, y : 60)
                // Add other views on top of the background image here
            }
            
        }
    private var backButton: some View {
        Button {
            vm.showBuy = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }

    }
}

struct BuyNow_Previews: PreviewProvider {
    static var previews: some View {
        BuyNow()
            
    }
}

