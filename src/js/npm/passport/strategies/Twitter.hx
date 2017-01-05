package js.npm.passport.strategies;

@:jsRequire('passport-twitter', 'Strategy')
extern class Twitter extends js.npm.passport.Strategy {
  public function new(options:{
      consumerKey:String,
      consumerSecret:String,
      callbackURL:String,
    },
    callback:String->String->Dynamic->(Null<js.Error>->User->Void)->Void);
}


