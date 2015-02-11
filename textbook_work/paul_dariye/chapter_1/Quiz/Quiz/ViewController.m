//
//  ViewController.m
//  Quiz
//
//  Created by Paul Dariye on 2/9/15.
//  Copyright (c) 2015 Paul Dariye. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()


// Current question index
@property (nonatomic) int currentQuestionIndex;

// Define questions array
@property (nonatomic, copy) NSArray *questions;

// Define answers array
@property (nonatomic, copy) NSArray *answers;

// Define question label
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;

// Define answer label
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;


@end



@implementation ViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        /* =============================================================================
           Create two arrays filled with questions and answers and make pointers to them
          ============================================================================== */
        
        // Define and instantiate questions array
        self.questions = @[
                           @"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"
                          ];
        // Define and instantiate answers array
        self.answers = @[
                         @"Grapes",
                         @"14",
                         @"Montpelier"
                        ];
    }
    
    // Return the address of the new object
    return self;
}

//- (void) viewDidLoad
//{
//    [super viewDidLoad];
//    
//    // Define and instantiate questions array
//    self.questions = @[
//                       @"From what is cognac made?",
//                       @"What is 7+7?",
//                       @"What is the capital of Vermont?"
//                       ];
//    // Define and instantiate answers array
//    self.answers = @[
//                     @"Grapes",
//                     @"14",
//                     @"Montpelier"
//                     ];
//}

/* ==========================
        Action Methods
   ========================== */

// showQuestion action
- (IBAction)showQuestion:(id)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    
    // Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at the index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the answer label
    self.answerLabel.text = @"???";
    
}

// showAnswer action
- (IBAction)showAnswer:(id)sender
{
    // What is the answer to the current questions?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answer label
    self.answerLabel.text = answer;
}

@end
