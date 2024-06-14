//
//  NoteViewContoller.swift
//  Note
//
//  Created by Jinyoung Leem on 4/1/24.
//

import UIKit

class NoteViewContoller: UIViewController {
    var note: Note!
    
    @IBOutlet var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note.contents
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        note.contents = textView.text
        
        NoteManager.main.save(note: note)
    }
    
}
