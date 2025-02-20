//
//  LocationDetailsView.swift
//  'Za Hunter
//
//  Created by Tessa Murray on 2/19/25.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    let mapItem: MKMapItem
    var body: some View {
        let address = mapItem.placemark.subThoroughfare! + "" +
        mapItem.placemark.thoroughfare! + "\n" +
        mapItem.placemark.locality! + ", " +
        mapItem.placemark.administrativeArea! + " " +
        mapItem.placemark.postalCode!
        VStack {
            Text(mapItem.placemark.name!).font(.title).bold()
            Text(address).padding()
            Text(mapItem.phoneNumber!).padding()
            if let url = mapItem.url {
                Link(destination: url, label: {
                    Text("Website").padding()
                })
            }
            Button(action: {
                let latitude = mapItem.placemark.coordinate.latitude
                let longitude = mapItem.placemark.coordinate.longitude
                let url = URL(string: "maps://?saddr=&daddr=\(latitude), \(longitude)")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
            }, label: {
                Text("Directions")
            })
            Spacer()
        }
    }
}

#Preview {
    LocationDetailsView(mapItem: MKMapItem())
}
