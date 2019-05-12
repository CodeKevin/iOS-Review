//
//  JSViewController.m
//  iOS_Review
//
//  Created by Kevin on 2019/4/10.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "JSViewController.h"
#import "Define.h"
#import <JavaScriptCore/JSContext.h>
#import "UIFactory.h"
@interface JSViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation JSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, Screen_W, Screen_H-64)];
    web.delegate = self;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test.html" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    self.webView = web;
    [self.view addSubview:self.webView];
    
    UIButton *btn = [UIFactory createWithFrame:CGRectMake(20, 100, 200, 50) title:@"OC call JS" backgroundColor:[UIColor greenColor]];
    btn.center = CGPointMake(Screen_W*0.5, (Screen_H-64-btn.frame.size.height*0.5));
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}
- (void)click {
    //代码注入和代码执行
    [self.webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function myFunction() { "   //定义myFunction方法
     "var field = document.getElementsByName('word')[0];"
     "field.value='时间';"
     "document.forms[0].submit();"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
}
#pragma mark WebDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
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
