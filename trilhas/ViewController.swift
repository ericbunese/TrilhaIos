//
//  ViewController.swift
//  trilhas
//
//  Created by Eric Bunese on 19/08/17.
//  Copyright © 2017 Eric Bunese. All rights reserved.
//

import UIKit
import Networking
import SwiftyJSON

class ViewController: UIViewController {

  var user:User?
  let url_login = "http://10.1.0.114:3000/api/v1/user/login"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //MARK: Properties
  @IBOutlet weak var usernameInput: UITextField!
  
  @IBOutlet weak var passwordInput: UITextField!
  
  @IBOutlet weak var errorLabel: UILabel!
  //MARK: Actions


  @IBAction func pressedLoginAction(_ sender: Any) {
    let username = usernameInput.text;
    let password = passwordInput.text;
    
    let payload = ["username":username, "password":password]
    
    let loginPost = Networking(baseURL: url_login)
    loginPost.post("", parameters: payload) { result in
            switch result
            {
                case .success(let response):
                
                  do {
                    let json = response.dictionaryBody
                    print(json)
                    self.user = User(name: json["name"] as! String, id: json["_id"] as! String, username: json["username"] as! String, admin: json["admin"] as! Bool, teacher: json["teacher"] as! Bool,
                      student: json["student"] as! Bool, parent: json["parent"] as! Bool)
              
                    self.errorLabel.text = " "
                    
                    
                    if (self.user?.teacher)! {
                    
                      let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "professor") as! MainViewController

                      vc.user = self.user!
                      self.navigationController?.pushViewController(vc, animated:true)
                    }
                    else if (self.user?.student)! {
                      let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "aluno") as! MainViewController

                      vc.user = self.user!
                      self.navigationController?.pushViewController(vc, animated:true)
                    }
                    else if (self.user?.admin)! {
                      let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "admin") as! MainViewController

                      vc.user = self.user!
                      self.navigationController?.pushViewController(vc, animated:true)
                    }
                    else if (self.user?.parent)! {
                      let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "pais") as! MainViewController

                      vc.user = self.user!
                      self.navigationController?.pushViewController(vc, animated:true)
                    }
                    
                  }
                  catch {
                    self.passwordInput.text = ""
                    self.errorLabel.text = "Não foi possível logar."
                  }
              
              
                case .failure(let response):
                    print("Network Error: \(response)")
                    self.passwordInput.text = ""
                    self.errorLabel.text = "Não foi possível logar."
            }
    }
  }
}

