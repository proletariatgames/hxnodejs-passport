package js.npm.passport.strategies;

@:jsRequire('passport-facebook', 'Strategy')
extern class Facebook extends js.npm.passport.Strategy {
  /**
    The Facebook authentication strategy authenticates users using a Facebook
    account and OAuth 2.0 tokens. The app ID and secret obtained when creating an
    application are supplied as options when creating the strategy. The strategy
    also requires a verify callback, which receives the access token and optional
    refresh token, as well as profile which contains the authenticated user's
    Facebook profile. The verify callback must call cb providing a user to complete
    authentication.

    ```
    passport.use(new FacebookStrategy({
        clientID: FACEBOOK_APP_ID,
        clientSecret: FACEBOOK_APP_SECRET,
        callbackURL: "http://localhost:3000/auth/facebook/callback"
      },
      function(accessToken, refreshToken, profile, cb) {
        User.findOrCreate({ facebookId: profile.id }, function (err, user) {
          return cb(err, user);
        });
      }
    ));```
   **/
  public function new(options:{
      clientID:String,
      clientSecret:String,
      callbackURL:String,
    },
    callback:String->String->Dynamic->(Null<js.Error>->User->Void)->Void);
}

