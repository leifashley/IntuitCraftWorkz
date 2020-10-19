//
//  AppLogger.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import Foundation


/// Simple logger wrapper so I didn't have to go podify and configure the logger
public protocol AppLogger {
    func debug(_ message: String)
    func warn(_ message: String)
    func error(_ message: String)
}

public class BasicLogger: AppLogger {
    
    public init() {}
    
    public func debug(_ message: String) {
        print("DEBUG: \(message)")
    }
    
    public func warn(_ message: String) {
        print("WARN: \(message)")
    }
    
    public func error(_ message: String) {
        print("ERROR: \(message)")
    }
    
    
}
