//
//  ScreenSaverViewController.m
//  Promocion
//
//  Created by VIZINNO iMac 03 on 13/10/15.
//  Copyright © 2015 VIZINNO. All rights reserved.
//

#import "ScreenSaverViewController.h"
#import "ViewController.h"


@interface ScreenSaverViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic) BOOL allowsInlineMediaPlayback;


@end

@implementation ScreenSaverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSURL *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"html5videoautoplay" ofType:@"html" inDirectory:@"www"]];
    NSLog(@"Your message here %@",htmlFile);
    _webView.allowsInlineMediaPlayback = TRUE;
    [_webView loadRequest:[NSURLRequest requestWithURL:htmlFile]];
    self.webView.mediaPlaybackRequiresUserAction = NO;
    self.webView.allowsInlineMediaPlayback = TRUE;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
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

@end
