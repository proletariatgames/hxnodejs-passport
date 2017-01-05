package js.npm.passport.strategies;

@:jsRequire('passport-browserid', 'Strategy')
extern class BrowserID extends js.npm.passport.Strategy {
  public function new(options:{ audience:String },
      callback:String->(Null<js.Error>->User->Void));
}


