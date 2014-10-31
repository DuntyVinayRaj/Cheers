//
//  LoginController.m
//  Cheers!!
//
//  Created by Vinay Raj Dunty on 15/10/14.
//  Copyright (c) 2014 Myntra. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtInput1;
@property (weak, nonatomic) IBOutlet UITextField *txtInput2;
@property (weak, nonatomic) IBOutlet UITextField *txtInput3;
@property (weak, nonatomic) IBOutlet UITextField *txtInput4;

@property (nonatomic, assign) BOOL isKeyBoardVisible;
@property NSArray *inputsArray;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.inputsArray = @[self.txtInput1, self.txtInput2, self.txtInput3, self.txtInput4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self shiftFrameUpForKeyBoard];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self shiftFrameDown];

    [textField resignFirstResponder];
    return YES;
}

-(void)shiftFrameUpForKeyBoard
{
    if( !self.isKeyBoardVisible )
    {
        CGRect frame = self.view.frame;
        frame.origin.y -= KeyBoardSize;
        self.view.frame = frame;
        
        self.isKeyBoardVisible = YES;
    }
}

- (IBAction)viewTapped:(id)sender {
    
    [self shiftFrameDown];
}

-(void)shiftFrameDown
{
    if( self.isKeyBoardVisible )
    {
        CGRect frame = self.view.frame;
        frame.origin.y += KeyBoardSize;
        self.view.frame = frame;
        
        [self removeFocusFromInputFields];
        self.isKeyBoardVisible = NO;
    }
}

-(void)removeFocusFromInputFields
{
    [self.txtInput1 resignFirstResponder];
    [self.txtInput2 resignFirstResponder];
    [self.txtInput3 resignFirstResponder];
    [self.txtInput4 resignFirstResponder];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
   if( [[textField.text stringByReplacingCharactersInRange:range withString:string] length] > 1 )
       return NO;
    
    return YES;
}


- (IBAction)LoginClicked:(id)sender {
    
    [self shiftFrameDown];
    if( [self isPasswordEnteredValid] )
    {
        
    }
    else
    {
        [CheersHelper displayAlertWithTitle:@"Grrrr" messageBody:@"I guess u need to find someone who can make an app for u as well.. But this one might not be for u" viewController:nil cancelBtnTitle:@"OK, Sorry :("];
    }
}

-(BOOL)isPasswordEnteredValid
{
    if( [self haveAllFieldsBeenEntered] )
    {
        if( [self doesTextMatchPassword:self.inputsArray] )
            return YES;
    }
    
    return NO;
}

-(BOOL)doesTextMatchPassword : (NSArray*)inputsArray
{
    NSString *passwd = @"";
    for(UITextField *inputField in self.inputsArray)
    {
        passwd = [passwd stringByAppendingString:inputField.text];
    }

    if( [passwd isEqualToString:[PsHndl getTheContentsOfPasswordFile]] )
        return YES;
    
    return NO;
}

-(BOOL)haveAllFieldsBeenEntered
{
    for( UITextField *inputField in self.inputsArray )
    {
        if( ![inputField isValid]  )
            return NO;
    }
    return YES;
}

@end
