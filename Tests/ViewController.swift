import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var outletButton: UIButton!
    
    var email = false
    var password = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outletButton.isEnabled = false
        outletButton.alpha = 0.6
    }
    
    @IBAction func emailActionField(_ sender: Any) {
        print(email)
        if emailTextField.text != nil && emailTextField.text!.count > 0 {
            email = true
            print(email)
            if password == true && email == true {
                outletButton.isEnabled = true
                outletButton.alpha = 1
            }
        }
        else {
            email = false
            print(email)
            outletButton.isEnabled = false
            outletButton.alpha = 0.6
        }
    }
    
    @IBAction func passwordActionField(_ sender: Any) {
        if passwordTextField.text != nil && passwordTextField.text!.count > 0 {
            password = true
            if password == true && email == true {
                outletButton.isEnabled = true
                outletButton.alpha = 1
            }
        }
        else {
            password = false
            outletButton.isEnabled = false
            outletButton.alpha = 0.6
        }
    }
    
    @IBAction func actionButton(_ sender: Any) {
        let email2 = emailTextField.text
        let pass = passwordTextField.text
        if isValid(email2!, pass!) && pass!.count >= 6{
            performSegue(withIdentifier: "congratulationsVC", sender: self)
        }
        else {
            warningAlert("Внимание!", "Email должен быть валидным, а пароль – не меньше 6 символов, содержать как минимум одну цифру, одну букву в нижнем регистре и одну – в верхнем.")
        }
    }
    
    func isValid(_ email: String, _ pass: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let passReg = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[A-Za-z0-9]{3,}"
        let passPred = NSPredicate(format:"SELF MATCHES %@", passReg)
        
        if emailPred.evaluate(with: email) && passPred.evaluate(with: pass) {
            return true
        }
        else {
            return false
        }
    }
    
    func warningAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let canelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(canelAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
}

