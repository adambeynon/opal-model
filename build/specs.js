// spec/spec_helper.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice;
  
  return (__scope.OpalSpec)._scope.Runner.$autorun()
})();
// spec/column_spec.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice;
  var __a, __b, __c;
  //= require spec_helper;
  (__b = self, __b.$describe._p = (__a = function() {

    
    
    return nil
  }, __a._s = self, __a), __b.$describe((__scope.Opal)._scope.Column));
  return (__c = self, __c.$describe._p = (__a = function() {

    var __a, __b;
    
    return (__b = this, __b.$describe._p = (__a = function() {

      var __a, __b;
      
      return (__b = this, __b.$it._p = (__a = function() {

        
        
        return ((__scope.Opal)._scope.Column)._scope.StringColumn.$new("foo").$type_cast("bar").$should()['$==']("bar")
      }, __a._s = this, __a), __b.$it("returns the given value"))
    }, __a._s = this, __a), __b.$describe("#type_cast"))
  }, __a._s = self, __a), __c.$describe(((__scope.Opal)._scope.Column)._scope.StringColumn));
})();
// spec/model_spec.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice, __hash2 = __opal.hash2;
  var __a, __b;
  //= require spec_helper;
  return (__b = self, __b.$describe._p = (__a = function() {

    var __a, __b, __c, __d;
    
    (__b = this, __b.$describe._p = (__a = function() {

      var __a, __b, __c, __d;
      
      (__b = this, __b.$before._p = (__a = function() {

        var __a, __b;
        
        return this.klass = (__b = __scope.Class, __b.$new._p = (__a = function() {

          
          
          return this.$add_column("foo", (__scope.Opal)._scope.Column)
        }, __a._s = this, __a), __b.$new((__scope.Opal)._scope.Model))
      }, __a._s = this, __a), __b.$before());
      (__c = this, __c.$it._p = (__a = function() {

        
        if (this.klass == null) this.klass = nil;

        
        (!!this.klass.$new()['$' + "foo"]).$should(this.$be_true());
        return (!!this.klass.$new()['$' + "foo="]).$should(this.$be_true());
      }, __a._s = this, __a), __c.$it("creates a getter and setter method for the column name"));
      return (__d = this, __d.$it._p = (__a = function() {

        var model = nil;
        if (this.klass == null) this.klass = nil;

        
        model = this.klass.$new();
        model['$foo=']("hello");
        model.$foo().$should()['$==']("hello");
        model['$foo=']("world");
        return model.$foo().$should()['$==']("world");
      }, __a._s = this, __a), __d.$it("uses the defined setter to set the attribute"));
    }, __a._s = this, __a), __b.$describe(".add_column"));
    (__c = this, __c.$describe._p = (__a = function() {

      var __a, __b;
      
      return (__b = this, __b.$it._p = (__a = function() {

        var klass = nil, __a, __b;
        
        klass = (__b = __scope.Class, __b.$new._p = (__a = function() {

          
          
          return this.$string("user_name")
        }, __a._s = this, __a), __b.$new((__scope.Opal)._scope.Model));
        return klass.$columns()['$[]']("user_name").$should(this.$be_kind_of(((__scope.Opal)._scope.Column)._scope.StringColumn));
      }, __a._s = this, __a), __b.$it("creates a StringColumn for the given attribute name"))
    }, __a._s = this, __a), __c.$describe(".string"));
    return (__d = this, __d.$describe._p = (__a = function() {

      var __a, __b, __c, __d, __e;
      
      (__b = this, __b.$before._p = (__a = function() {

        
        
        return this.klass = __scope.Class.$new((__scope.Opal)._scope.Model)
      }, __a._s = this, __a), __b.$before());
      (__c = this, __c.$it._p = (__a = function() {

        var obj = nil;
        if (this.klass == null) this.klass = nil;

        
        obj = this.klass.$new();
        obj['$[]']("foo").$should(this.$be_nil());
        obj['$[]']("bar").$should(this.$be_nil());
        return obj['$[]']("baz").$should(this.$be_nil());
      }, __a._s = this, __a), __c.$it("with no attributes leaves all attributes as nil"));
      (__d = this, __d.$it._p = (__a = function() {

        var obj = nil;
        if (this.klass == null) this.klass = nil;

        
        obj = this.klass.$new(__hash2(["foo"], {"foo": "kapow"}));
        obj['$[]']("foo").$should()['$==']("kapow");
        obj['$[]']("bar").$should(this.$be_nil());
        return obj['$[]']("baz").$should(this.$be_nil());
      }, __a._s = this, __a), __d.$it("sets given attributes"));
      return (__e = this, __e.$it._p = (__a = function() {

        var obj = nil;
        if (this.klass == null) this.klass = nil;

        
        obj = this.klass.$new(__hash2(["foo", "bar"], {"foo": "hello", "bar": "world"}));
        obj['$[]']("foo").$should()['$==']("hello");
        obj['$[]']("bar").$should()['$==']("world");
        return obj['$[]']("baz").$should(this.$be_nil());
      }, __a._s = this, __a), __e.$it("sets multiple given attributes"));
    }, __a._s = this, __a), __d.$describe("#initialize"));
  }, __a._s = self, __a), __b.$describe((__scope.Opal)._scope.Model));
})();
