//
//  ViewController.h
//  AgendaObjectivC
//
//  Created by Cátia Souza on 06/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@protocol ViewControllerDelegate <NSObject>

-(void)contatoAdicionado: (Contato *)contato;
-(void)contatoAtualizado: (Contato *)contato;
@end
@interface ViewController : UIViewController


@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *site;

@property ContatoDAO *dao;
@property Contato *contato;
@property id<ViewControllerDelegate> delegate;

@end

