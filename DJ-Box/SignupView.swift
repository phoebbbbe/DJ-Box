//
//  SignupView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct SignupView: View {
    var body: some View {
        ZStack{
            Text("Sign up now")
                .fontWeight(.semibold)
                .font(.largeTitle)
            Text("Sign up")
                .fontWeight(.medium)
                .font(.title3)
                .frame(width: 74.93, alignment: .topLeading)
                .padding(.vertical, 13)
                .padding(.leading, 136)
                .padding(.trailing, 135)
                .frame(width: 346, height: 50)
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.66, green: 0.96, blue: 0.71), Color(red: 0.80, green: 0.97, blue: 0.52), Color(red: 0.84, green: 0.98, blue: 0.47), Color(red: 0.66, green: 0.96, blue: 0.71)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15)
                .frame(width: 346, height: 50)
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .frame(width: 329.26, height: 31)
                    .padding(.leading, 10)
                    .frame(width: 339, height: 31)
                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .cornerRadius(8)
                    .offset(x: -14, y: -455.50)
                    .frame(width: 339, height: 31)
                
                Text("test@gmail.com")
                    .fontWeight(.medium)
                    .font(.caption2)
                    .offset(x: -128.50, y: -457)
                
                Text("Email")
                    .fontWeight(.medium)
                    .font(.subheadline)
                    .offset(x: -153.50, y: -487.50)
            }
            .frame(width: 339, height: 56)
            
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                        .frame(width: 152, height: 29.78)
                        .offset(x: -23, y: -429)
                        .frame(width: 152, height: 29.78)
                        .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                        .cornerRadius(4.33)
                    
                    Text("@username")
                        .fontWeight(.medium)
                        .font(.caption2)
                        .frame(width: 74, height: 23, alignment: .topLeading)
                        .offset(x: -35, y: -424.39)
                }
                .offset(x: -23, y: -394.50)
                .frame(width: 152, height: 29.78)
                
                Text("Username")
                    .fontWeight(.medium)
                    .font(.subheadline)
                    .frame(width: 91, height: 35, alignment: .topLeading)
                    .offset(x: -51.50, y: -414.89)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.64, green: 0.64, blue: 0.64))
                    .offset(x: -85.69, y: -395.39)
                    .frame(width: 8.94, height: 10)
            }
            .frame(width: 152, height: 52.78)
            
            ZStack {
                Text("First Name")
                    .fontWeight(.medium)
                    .font(.subheadline)
                    .offset(x: -144, y: -355)
                
                Text("Last Name")
                    .fontWeight(.medium)
                    .font(.subheadline)
                    .offset(x: 32.50, y: -355)
                
                ZStack {
                    HStack(spacing: 17) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                            .frame(width: 154, height: 31)
                            .padding(.horizontal, 7)
                            .frame(width: 168, height: 31)
                            .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                            .cornerRadius(8)
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                            .frame(width: 154, height: 31)
                            .padding(.trailing, 14)
                            .frame(width: 168, height: 31)
                            .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                            .cornerRadius(8)
                    }
                    .offset(x: -15, y: -355.50)
                    .frame(width: 353, height: 31)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                        .offset(x: 79.50, y: -358.50)
                        .frame(width: 168, height: 31)
                }
                .offset(x: -14, y: -325.50)
                .frame(width: 355, height: 34)
            }
            .frame(width: 355, height: 55)
        }
    }
        
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
