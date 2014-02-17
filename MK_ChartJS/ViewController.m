//
//  ViewController.m
//  MK_ChartJS
//
//  Created by MurataKazuki on 2013/12/21.
//  Copyright (c) 2013年 MK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation ViewController



//画面上のButtonをタッチした時に呼び出されるメソッド
- (IBAction)loadData:(id)sender {
    //UIWebViewにロードされているHTML上で、有効なJavaScriptコマンドを実行させることができる
    NSString *javaScript = @"setChart([65,59,90,81,56,55,40]);";

    //コマンドの呼び出し（ここでは利用していないが、JavaScriptコマンドの結果を戻り値として取得することもできる）
    [_webView stringByEvaluatingJavaScriptFromString:javaScript];
    

    //***** ただしこのやり方だと、再描画する毎にキャンバスのサイズが2倍になってしまうもよう *****
    //***** 何度もChart自体をリロードするようなアプリの場合には、回避策が必要 *****
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UIWebViewへのロード方法=NSURLRequestオブジェクトを作成する
    //インターネット上のURLではなく、ここではアプリ内の組み込みhtmlファイルをロードしている
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]]];
    
    //UIWebViewでは自動的にスクロール可能になってしまうため、固定表示するにはスクロール不可に設定
    _webView.scrollView.scrollEnabled = NO;
    //リクエストをロード（＝表示される）
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
