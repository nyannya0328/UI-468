//
//  Home.swift
//  UI-468
//
//  Created by nyannyan0328 on 2022/02/17.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            
            
            Text("HISTORICAL LETTERS")
                .font(.largeTitle.weight(.black))
                .foregroundColor(.black)
                .padding(.top,20)
                .padding(.bottom,10)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ForEach(letters){letter in
                    
                    
                    LetterCardView(letter: letter)
                    
                    
                    
                }
                .padding(.horizontal)
                .padding(.top)
                
            }
            .coordinateSpace(name: "SCROLL")
            
            
            
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("BG"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct LetterCardView : View{
    
    var letter : Letter
    
    @State var rect : CGRect = .zero
    
    var body: some View{
        
        VStack(spacing:10){
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                
                Text(letter.date)
                    .font(.title.weight(.bold))
                
                Text(letter.title)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            
            
            
            Divider()
                .padding(.vertical,20)
            
            
            
            Text("the pitcher's mound toward the catcher to begin each play, with the goal of retiring a batter, who attempts to either make contact with the pitched ball or draw a walk. In the numbering system used to record defensive plays, the pitcher is assigned the number 1. The pitcher is often considered the most important player on the defensive side of the game, and as such is situated at the right end of the defensive spectrum. There are many different types of pitchers, such as the starting pitcher, relief pitcher, middle reliever, lefty specialist, setup man, and the closer.")
                .lineSpacing(12)
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
            
            
            
            
        }
        .padding()
        .background(Color.white.cornerRadius(10))
        .mask({
            
            Rectangle()
                .padding(.top,rect.minY < (getIndex() * 50) ? -(rect.minY - (getIndex() * 50)) : 0)
        })
       
        .offset(y: rect.minY < (getIndex() * 50) ? (rect.minY - (getIndex() * 50)) : 0)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        .overlay(alignment: .top) {
            
            scrollLeterShape()
        }
        .offset(y: rect.minY < (getIndex() * 50) ? -(rect.minY - (getIndex() * 50)) : 0)
       
        .modifier(OffsetModifire(rect: $rect))
        .background(
        
        Text("No Letters")
            .font(.title)
            .foregroundColor(.red)
            .opacity(isLast() ? 1 : 0)
            .offset(y: rect.minY < 0 ? -rect.minY : 0)
        
        
        
        
        
        )
        .padding(.bottom,isLast() ? rect.height * 1.5 : 0)
    }
    
    @ViewBuilder
    func scrollLeterShape()->some View{
        
        Rectangle()
            .fill(.white)
            .frame(height: 30 * getProgress())
            .overlay(alignment: .top) {
                
                
                
                Rectangle()
                    .fill(
                    
                    
                        LinearGradient(colors: [
                        
                        
                        
                            .black.opacity(0.1),
                            .clear,
                            .black.opacity(0.05),
                            .black.opacity(0.05),
                            
                        
                        
                        
                        
                        ], startPoint: .top, endPoint: .bottom)
                    
                    
                    )
                    .cornerRadius(6)
                    .shadow(color: .black.opacity(0.01), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.01), radius: 5, x: -5, y: -5)
                    
                
            }
        
        
    
        
        
        
    }
    
    func isLast()->Bool{
        
        return letters.last == letter
        
    }
    
    func getIndex()->CGFloat{
        
        let index = letters.firstIndex { letter in
            
            return self.letter.id == letter.id
        } ?? 0
        
        return CGFloat(index)
        
    }
    
    func getProgress()->CGFloat{
        
        let progress = -rect.minY / rect.height
        
        
        return (progress > 0 ? (progress < 1 ? progress : 1) : 0)
    }
}


