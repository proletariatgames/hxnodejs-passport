package js.npm.passport;

@:jsRequire("passport", "Authenticator")
extern class Authenticator {
  function new():Void;

  /**
   * Utilize the given `strategy` with optional `name`, overridding the strategy's
   * default name.
   *
   * Examples:
   *
   *     passport.use(new TwitterStrategy(...));
   *
   *     passport.use('api', new http.BasicStrategy(...));
   *
   * @param {String|Strategy} name
   * @param {Strategy} strategy
   * @return {Authenticator} for chaining
   * @api public
   */
  @:overload(function(name:String, mw:js.npm.passport.Strategy):Self {})
  function use(strategy:js.npm.passport.Strategy):Self;

  /**
   * Un-utilize the `strategy` with given `name`.
   *
   * In typical applications, the necessary authentication strategies are static,
   * configured once and always available.  As such, there is often no need to
   * invoke this function.
   *
   * However, in certain situations, applications may need dynamically configure
   * and de-configure authentication strategies.  The `use()`/`unuse()`
   * combination satisfies these scenarios.
   *
   * Examples:
   *
   *     passport.unuse('legacy-api');
   *
   * @param {String} name
   * @return {Authenticator} for chaining
   * @api public
   */
  function unuse(name:String):Self;

  /**
   * Passport's primary initialization middleware.
   *
   * This middleware must be in use by the Connect/Express application for
   * Passport to operate.
   *
   * Options:
   *   - `userProperty`  Property to set on `req` upon login, defaults to _user_
   *
   * Examples:
   *
   *     app.use(passport.initialize());
   *
   *     app.use(passport.initialize({ userProperty: 'currentUser' }));
   *
   * @param {Object} options
   * @return {Function} middleware
   * @api public
   */
  @:overload(function(options:Dynamic):express.Middleware {})
  function initialize():express.Middleware;

  /**
   * Middleware that will authenticate a request using the given `strategy` name,
   * with optional `options` and `callback`.
   *
   * Examples:
   *
   *     passport.authenticate('local', { successRedirect: '/', failureRedirect: '/login' })(req, res);
   *
   *     passport.authenticate('local', function(err, user) {
   *       if (!user) { return res.redirect('/login'); }
   *       res.end('Authenticated!');
   *     })(req, res);
   *
   *     passport.authenticate('basic', { session: false })(req, res);
   *
   *     app.get('/auth/twitter', passport.authenticate('twitter'), function(req, res) {
   *       // request will be redirected to Twitter
   *     });
   *     app.get('/auth/twitter/callback', passport.authenticate('twitter'), function(req, res) {
   *       res.json(req.user);
   *     });
   *
   * @param {String} strategy
   * @param {Object} options
   * @param {Function} callback
   * @return {Function} middleware
   * @api public
   **/
  @:overload(function(strategy:String, callback:Null<js.Error>->User->Void):express.Middleware {})
  @:overload(function(strategy:String, options:Dynamic):express.Middleware {})
  @:overload(function(strategy:String):express.Middleware {})
  function authenticate(strategy:String, options:Dynamic, callback:Null<js.Error>->User->Void):express.Middleware;

  /**
   * Middleware that will authorize a third-party account using the given
   * `strategy` name, with optional `options`.
   *
   * If authorization is successful, the result provided by the strategy's verify
   * callback will be assigned to `req.account`.  The existing login session and
   * `req.user` will be unaffected.
   *
   * This function is particularly useful when connecting third-party accounts
   * to the local account of a user that is currently authenticated.
   *
   * Examples:
   *
   *    passport.authorize('twitter-authz', { failureRedirect: '/account' });
   *
   * @param {String} strategy
   * @param {Object} options
   * @return {Function} middleware
   * @api public
   */
  @:overload(function(strategy:String, callback:Null<js.Error>->User->Void):express.Middleware {})
  @:overload(function(strategy:String, options:Dynamic):express.Middleware {})
  @:overload(function(strategy:String):express.Middleware {})
  function authorize(strategy:String, options:Dynamic, callback:Null<js.Error>->User->Void):express.Middleware;

  /**
   * Middleware that will restore login state from a session.
   *
   * Web applications typically use sessions to maintain login state between
   * requests.  For example, a user will authenticate by entering credentials into
   * a form which is submitted to the server.  If the credentials are valid, a
   * login session is established by setting a cookie containing a session
   * identifier in the user's web browser.  The web browser will send this cookie
   * in subsequent requests to the server, allowing a session to be maintained.
   *
   * If sessions are being utilized, and a login session has been established,
   * this middleware will populate `req.user` with the current user.
   *
   * Note that sessions are not strictly required for Passport to operate.
   * However, as a general rule, most web applications will make use of sessions.
   * An exception to this rule would be an API server, which expects each HTTP
   * request to provide credentials in an Authorization header.
   *
   * Examples:
   *
   *     app.use(connect.cookieParser());
   *     app.use(connect.session({ secret: 'keyboard cat' }));
   *     app.use(passport.initialize());
   *     app.use(passport.session());
   *
   * Options:
   *   - `pauseStream`      Pause the request stream before deserializing the user
   *                        object from the session.  Defaults to _false_.  Should
   *                        be set to true in cases where middleware consuming the
   *                        request body is configured after passport and the
   *                        deserializeUser method is asynchronous.
   *
   * @param {Object} options
   * @return {Function} middleware
   * @api public
   */
  @:overload(function():express.Middleware {})
  function session(options:{ ?pauseStream:Bool }):express.Middleware;

  /**
   * Registers a function used to serialize user objects into the session.
   *
   * Examples:
   *
   *     passport.serializeUser(function(user, done) {
   *       done(null, user.id);
   *     });
   *
   * @api public
   */
  function serializeUser(callback:User->(Null<js.Error>->String->Void)->Void):Void;

  /**
   * Registers a function used to deserialize user objects out of the session.
   *
   * Examples:
   *
   *     passport.deserializeUser(function(id, done) {
   *       User.findById(id, function (err, user) {
   *         done(err, user);
   *       });
   *     });
   *
   * @api public
   */
  function deserializeUser(callback:String->(Null<js.Error>->User->Void)->Void):Void;

}

private typedef Self = Authenticator;
