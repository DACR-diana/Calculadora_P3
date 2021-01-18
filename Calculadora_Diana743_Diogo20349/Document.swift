//
//  Document.swift
//  Calculadora_Diana743_Diogo20349
//
//  Created by ISTEC on 17/01/2021.
//  Copyright © 2021 Diana. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

