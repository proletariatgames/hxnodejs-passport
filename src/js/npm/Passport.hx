package js.npm;

@:jsRequire("passport")
extern class Passport {
  public static var singleton(get, never):js.npm.passport.Authenticator;

  inline public static function get_singleton():js.npm.passport.Authenticator {
    return cast Passport;
  }
}
