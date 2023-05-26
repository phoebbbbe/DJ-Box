//
//  LoginView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
            .fill(Color.black)
            .offset(x: 0.50, y: 395.50)
            .frame(width: 134, height: 5)

            VStack(spacing: 24.28) {
                    HStack(spacing: 211.67) {
                                Text("9:41")
                                .fontWeight(.semibold)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .frame(width: 54, height: 20, alignment: .top)
                                .lineSpacing(20)
                                .padding(.top, 1)
                                .frame(width: 54, height: 21)
                                .cornerRadius(24)

                                HStack(spacing: 5.03) {
                                                RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.white)
                                                .frame(width: 17, height: 10.67)

                                                RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.white)
                                                .frame(width: 15.27, height: 10.97)

                                                RoundedRectangle(cornerRadius: 8)
                                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .frame(width: 24.33, height: 11.33)
                                }
                                .frame(width: 66.66, height: 11.34)
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 19)
                    .padding(.top, 12)
                    .padding(.bottom, 11)
                    .frame(width: 375, height: 44)

                    ZStack {
                    Group {
                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .frame(width: 433.20, height: 436.80)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 0.09, green: 0.09, blue: 0.18))
                        .frame(width: 433.20, height: 436.80)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: -67.27, y: 51.58)
                        .frame(width: 31.69, height: 41.66)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: -43.54, y: 51.28)
                        .frame(width: 17.72, height: 42.25)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: -1.39, y: 51.58)
                        .frame(width: 31.69, height: 41.66)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: 32.99, y: 51.58)
                        .frame(width: 31.69, height: 41.66)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: 66.94, y: 51.62)
                        .frame(width: 30.48, height: 43.12)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: -73.77, y: 89.26)
                        .frame(width: 9.49, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: -59.48, y: 89.26)
                        .frame(width: 9.49, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: -45.48, y: 89.26)
                        .frame(width: 9.49, height: 8.02)
                    }
                    Group {
                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: -31.18, y: 89.26)
                        .frame(width: 9.49, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: -12.67, y: 89.26)
                        .frame(width: 8.48, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: 0.32, y: 89.26)
                        .frame(width: 9.24, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: 14.45, y: 89.26)
                        .frame(width: 8.86, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: 34.10, y: 89.26)
                        .frame(width: 9.49, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: 48.07, y: 89.26)
                        .frame(width: 8.86, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: 62.07, y: 89.26)
                        .frame(width: 11.45, height: 8.02)

                        RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .offset(x: 75.23, y: 89.26)
                        .frame(width: 8.48, height: 8.02)

                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                            .fill(Color.black)
                            .offset(x: -203.04, y: -169.19)
                            .frame(width: 99.64, height: 100.46)

                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                .fill(Color.black)
                                .offset(x: -130.83, y: -96.39)
                                .frame(width: 99.64, height: 100.46)

                                RoundedRectangle(cornerRadius: 8)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.83, green: 0.98, blue: 0.47), Color(red: 0.83, green: 0.98, blue: 0.47), Color(red: 0.83, green: 0.98, blue: 0.48), Color(red: 0.83, green: 0.98, blue: 0.48), Color(red: 0.83, green: 0.98, blue: 0.48), Color(red: 0.83, green: 0.98, blue: 0.48), Color(red: 0.83, green: 0.98, blue: 0.49), Color(red: 0.82, green: 0.98, blue: 0.49), Color(red: 0.82, green: 0.97, blue: 0.49), Color(red: 0.82, green: 0.97, blue: 0.50), Color(red: 0.82, green: 0.97, blue: 0.50), Color(red: 0.82, green: 0.97, blue: 0.50), Color(red: 0.81, green: 0.97, blue: 0.50), Color(red: 0.81, green: 0.97, blue: 0.51), Color(red: 0.81, green: 0.97, blue: 0.51), Color(red: 0.81, green: 0.97, blue: 0.51), Color(red: 0.81, green: 0.97, blue: 0.51), Color(red: 0.80, green: 0.97, blue: 0.52), Color(red: 0.80, green: 0.97, blue: 0.52), Color(red: 0.80, green: 0.97, blue: 0.52), Color(red: 0.80, green: 0.97, blue: 0.53), Color(red: 0.80, green: 0.97, blue: 0.53), Color(red: 0.79, green: 0.97, blue: 0.53), Color(red: 0.79, green: 0.97, blue: 0.53), Color(red: 0.79, green: 0.97, blue: 0.54), Color(red: 0.79, green: 0.97, blue: 0.54), Color(red: 0.79, green: 0.97, blue: 0.54), Color(red: 0.78, green: 0.97, blue: 0.54), Color(red: 0.78, green: 0.97, blue: 0.55), Color(red: 0.78, green: 0.97, blue: 0.55), Color(red: 0.78, green: 0.97, blue: 0.55), Color(red: 0.78, green: 0.97, blue: 0.55), Color(red: 0.77, green: 0.97, blue: 0.56), Color(red: 0.77, green: 0.97, blue: 0.56), Color(red: 0.77, green: 0.97, blue: 0.56), Color(red: 0.77, green: 0.97, blue: 0.56), Color(red: 0.77, green: 0.97, blue: 0.57), Color(red: 0.76, green: 0.97, blue: 0.57), Color(red: 0.76, green: 0.97, blue: 0.57), Color(red: 0.76, green: 0.97, blue: 0.57), Color(red: 0.76, green: 0.97, blue: 0.58), Color(red: 0.76, green: 0.97, blue: 0.58), Color(red: 0.76, green: 0.97, blue: 0.58), Color(red: 0.75, green: 0.97, blue: 0.58), Color(red: 0.75, green: 0.97, blue: 0.59), Color(red: 0.75, green: 0.97, blue: 0.59), Color(red: 0.75, green: 0.97, blue: 0.59), Color(red: 0.75, green: 0.97, blue: 0.60), Color(red: 0.74, green: 0.97, blue: 0.60), Color(red: 0.74, green: 0.97, blue: 0.60), Color(red: 0.74, green: 0.97, blue: 0.60), Color(red: 0.74, green: 0.97, blue: 0.61), Color(red: 0.74, green: 0.97, blue: 0.61), Color(red: 0.73, green: 0.97, blue: 0.61), Color(red: 0.73, green: 0.97, blue: 0.61), Color(red: 0.73, green: 0.97, blue: 0.62), Color(red: 0.73, green: 0.97, blue: 0.62), Color(red: 0.72, green: 0.97, blue: 0.62), Color(red: 0.72, green: 0.97, blue: 0.63), Color(red: 0.72, green: 0.97, blue: 0.63), Color(red: 0.72, green: 0.97, blue: 0.63), Color(red: 0.72, green: 0.97, blue: 0.63), Color(red: 0.71, green: 0.97, blue: 0.64), Color(red: 0.71, green: 0.97, blue: 0.64), Color(red: 0.71, green: 0.97, blue: 0.64), Color(red: 0.71, green: 0.96, blue: 0.65), Color(red: 0.71, green: 0.96, blue: 0.65), Color(red: 0.70, green: 0.96, blue: 0.65), Color(red: 0.70, green: 0.96, blue: 0.65), Color(red: 0.70, green: 0.96, blue: 0.66), Color(red: 0.70, green: 0.96, blue: 0.66), Color(red: 0.70, green: 0.96, blue: 0.66), Color(red: 0.69, green: 0.96, blue: 0.66), Color(red: 0.69, green: 0.96, blue: 0.67), Color(red: 0.69, green: 0.96, blue: 0.67), Color(red: 0.69, green: 0.96, blue: 0.67), Color(red: 0.69, green: 0.96, blue: 0.68), Color(red: 0.68, green: 0.96, blue: 0.68), Color(red: 0.68, green: 0.96, blue: 0.68), Color(red: 0.68, green: 0.96, blue: 0.68), Color(red: 0.68, green: 0.96, blue: 0.69), Color(red: 0.68, green: 0.96, blue: 0.69), Color(red: 0.67, green: 0.96, blue: 0.69), Color(red: 0.67, green: 0.96, blue: 0.70), Color(red: 0.67, green: 0.96, blue: 0.70), Color(red: 0.67, green: 0.96, blue: 0.70), Color(red: 0.66, green: 0.96, blue: 0.70), Color(red: 0.66, green: 0.96, blue: 0.71), Color(red: 0.66, green: 0.96, blue: 0.71)]), startPoint: .topTrailing, endPoint: .bottomLeading))
                                .offset(x: -130.83, y: -96.39)
                                .frame(width: 99.64, height: 100.46)
                            }
                            .offset(x: -203.04, y: -169.19)
                            .frame(width: 99.64, height: 100.46)
                        }
                        .offset(x: 0.15, y: -35.38)
                        .frame(width: 99.64, height: 100.46)
                    }
                    }
                    .frame(maxWidth: 433.20, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                    .frame(width: 361, height: 364)
                    .background(Color.white)

                    ZStack {
                            RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                            .frame(width: 244, height: 39)
                            .frame(width: 244, height: 39)
                            .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                            .cornerRadius(8)
                            .offset(x: -80, y: -483)
                            .frame(width: 244, height: 39)

                            RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.64, green: 0.64, blue: 0.64))
                            .offset(x: -179.70, y: -482.39)
                            .frame(width: 13.51, height: 11.86)
                    }
                    .frame(width: 244, height: 39)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .frame(width: 244, height: 39)
                    .frame(width: 244, height: 39)
                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .cornerRadius(8)
                    .frame(width: 244, height: 39)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.64, green: 0.64, blue: 0.64))
                    .frame(width: 18.31, height: 18.31)

                    HStack(spacing: 8) {
                                Text("Login")
                                .fontWeight(.medium)
                                .font(.body)
                                .lineSpacing(22)

                                RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .frame(width: 24, height: 24)
                    }
                    .padding(16)
                    .frame(width: 248, height: 44)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.66, green: 0.96, blue: 0.71), Color(red: 0.80, green: 0.97, blue: 0.52), Color(red: 0.84, green: 0.98, blue: 0.47), Color(red: 0.66, green: 0.96, blue: 0.71)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(8)

                    Text("Haven't account?             Sign up now.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .frame(width: 343, height: 37)
                    .lineSpacing(20)
            }
            .padding(.leading, 6)
            .padding(.top, 15)
            .padding(.bottom, 83)
            .offset(x: -3, y: -6.50)
            .frame(width: 381, height: 829)
            .background(Color(red: 0.09, green: 0.09, blue: 0.18))

            Text("Username")
            .font(.subheadline)
            .frame(width: 343, height: 22, alignment: .leading)
            .lineSpacing(20)
            .offset(x: 48, y: 19)

            Text("Password")
            .font(.subheadline)
            .frame(width: 345, height: 24, alignment: .leading)
            .lineSpacing(20)
            .offset(x: 48, y: 114)
        }
        .frame(width: 375, height: 812)
        .background(Color.white)
        .cornerRadius(44)
        .overlay(RoundedRectangle(cornerRadius: 44).stroke(Color.white, lineWidth: 1))
        .shadow(radius: 15, y: 10)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
