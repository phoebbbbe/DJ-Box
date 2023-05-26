//
//  HomepageView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct HomepageView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
            .fill(Color.black)
            .offset(x: 0.50, y: 395.50)
            .frame(width: 134, height: 5)

            ZStack {
            Group {
                    Text("♡")
                    .fontWeight(.medium)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width: 95, height: 49)
                    .lineSpacing(22)
                    .padding(16)
                    .offset(x: 7.50, y: 7.50)
                    .frame(width: 120, height: 120)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.66, green: 0.96, blue: 0.71), Color(red: 0.80, green: 0.97, blue: 0.52), Color(red: 0.84, green: 0.98, blue: 0.47), Color(red: 0.66, green: 0.96, blue: 0.71)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(60)
                    .shadow(radius: 4, y: 4)

                    RoundedRectangle(cornerRadius: 40)
                    .fill(Color(red: 0.84, green: 0.98, blue: 0.47))
                    .offset(x: 5.50, y: -126.50)
                    .frame(width: 100, height: 100)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .offset(x: -36.50, y: -98.50)
                    .frame(width: 24, height: 24)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black)
                    .offset(x: 38.62, y: -103.41)
                    .frame(width: 12.24, height: 16.18)

                    Text("Your mix\n#Jazz")
                    .fontWeight(.heavy)
                    .font(.title3)
                    .frame(width: 114, height: 53, alignment: .leading)
                    .lineSpacing(22)
                    .offset(x: 24.50, y: -125)

                    RoundedRectangle(cornerRadius: 40)
                    .fill(Color(red: 0.84, green: 0.98, blue: 0.47))
                    .offset(x: -114.50, y: 7.50)
                    .frame(width: 100, height: 100)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black)
                    .offset(x: -83.38, y: 28.59)
                    .frame(width: 12.24, height: 16.18)

                    Text("Your mix\n#Lofi")
                    .fontWeight(.heavy)
                    .font(.title3)
                    .frame(width: 114, height: 53, alignment: .leading)
                    .lineSpacing(22)
                    .offset(x: -95.50, y: 9)

                    RoundedRectangle(cornerRadius: 40)
                    .fill(Color(red: 0.84, green: 0.98, blue: 0.47))
                    .offset(x: 5.50, y: 136.50)
                    .frame(width: 100, height: 100)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black)
                    .offset(x: 38.62, y: 157.59)
                    .frame(width: 12.24, height: 16.18)
            }
            Group {
                    Text("Your mix\n#五月天")
                    .fontWeight(.heavy)
                    .frame(width: 114, height: 53, alignment: .leading)
                    .lineSpacing(22)
                    .offset(x: 24.50, y: 138)

                    RoundedRectangle(cornerRadius: 40)
                    .fill(Color(red: 0.84, green: 0.98, blue: 0.47))
                    .offset(x: 125.50, y: 7.50)
                    .frame(width: 100, height: 100)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black)
                    .offset(x: 156.62, y: 28.59)
                    .frame(width: 12.24, height: 16.18)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .offset(x: 143.50, y: 27.50)
                    .frame(width: 24, height: 24)
            }
            }
            .offset(x: -3, y: -6.50)
            .frame(width: 381, height: 829)
            .background(Color(red: 0.09, green: 0.09, blue: 0.18))

            Text("Your mix\n#R&B")
            .fontWeight(.heavy)
            .font(.title3)
            .frame(width: 114, height: 53, alignment: .leading)
            .lineSpacing(22)
            .offset(x: 141.50, y: 2.50)
        }
        .frame(width: 375, height: 812)
        .background(Color.white)
        .cornerRadius(44)
        .overlay(RoundedRectangle(cornerRadius: 44).stroke(Color.white, lineWidth: 1))
        .shadow(radius: 15, y: 10)
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
