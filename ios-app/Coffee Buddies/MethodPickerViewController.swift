import UIKit

let METHOD_RANDOM_INDEX = 0
let METHOD_TABLE_INDEX = 1
let METHOD_INTERN_EXTERN_INDEX = 2

class MethodPickerViewController : NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let dataModel: [Method] = [.Tables, .Random, .InternExtern]
    private var currentSelection: Method = .Random
    
    func getSelectedMethod() -> Method {
        return currentSelection
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataModel.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataModel[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSelection = dataModel[row]
    }
    
}

enum Method : String {
    case Random = "Random"
    case Tables = "Tables"
    case InternExtern = "Intern + Extern"
}
