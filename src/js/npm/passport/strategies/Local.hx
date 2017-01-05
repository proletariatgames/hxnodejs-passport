package js.npm.passport.strategies;

@:jsRequire('passport-local', 'Strategy')
extern class Local extends js.npm.passport.Strategy {
  @:overload(function(callback:String->String->(Null<js.Error>->User->Void)):Void {})
  @:overload(function(options:{ ?usernameField:String, ?passwordField:String, ?session:Bool, passReqToCallback:Bool },
        callback:express.Request->String->String->(Null<js.Error>->User->Void)):Void {})
  public function new(options:{ ?usernameField:String, ?passwordField:String, ?session:Bool },
      callback:String->String->(Null<js.Error>->User->Void));
}
