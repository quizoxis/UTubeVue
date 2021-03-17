//
//  DateUtil.swift
//  UTubeVue
//
import Foundation

struct DateTimeUtil {
    
    static func formatDate(date value: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DATE_FORMAT
        
        let fmtString = dateFormatter.string(from: value)
        
        return fmtString
        
    }
    
    
}
