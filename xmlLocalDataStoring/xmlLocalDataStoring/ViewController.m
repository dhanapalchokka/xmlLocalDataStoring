//
//  ViewController.m
//  xmlLocalDataStoring
//
//  Created by Student on 27/07/16.
//  Copyright © 2016 learning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    AppDelegate*app;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    app=[[UIApplication sharedApplication]delegate];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Big_Hero_6_Logo.png"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onMovieStarsTap:(id)sender {
    NSString*xmlFilePath=[[NSBundle mainBundle]pathForResource:@"movieStars" ofType:@"xml"];
    self.xmlParser=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL fileURLWithPath:xmlFilePath]];
    self.xmlParser.delegate=self;
    
    [self.xmlParser parse];
    
    TableViewController*tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"Tvc"];
    [self.navigationController pushViewController:tvc animated:YES];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"parser did start document");
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    if ([elementName isEqualToString:@"bollyWood"]||[elementName isEqualToString:@"tollyWood"]||[elementName isEqualToString:@"kollyWood"]||[elementName isEqualToString:@"sandalWood"]) {
        self.currentNode=elementName;
    }
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
//    NSLog(@"string--->%@<---",string);
//    self.currentNode=[string stringByReplacingOccurrencesOfString:@"\n    " withString:@""];
////    
//    self.currentNode=[string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    if ([self.currentNode isEqualToString:@"bollyWood"]) {
        if (![string isEqualToString:@"\n    "]&&![string isEqualToString:@"\n"]) {
            NSLog(@"");
           [app.bollyWoodStarsArr addObject:string];
        }
//            else{
//             [app.bollyWoodStarsArr addObject:string];
//        }
        
//        [app.bollyWoodStarsArr removeObject:@"\n    "];
//      [app.bollyWoodStarsArr removeObject:@"\n"];
        
    }
    if ([self.currentNode isEqualToString:@"tollyWood"]) {
        [app.tollyWoodStarsArr addObject:string];
        [app.tollyWoodStarsArr removeObject:@"\n    "];
        [app.tollyWoodStarsArr removeObject:@"\n"];
        
    } if ([self.currentNode isEqualToString:@"kollyWood"]) {
        [app.kollyWoodStarsArr addObject:string];
        [app.kollyWoodStarsArr removeObject:@"\n    "];
        [app.kollyWoodStarsArr removeObject:@"\n"];
        
    } if ([self.currentNode isEqualToString:@"sandalWood"]) {
        [app.sandalWoodStarsArr addObject:string];
        [app.sandalWoodStarsArr removeObject:@"\n    "];
        [app.sandalWoodStarsArr removeObject:@"\n"];
        
    }
    
    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"parser did end document");
}
@end
