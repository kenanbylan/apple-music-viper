//  Result.swift
//  musicViper
//  Created by Kenan Baylan on 30.05.2023.



import Foundation

public enum Result<Value> {
    case succes(Value)
    case error(Error)
}
