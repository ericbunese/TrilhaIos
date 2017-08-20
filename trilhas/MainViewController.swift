//
//  MainViewController.swift
//  trilhas
//
//  Created by Eric Bunese on 19/08/17.
//  Copyright © 2017 Eric Bunese. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  var user:User?

  //MARK: Properties
  
  @IBOutlet weak var nameLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(self.user!)
    print(self.user!.name)
    self.navigationItem.title = self.user!.name
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
