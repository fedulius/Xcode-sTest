import Foundation

public class Valid {
    public static func isVald(_ email: String, _ pass: String) -> Bool {
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
}
