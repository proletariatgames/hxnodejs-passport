package js.npm.passport.strategies;

@:jsRequire('passport-google-oauth20', 'Strategy')
extern class GoogleOAuth20 extends js.npm.passport.Strategy {
  public function new(options:{
      clientID:String,
      clientSecret:String,
      callbackURL:String,
    },
    callback:String->String->Dynamic->(Null<js.Error>->User->Void)->Void);
}

