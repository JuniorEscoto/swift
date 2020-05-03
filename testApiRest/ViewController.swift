//
//  ViewController.swift
//  testApiRest
//
//  Created by junior on 4/27/20.
//  Copyright © 2020 junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    var lista = ["uno", "dos", "tres"]
    var capital = [questions]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = lista[indexPath.row]
        
        return cell
    }
    

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        // esto nos asegura que no tengamos datoa opcionales
        guard let url = URL(string:URl_Nasa_Datos) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            // este es por si data trae datos nulos
            guard let datos = data else {return}
            
            do{
                let datosNasa = try JSONDecoder().decode([questions].self, from: datos)
                for d in datosNasa {
                    print(d.name + ":" + d.capital)
                }
                
            } catch{
                 print("Error de logica")
            }
        }.resume()

    }
}

