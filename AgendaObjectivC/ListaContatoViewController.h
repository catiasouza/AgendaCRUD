//
//  ListaContatoViewController.h
//  AgendaObjectivC
//
//  Created by Cátia Souza on 06/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "ViewController.h"

@interface ListaContatoViewController : UITableViewController<ViewControllerDelegate>

@property ContatoDAO *dao;
@property Contato *contatoSelecionado;
@property NSInteger linhaSelecionada;

@end


