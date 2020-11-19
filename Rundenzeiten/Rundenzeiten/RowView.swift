//
//  LapRowView.swift
//  Rundenzeiten
//
//  Created by Simon Meier on 03.11.20.
//

import SwiftUI



struct RowView: View {
    let globalStart: Date
    let lapStart : Date

    var durationString: String {
        globalStart - lapStart
    }
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "bookmark")
                Text(durationString)
            }
            Text(lapStart,style: .time)
        }
    }
    
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(globalStart: <#Date#>, lapStart: <#Date?#>)
    }
}
