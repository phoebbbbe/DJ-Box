//
//  FilterView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct FilterView: View {
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 23/255, green: 22/255, blue: 46/255)
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("場景")
                    Text("時長")
                    Text("情緒")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 4)
                .padding(.vertical)
            }
            .navigationTitle("filter")
            .toolbar {
                Button(action: {
                    print("show menu")
                }) {
                    Label("Toggle Sidebar", systemImage: "line.3.horizontal.circle.fill")
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
