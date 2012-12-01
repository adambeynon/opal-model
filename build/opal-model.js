// lib/opal/model/column.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice, __module = __opal.module, __klass = __opal.klass;
  
  return (function(__base){
    function Opal() {};
    Opal = __module(__base, "Opal", Opal);
    var Opal_prototype = Opal.prototype, __scope = Opal._scope;

    (function(__base, __super){
      function Column() {};
      Column = __klass(__base, __super, "Column", Column);

      var Column_prototype = Column.prototype, __scope = Column._scope;

      Column_prototype.$initialize = function(name, default$) {
        if (default$ == null) {
          default$ = nil
        }
        this.name = name;
        return this['default'] = this.$type_cast(default$);
      };

      Column_prototype.$type_cast = function(value) {
        
        return value;
      };

      return (function(__base, __super){
        function StringColumn() {};
        StringColumn = __klass(__base, __super, "StringColumn", StringColumn);

        var StringColumn_prototype = StringColumn.prototype, __scope = StringColumn._scope;

        return nil
      })(Column, __scope.Column);
    })(Opal, null)
    
  })(self)
})();
// lib/opal/model.rb
(function() {
  var __opal = Opal, self = __opal.top, __scope = __opal, nil = __opal.nil, __breaker = __opal.breaker, __slice = __opal.slice, __module = __opal.module, __klass = __opal.klass, __hash2 = __opal.hash2;
  
  return (function(__base){
    function Opal() {};
    Opal = __module(__base, "Opal", Opal);
    var Opal_prototype = Opal.prototype, __scope = Opal._scope;

    (function(__base, __super){
      function Model() {};
      Model = __klass(__base, __super, "Model", Model);

      ;Model._sdonate(["$add_column", "$string", "$columns"]);      var Model_prototype = Model.prototype, __scope = Model._scope;
      Model_prototype.attributes = nil;

      Model.$add_column = function(attr_name, column_klass) {
        var __a, __b, __c;
        this.$columns()['$[]='](attr_name, column_klass.$new(attr_name));
        (__b = this, __b.$define_method._p = (__a = function() {

          
          if (this.attributes == null) this.attributes = nil;

          
          return this.attributes['$[]'](attr_name)
        }, __a._s = this, __a), __b.$define_method(attr_name));
        return (__c = this, __c.$define_method._p = (__a = function(value) {

          
          if (this.attributes == null) this.attributes = nil;

          if (value == null) value = nil;

          return this.attributes['$[]='](attr_name, value)
        }, __a._s = this, __a), __c.$define_method("" + (attr_name) + "="));
      };

      Model.$string = function(attr_name) {
        
        return this.$add_column(attr_name, (__scope.Column)._scope.StringColumn)
      };

      Model.$columns = function() {
        var __a;
        if (this.columns == null) this.columns = nil;

        return ((__a = this.columns), __a !== false && __a !== nil ? __a : this.columns = __hash2([], {}))
      };

      Model_prototype.$initialize = function(attributes) {
        if (attributes == null) {
          attributes = __hash2([], {})
        }
        this.attributes = __hash2([], {});
        this.new_record = true;
        return this['$attributes='](attributes);
      };

      Model_prototype['$[]'] = function(attr_name) {
        
        return this.attributes['$[]'](attr_name);
      };

      Model_prototype['$attributes='] = function(attributes) {
        var __a, __b;
        return (__b = attributes, __b.$each._p = (__a = function(attr_name, value) {

          
          if (this.attributes == null) this.attributes = nil;

          if (attr_name == null) attr_name = nil;
if (value == null) value = nil;

          return this.attributes['$[]='](attr_name, value)
        }, __a._s = this, __a), __b.$each());
      };

      return nil;
    })(Opal, null)
    
  })(self)
})();
