//
//  SettingView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/19.
//

import SwiftUI

struct SettingView: View {
    @State private var isNotificationEnabled = true
    @State private var showAlert = false
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 23/255, green: 22/255, blue: 46/255)
                    .ignoresSafeArea()
                Form{
                    
                    Section(header: Text("顯示設定")){
                        Toggle(isOn: .constant(true),
                               label: {
                            Text("通知")
                        })
                        Toggle(isOn: .constant(true),
                               label: {
                            Text("護眼模式")
                        })
                        
                    }
                    Section(header: Text("關於")){
                        HStack{
                            Text("版本")
                            Spacer()
                            Text("1.0")
                                .foregroundColor(.gray)
                        }
                        HStack{
                            Text("開發團隊")
                            Spacer()
                            Text("DJ Box")
                                .foregroundColor(.gray)
                        }
                        
                        Text("問題回報")
                    }
                }
                .navigationTitle("設定")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            HStack{
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                            
                        })
                    }
                }
            }
           
        }
       
    }
   func getAlert() -> Alert {
            if isNotificationEnabled {
                return Alert(
                    title: Text("通知已開啟"),
                    message: Text("您將收到通知訊息。"),
                    dismissButton: .default(Text("確定"))
                )
            } else {
                return Alert(
                    title: Text("通知已關閉"),
                    message: Text("您將不再收到通知訊息。"),
                    dismissButton: .default(Text("確定"))
                )
            }
        }
    
    }


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
