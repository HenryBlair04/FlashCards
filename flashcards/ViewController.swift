//
//  ViewController.swift
//  flashcards
//
//  Created by iD Student on 7/18/17.
//  Copyright © 2017 iD Blair. All rights reserved.
//

import UIKit
//expand and add to view controller//
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var questionTextView: UITextView!

    @IBOutlet weak var answerPickerView: UIPickerView!
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answerPickerView.dataSource = self;
        answerPickerView.delegate = self;
        
        setupCardUI ()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupCardUI () { //this updates question number, question text and answers/options //
        answerPickerView.reloadAllComponents ()
        questionTextView.text = CardCollection.instance.currentCard.question
        //what this function does is displays the current question in the question text view which we just put on this viewcontroller. This allows us to connect the controller to the view.The CardCollection class is connected with instance as i explained in the swift main thing and this allows it to display the current card and its question in the question text view//
        questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1) / \(CardCollection.instance.cards.count)"
    }
    
    public func numberOfComponents(in pickerView:UIPickerView) -> Int {
        return 1;
        //one column to chose from so returning one
        
    }

    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }

    // Pickerview delegates
    // returns text of option at a given row.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row];
    }
}



