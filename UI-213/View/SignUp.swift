//
//  SignUp.swift
//  UI-213
//
//  Created by にゃんにゃん丸 on 2021/05/30.
//

import SwiftUI



struct SignUp: View {
    
    @State var text = ""
    @State var pass = ""
    
    @State var confirmPass = ""
    var body: some View {
        VStack{
            
            Text("Sigin Up")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("dark"))
                .kerning(1.3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("User name")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                
                TextField("Enter Your Name", text: $text)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
            })
            .padding(.top,5)
            
            Divider()
            
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("Password")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                
                SecureField("Enter Password", text: $pass)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
            })
            .padding(.top,15)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("ConFirm")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                
                SecureField("Confirm Password", text: $confirmPass)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
            })
            .padding(.top,15)
            
            Divider()
            
            
            
        
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "chevron.right")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("dark"))
                    .clipShape(Circle())
                    .shadow(color: Color("lb").opacity(0.5), radius: 5, x: 0, y: 0)
                            
            })
           
            .padding(.top,5)
            
            
            
        }
        .padding()
    }
}




struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
