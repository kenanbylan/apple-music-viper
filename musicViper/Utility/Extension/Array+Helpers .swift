//
//  Array+Helpers .swift
//  musicViper
//
//  Created by Kenan Baylan on 2.06.2023.
//

import Foundation


public extension Array {
    
    struct IndexOutOfBoundsError: Error { }
    
    func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw IndexOutOfBoundsError()
        }
        return self[index]
    }
}
