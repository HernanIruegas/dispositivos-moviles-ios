//
//  ViewController.swift
//  HW2_A00817021_masterMind
//
//  Created by Hernán Iruegas Villarreal on 27/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var playOrSeeSolution: UISegmentedControl!
    @IBOutlet weak var color1: UIView!
    @IBOutlet weak var color2: UIView!
    @IBOutlet weak var color3: UIView!
    @IBOutlet weak var color4: UIView!
    @IBOutlet weak var displaySolutionColors: UIView!
    
    @IBOutlet weak var playerColor1: UIButton!
    @IBOutlet weak var playerColor2: UIButton!
    @IBOutlet weak var playerColor3: UIButton!
    @IBOutlet weak var playerColor4: UIButton!
    
    @IBOutlet weak var pin1: UIView!
    @IBOutlet weak var pin2: UIView!
    @IBOutlet weak var pin3: UIView!
    @IBOutlet weak var pin4: UIView!
    
    var colors: [UIColor] = [UIColor.orange,UIColor.red,UIColor.blue,UIColor.black,UIColor.green,UIColor.yellow]
    var mapOfSolution = [UIColor: Int]()
    var game = GameSolution()
    var player = PlayerSolution()
    var pins = Pins()
    var tries = 0
    
    // Contiene un arreglo con los colores solución
    struct GameSolution {

        var solutionColors: [UIColor] = [UIColor.orange,UIColor.red,UIColor.blue,UIColor.black]
    }
    
    // Contiene un arreglo con numeros que denotan colores en el arreglo de colors
    struct PlayerSolution {

        var solutionPlayer: [Int] = [0,0,0,0]
    }
    
    // Contiene un arreglo que describe el estado de los pines
    // 1 = Color correcto, posición incorrecta
    // 2 = Color y posición correcto
    struct Pins {
 
        var statePins: [Int] = [0,0,0,0]
        var pinCollection: [UIView] = []
    }
    
    // Muestra los pins correspondientes a la solución correspondiente del jugador
    func showPins(){
        
        var generatedValues = [Int: Int]()
        
        for index in 0...3 {
            
            // Se valida que el color que el jugador haya seleccionado sean alguno de los colores solución que están en el mapa
            if(mapOfSolution[colors[player.solutionPlayer[index]]] != nil){
                pins.statePins[index] = 1
                
                // Se valida que el color que haya seleccionado el jugador esté en la posición correcta
                if(colors[player.solutionPlayer[index]] == game.solutionColors[index]){
                    pins.statePins[index] = 2
                }
            }else{
                pins.statePins[index] = 0
            }
        }
        
        // Se muestran los colores de los pins
        for index in 0...3 {
            
            var num = Int(arc4random_uniform(4)) // Número random del 0 al 3
            while(generatedValues[num] != nil){ // Para asegurarse que no sea un número repetido
                num = Int(arc4random_uniform(4))
            }
            generatedValues[num] = num

            if(pins.statePins[index] == 1){
                pins.pinCollection[num].isHidden = false
                pins.pinCollection[num].backgroundColor = UIColor.white
                
            }else{
                if(pins.statePins[index] == 2){
                    pins.pinCollection[num].isHidden = false
                    pins.pinCollection[num].backgroundColor = UIColor.red
                }else{
                    pins.pinCollection[num].isHidden = true
                }
            }
        }
    }
    
    // Estado del segmented control, para ver si el jugador quiere ver la solución o no
    @IBAction func playOrSeeSolution(_ sender: Any) {
        
        switch playOrSeeSolution.selectedSegmentIndex{
        case 0:
            displaySolutionColors.isHidden = true
        case 1:
            displaySolutionColors.isHidden = false
        default:
            break;
        }
        
    }
    
    // Boton de probar, indica que el jugador quiere ver si su solución es la ganadora
    // Usa a la función de checkWin como auxiliar
    // Usa la función de checkForRepeatedNumbers como auxiliar
    @IBAction func checkIfPlayerWon(_ sender: Any) {
        
        let areThereRepeatedColors = checkForRepeatedColors()
        
        if(areThereRepeatedColors){
            displayAlert(title: "ERROR", message: "Existen colores repetidos")
            
        }else{
            // No hay colores repetidos y se puede probar la solución del jugador
            tries += 1
            let win = checkWin()
            if(win){
                displayAlert(title: "Ganaste!", message: "Has ganado en " + String(tries) + " intentos!")
                showPins()
            }else{
                displayAlert(title: "No has ganado", message: "Intenta de nuevo")
                showPins()
            }
        }
    }
    
    // Devuelve si existen colores repetidos en la colución del jugador
    func checkForRepeatedColors() -> Bool{
        
        var repeatedNumbers = [Int: Int]()
        
        for index in 0...3 {
            if(repeatedNumbers[player.solutionPlayer[index]] != nil){
                return true
            }else{
                repeatedNumbers[player.solutionPlayer[index]] = index
            }
        }

        return false
    }
    
    // Vuelve a poner todo listo para empezar un juego nuevo
    // Se apoya en la función resetValues()
    @IBAction func StartNewGame(_ sender: Any) {
        
        tries = 0
        playOrSeeSolution.selectedSegmentIndex = 0
        mapOfSolution.removeAll()
        for index in 0...3 {
            game.solutionColors[index] = UIColor.orange // color default
            player.solutionPlayer[index] = 0
            pins.statePins[index] = 0
        }
        resetValues()
    }
    
    func resetValues(){
        
        pin1.isHidden = true
        pin2.isHidden = true
        pin3.isHidden = true
        pin4.isHidden = true
        
        displaySolutionColors.isHidden = true
        generateUniqueInt()
        
        // Display Solution colors
        color1.backgroundColor = game.solutionColors[0]
        color2.backgroundColor = game.solutionColors[1]
        color3.backgroundColor = game.solutionColors[2]
        color4.backgroundColor = game.solutionColors[3]
        
        // Initiate player colors in default
        playerColor1.backgroundColor = colors[player.solutionPlayer[0]]
        playerColor2.backgroundColor = colors[player.solutionPlayer[0]]
        playerColor3.backgroundColor = colors[player.solutionPlayer[0]]
        playerColor4.backgroundColor = colors[player.solutionPlayer[0]]
    
    }
    
    /* CHANGE PLAYER COLORS */
    @IBAction func changePlayerColor1(_ sender: Any) {
        player.solutionPlayer[0] = (player.solutionPlayer[0] + 1 ) % 6
        playerColor1.backgroundColor = colors[player.solutionPlayer[0]]
    }
    
    @IBAction func changePlayerColor2(_ sender: Any) {
        player.solutionPlayer[1] = (player.solutionPlayer[1] + 1 ) % 6
        playerColor2.backgroundColor = colors[player.solutionPlayer[1]]
    }
    
    @IBAction func changePlayerColor3(_ sender: Any) {
        player.solutionPlayer[2] = (player.solutionPlayer[2] + 1 ) % 6
        playerColor3.backgroundColor = colors[player.solutionPlayer[2]]
    }
    
    @IBAction func changePlayerColor4(_ sender: Any) {
        player.solutionPlayer[3] = (player.solutionPlayer[3] + 1 ) % 6
        playerColor4.backgroundColor = colors[player.solutionPlayer[3]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetValues()
        
        // Set up array of UIViews for pins
        pins.pinCollection.append(pin1)
        pins.pinCollection.append(pin2)
        pins.pinCollection.append(pin3)
        pins.pinCollection.append(pin4)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Función para asignar colores aleatoreos a la solución del juego
    func generateUniqueInt() {
        
        var generatedValues = [Int: Int]()
        
        for index in 0...3{
        
            var num = Int(arc4random_uniform(6)) // Número random del 0 al 5
            
            while(generatedValues[num] != nil){ // Para asegurarse que no sea un número repetido
                num = Int(arc4random_uniform(6))
            }
            
            generatedValues[num] = num
            
            // lo cambie de index a num
            game.solutionColors[index] = colors[num]
            
            mapOfSolution[colors[num]] = index
            
        }
    }
    
    // Función para verificar si el jugador ya gano
    func checkWin() -> Bool{
        
        for index in 0...3 {
            // Verifico que ambas soluciones tengan los mismos colores
            if(colors[player.solutionPlayer[index]] != game.solutionColors[index]){
                return false;
            }
        }
        
        return true
    }
    
    // Template para general alertas dinámicamente
    func displayAlert(title: String, message: String) {
        
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertcontroller, animated: true, completion: nil)
    }
}

