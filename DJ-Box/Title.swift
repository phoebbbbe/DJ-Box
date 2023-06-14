//
//  Title.swift
//  MovieChat
//
//  Created by 林寧 on 2023/5/9.
//

import SwiftUI

struct Title: View {
    let iconName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(title)
                .font(.title)
                .fontWeight(.black)
        }
        .padding()
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(iconName: "film.stack",title: "Movie Posts")
    }
}
