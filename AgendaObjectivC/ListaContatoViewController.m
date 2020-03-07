//
//  ListaContatoViewController.m
//  AgendaObjectivC
//
//  Created by Cátia Souza on 06/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

#import "ListaContatoViewController.h"

#import "Contato.h"

@implementation ListaContatoViewController

-(ListaContatoViewController *)init{
    
    self = [super init];
    if(self){
        UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        
        self.navigationItem.rightBarButtonItem = botaoForm;
        self.navigationItem.title = @"Contatos";
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDAO contatoDaoInstance];
    }
    
    return  self;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        Contato *contato = [self.dao contatoIndice:indexPath.row];
        
        [self.dao removeContato: contato];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    self.contatoSelecionado = [self.dao contatoIndice:indexPath.row];
    self.exibeFormulario;
}

-(void) exibeFormulario{
    
    UIStoryboard *storyboard =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"FomContato"];
    form.delegate = self;
    if(self.contatoSelecionado){
        form.contato = self.contatoSelecionado;
    }
    self.contatoSelecionado = nil;
    //form.dao = self.dao;
    [self.navigationController pushViewController: form animated:YES];
}
-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection: (NSInteger)section{
    return [self.dao total];
}

-(nonnull UITableViewCell *)tableView :(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    NSString *identificador = @"Celula";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    //Se nao tem uma cel cria
    if(!cell){
        cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    Contato *contato =  [self.dao contatoIndice:indexPath.row] ;
    cell.textLabel.text = contato.nome;
    
    return cell;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
-(void)contatoAdicionado: (Contato *)contato{
    self.linhaSelecionada = [self.dao indiceContato:contato];
    
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ adicionado com sucesso!",contato.nome];
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Contato Adicionado" message:mensagem  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alerta addAction:ok];
    [self presentViewController:alerta animated:YES completion:nil];
    
    NSLog(@"Contato adicionado");
}
-(void)contatoAtualizado:(Contato *)contato{
    self.linhaSelecionada = [self.dao indiceContato:contato];
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ alterado!",contato.nome];
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Contato Alterado!" message:mensagem  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alerta addAction:ok];
    [self presentViewController:alerta animated:YES completion:nil];
    NSLog(@"Atualizado");
}
-(void)viewDidAppear:(BOOL)animated{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.linhaSelecionada = -1;
}
@end
