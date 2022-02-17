//
//  OffsetModifire.swift
//  UI-468
//
//  Created by nyannyan0328 on 2022/02/17.
//

import SwiftUI

struct OffsetModifire: ViewModifier {
    
    @Binding var rect : CGRect
    func body(content: Content) -> some View {
        content
            .overlay {
                
                
                GeometryReader{proxy in
                    
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("SCROLL")))
                        .onPreferenceChange(OffsetKey.self) { rect in
                            self.rect = rect
                        }
                    
                }
                
                
            }
    }
}

struct OffsetKey : PreferenceKey{
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        
        value = nextValue()
        
    }
    
    
}
