//
//  Home.swift
//  UI-213
//
//  Created by にゃんにゃん丸 on 2021/05/30.
//

import SwiftUI

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right:0)
        
        
        
    }
}

struct Home: View {
    @State var MaxHegith : CGFloat = 0
    @State var show = false
    var body: some View {
        VStack{
            
            
            GeometryReader{proxy -> AnyView in
                
                
                let hegith = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if MaxHegith == 0{
                        
                        MaxHegith = hegith
                    }
                }
                
                return AnyView(
                
                    ZStack{
                        
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: getRect().width / 2, y: -hegith / 1.3)
                        
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: -getRect().width / 2, y: -hegith / 1.6)
                        
                        Circle()
                            .fill(Color("lb"))
                            .offset( y: -hegith / 1.3)
                            .rotationEffect(.init(degrees: -5))
                        
                    }
                
                )
            }
            .frame(height: getRect().width)
            
            
            ZStack{
                
                if show{
                    SignUp()
                        .transition(.move(edge: .trailing))
                    
            
                }
                else{
                    
                    Login()
                        .transition(.move(edge: .trailing))
                }
                
            }
            .padding(.top,-MaxHegith / (getRect().height < 750 ? 1.5 : 1.6))
            .frame(maxHeight: .infinity,alignment: .top)
            
            
            
        }
        .overlay(
        
            HStack{
                
                Text(show ? "Sign In" : "Sign Up")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Button(action: {
                    
                    withAnimation{
                        
                        show.toggle()
                    }
                    
                }, label: {
                    Text(show ?  "New Member" : "Already Account?")
                        .foregroundColor(.blue)
                })
                
            }
            .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
            
            ,alignment: .bottom
        
        )
        .background(
        
            HStack{
                
                Circle()
                    .fill(Color("lb"))
                    .frame(width: 70, height: 70)
                    .offset(x: -30,y:getRect().height < 750 ? 10 : 0)
                
                Spacer()
                
                
                Circle()
                    .fill(Color("dark"))
                    .frame(width: 110, height: 110)
                    .offset(x: 40, y: 25)
                
                
                
                
            }
            .offset(y: getSafeArea().bottom + 30)
            ,alignment: .bottom
        
        
        )
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
