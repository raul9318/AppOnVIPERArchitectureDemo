//
//  AddFriendViewController.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var agePickerView: UIPickerView!
    @IBAction func saveButtonAction(_ sender: Any) {
        self.saveConfirmed()
    }
    @IBAction func cancelButtonAction(_ sender: Any) {
        presenter?.dismissModule()
    }
    
    var name: String {
        return nameTextField.text ?? ""
    }
    
    var age: Int {
        let row = agePickerView.selectedRow(inComponent: 0)
        let age: Int = row + 1
        return age
    }
    
    var presenter: AddFriendModuleInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        agePickerView.delegate = self
        agePickerView.dataSource = self
        agePickerView.selectRow(17, inComponent: 0, animated: false)
    }

    fileprivate func saveConfirmed() {
        presenter?.saveFriendWith(name: name, age: age)
    }
}

// MARK: - AddFriendViewInterface
extension AddFriendViewController: AddFriendViewInterface {
    func showSaveDoneAlert() {
        // TODO: This must be in presentor
        let alertC = UIAlertController(title: nil, message: "Новый друг добавлен в список", preferredStyle: .alert)
        alertC.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            self.presenter?.dismissModule()
        }))
        present(alertC, animated: true, completion: nil)
    }
    
    func showNameErrorAlert() {
        // TODO: This must be in presentor
        let alertC = UIAlertController(title: "Ошибка", message: "Заполните поле Имя", preferredStyle: .alert)
        alertC.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        present(alertC, animated: true, completion: nil)
    }
}

// MARK: - Age picker view delegate and data source
extension AddFriendViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 120
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let age = row + 1
        return "\(age)"
    }
}
