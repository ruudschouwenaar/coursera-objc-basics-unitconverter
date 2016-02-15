//
//  ViewController.m
//  UnitConverter
//
//  Created by Ruud Schouwenaar on 15-01-16.
//  Copyright © 2016 Ruud Schouwenaar. All rights reserved.
//

#import "ViewController.h"

double convertCtoF(double tempCelcius) {
// converting Celcius to Fahrenheit
// formula: The temperature T in degrees Fahrenheit (°F) is
//          equal to the temperature T in degrees Celsius (°C)
//          times 9/5 plus 32
//          T(°F) = T(°C) × 1.8 + 32
    
    double tempFahrenheit = tempCelcius * 1.8 + 32;
    return tempFahrenheit;
}

double convertCtoK(double tempCelcius) {
// formula: The temperature T in Kelvin (K) is
//          equal to the temperature T in degrees Celsius (°C)
//          plus 273.15:
//          T(K) = T(°C) + 273.15
    
    double tempKelvin = tempCelcius + 273.15;
    return tempKelvin;
}

double convertCtoR(double tempCelsius) {
// [°R] = ([°C] + 273.15) × 9⁄5
    
    double tempRankine = (tempCelsius + 273.15) * 1.8;
    return tempRankine;
}

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UILabel *outputField;

@end

@implementation ViewController
- (IBAction)updateButton:(id)sender {
    NSMutableString *buf = [NSMutableString new];
    
    double userInput = [self.inputField.text doubleValue];
    double result = 0.0;
    
    switch (self.segmentController.selectedSegmentIndex) {
        case 0:
            // Celsius to Fahrenheit
            result = convertCtoF(userInput);
            break;
        case 1:
            // Celcius to Kelvin
            result = convertCtoK(userInput);
            break;
        case 2:
            // Celsius to Rankine
            result = convertCtoR(userInput);
            break;
        default:
            result = 0;
            break;
    }
 
    [buf appendString: [@(result)stringValue]];
    
    self.outputField.text = buf;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
