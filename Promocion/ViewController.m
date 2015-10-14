//
//  ViewController.m
//  Promocion
//
//  Created by VIZINNO iMac 03 on 13/10/15.
//  Copyright © 2015 VIZINNO. All rights reserved.
//

#import "ViewController.h"
#import "ScreenSaverViewController.h"

@interface ViewController  ()
{
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UIButton *eventosButton;
@property (weak, nonatomic) IBOutlet UIWebView *webView2;


@end

@implementation ViewController 


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    timer = [NSTimer scheduledTimerWithTimeInterval:65 target:self selector:@selector(gotoScreenSaver) userInfo:nil repeats:NO];
}

- (void)gotoScreenSaver
{
    ScreenSaverViewController *ssvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ScreenSaverViewController"];
    [self presentViewController:ssvc animated:YES completion:nil];
}
- (void)resetTimer
{
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:65 target:self selector:@selector(gotoScreenSaver) userInfo:nil repeats:NO];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [timer invalidate];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self resetTimer];
}
- (IBAction)showEvents:(id)sender {
    //NSURL *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"www/eventos"]];
    NSURL *htmlFile = [NSURL URLWithString:@"http://yocove.com/appvizinno/eventos"];
    NSLog(@"Your message here %@",htmlFile);
    _webView2.allowsInlineMediaPlayback = TRUE;
    [_webView2 loadRequest:[NSURLRequest requestWithURL:htmlFile]];
    //self.webView2.mediaPlaybackRequiresUserAction = NO;
    //self.webView2.allowsInlineMediaPlayback = TRUE;
}
- (IBAction)showWeather:(id)sender {
    NSURL *htmlFile = [NSURL URLWithString:@"http://yocove.com/weather"];
    NSLog(@"Your message here %@",htmlFile);
    _webView2.allowsInlineMediaPlayback = TRUE;
    [_webView2 loadRequest:[NSURLRequest requestWithURL:htmlFile]];
    //self.webView2.mediaPlaybackRequiresUserAction = NO;
    //self.webView2.allowsInlineMediaPlayback = TRUE;
}
- (IBAction)showNews:(id)sender {
    NSURL *htmlFile = [NSURL URLWithString:@"http://yocove.com/appvizinno/noticias"];
    NSLog(@"Your message here %@",htmlFile);
    _webView2.allowsInlineMediaPlayback = TRUE;
    [_webView2 loadRequest:[NSURLRequest requestWithURL:htmlFile]];

}
- (IBAction)showTickets:(id)sender {
    NSURL *htmlFile = [NSURL URLWithString:@"http://yocove.com/appvizinno/tickets"];
    NSLog(@"Your message here %@",htmlFile);
    _webView2.allowsInlineMediaPlayback = TRUE;
    [_webView2 loadRequest:[NSURLRequest requestWithURL:htmlFile]];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self resetTimer];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
