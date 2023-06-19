//
//  SongListItem.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/6/14.
//

import SwiftUI

struct SongListItem: View {
    let listItem: SongList
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                           Color(red: 0.66, green: 0.96, blue: 0.71),
                           Color(red: 0.80, green: 0.97, blue: 0.52),
                           Color(red: 0.84, green: 0.98, blue: 0.47),
                           Color(red: 0.66, green: 0.96, blue: 0.71)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 100, height: 100)
                .shadow(radius: 5)
            
            ZStack {
                Image(listItem.item)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                
                Text(listItem.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .offset(x:0, y:65)
            }
        }
    }
}

struct SongListItem_Previews: PreviewProvider {
    static var previews: some View {
        SongListItem(listItem: SongList())
    }
}






