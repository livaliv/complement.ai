//
//  ViewController.swift
//  complement.ai
//
//  Created by livia on 04/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textoGrande: UILabel!
    @IBOutlet var botaoEff: UIButton!
    @IBOutlet var botaoE: UIButton!
    @IBOutlet var botaoDe: UIButton!
    @IBOutlet var botaoTse: UIButton!
    @IBOutlet var botaoBe: UIButton!
    @IBOutlet var botaoA: UIButton!
    @IBOutlet var botaoNeun: UIButton!
    @IBOutlet var botaoAcht: UIButton!
    @IBOutlet var botaoSieben: UIButton!
    @IBOutlet var botaoSechs: UIButton!
    @IBOutlet var botaoFunf: UIButton!
    @IBOutlet var botaoVier: UIButton!
    @IBOutlet var botaoDrei: UIButton!
    @IBOutlet var botaoZwei: UIButton!
    @IBOutlet var botaoEins: UIButton!
    @IBOutlet var botaoNull: UIButton!
    @IBOutlet var corOriginal: UILabel!
    @IBOutlet var textoBotaoGrande: UILabel!
    @IBAction func errouTroxa(_ sender: UIButton) {
    
        if textoGrande.text?.count ?? 0 > 0 {
            let numeroHexTai = textoGrande.text!
            let numeroHexXtai = String(numeroHexTai.dropLast())
            textoGrande.text = numeroHexXtai
            textoGrande.sizeToFit()
            corOriginal.isHidden = true
            textoBotaoGrande.text = "Complementar!"
            
        }
    }
    @IBAction func averageTeco(_ sender: UIButton) {
        if textoGrande.text?.count ?? 0 < 6 {
            var hexCorOrig = textoGrande.text!
            hexCorOrig = "\(hexCorOrig)\(sender.titleLabel!.text!.replacingOccurrences(of: " ", with: ""))"
            textoGrande.text = hexCorOrig
            textoGrande.sizeToFit()
            print("teco")
        }
    }
    @IBAction func calcula() {
        if textoBotaoGrande.text == "Complementar!" && textoGrande.text?.count ?? 0 == 6 {
            textoBotaoGrande.text = "Limpar"
            let usuarioBom = textoGrande.text!
            var vetorHex: [String] = []
            var vetorResultado: [Int] = []
            var vetorTransformado: [Int] = []
            
            var divideConjunto = usuarioBom.filter {!$0.isWhitespace}
            divideConjunto = divideConjunto.separate(every: 2, with: " ")
            
            let inteironaPaTres = divideConjunto.split(separator: " ")
            
            for novoDecimal in inteironaPaTres {
                let seguraRes = String(UInt64(novoDecimal, radix:16)!)
                vetorTransformado.append(Int(seguraRes)!)
            }
            
            for continha in vetorTransformado {
                vetorResultado.append(255 - continha)
            }
            
            for voltaPacasa in vetorResultado {
                vetorHex.append(String(voltaPacasa, radix:16))
            }
            
            for feioDeselegante in 0...vetorHex.count - 1 {
                if vetorHex[feioDeselegante].count < 2 {
                    vetorHex[feioDeselegante].insert("0", at: vetorHex[feioDeselegante].startIndex)
                }
            }
            
            let resultadoMesmo = vetorHex[0] + vetorHex[1] + vetorHex[2]
            textoGrande.text = resultadoMesmo.uppercased()
            
            corOriginal.text = "#" + usuarioBom
            corOriginal.isHidden = false
            
            }else{
                textoBotaoGrande.text = "Complementar!"
                textoGrande.text = ""
                corOriginal.text = ""
            }
    }
                
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension UIColor {
    
    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") { cString.removeFirst() }
        
        if cString.count != 6 {
            self.init("ff0000") // return red color for wrong hex input
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
}

extension String {
  func separate(every stride: Int = 4, with separator: Character = " ") -> String {
    return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
  }
}
