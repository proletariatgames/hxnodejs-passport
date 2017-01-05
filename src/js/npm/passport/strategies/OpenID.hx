package js.npm.passport.strategies;

@:jsRequire('passport-openid', 'Strategy')
extern class OpenID extends js.npm.passport.Strategy {
  /**
    The OpenID authentication strategy authenticates users using an OpenID identifier. The strategy requires a validate
    callback, which accepts this identifier and calls done providing a user. Additionally, options can be supplied to
    specify a return URL and realm.

    ```
    passport.use(new OpenIDStrategy({
        returnURL: 'http://localhost:3000/auth/openid/return',
        realm: 'http://localhost:3000/'
      },
      function(identifier, done) {
        User.findByOpenID({ openId: identifier }, function (err, user) {
          return done(err, user);
        });
      }
    ));```
   **/
  public function new(options:{
    returnURL:String,
    realm:String,
  },
  callback:String->(Null<js.Error>->User->Void));

  /**
    Associations between a relying party and an OpenID provider are used to
    verify subsequent protocol messages and reduce round trips. In order to take
    advantage of this, an application must store these associations. This can be
    done by registering functions with saveAssociation and loadAssociation.


    ```
    strategy.saveAssociation(function(handle, provider, algorithm, secret, expiresIn, done) {
      // custom storage implementation
      saveAssoc(handle, provider, algorithm, secret, expiresIn, function(err) {
        if (err) { return done(err) }
        return done();
      });
    });

    strategy.loadAssociation(function(handle, done) {
      // custom retrieval implementation
      loadAssoc(handle, function(err, provider, algorithm, secret) {
        if (err) { return done(err) }
        return done(null, provider, algorithm, secret)
      });
    });```
   **/
  public function saveAssociation(callback:String->String->String->String->Date->(Null<js.Error>->Void)):Void;


  /**
    ```
    strategy.loadAssociation(function(handle, done) {
      // custom retrieval implementation
      loadAssoc(handle, function(err, provider, algorithm, secret) {
        if (err) { return done(err) }
        return done(null, provider, algorithm, secret)
      });
    });
    ```
   **/
  public function loadAssociation(callback:String->(Null<js.Error>->String->String->String->Void)):Void;
}

