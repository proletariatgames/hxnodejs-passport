# Haxe/hxnodejs externs for the [passport](https://www.npmjs.com/package/passport) npm library

Tested using `passport` version **0.3.2**

Example:
```haxe
import js.npm.Passport;
import express.Express;

var passport = Passport.singleton;

passport.use(new js.npm.passport.strategies.Local(
  function(username, password, done) {
    User.findOne({ username: username }, function (err, user) {
      if (err) { return done(err); }
      if (!user) { return done(null, false); }
      if (!user.verifyPassword(password)) { return done(null, false); }
      return done(null, user);
    });
  }
));

passport.serializeUser(function(user, done) {
  done(null, user.id);
});

passport.deserializeUser(function(id, done) {
  User.findById(id, function (err, user) {
    done(err, user);
  });
});

var app = new Express(),
app.use(mw.CookieParser.create());
app.use(mw.BodyParser.urlencoded({ extended: true }));
app.use(mw.Session.create({ secret: 'keyboard cat', resave: true, saveUninitialized: true }));
app.use(passport.initialize());
app.use(passport.session());

app.post('/login', 
  passport.authenticate('local', { failureRedirect: '/login' }),
  function(req, res) {
    res.redirect('/');
  });
```
