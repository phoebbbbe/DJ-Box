//
//  Title.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/6/14.
//

import SwiftUI

struct Title: View {
    let iconName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .imageScale(.large)
                .foregroundColor(.white)
            Text(title)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(iconName: "film.stack",title: "Movie Posts")
    }
}
