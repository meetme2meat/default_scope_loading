### Default Scope Loading

The Script is only tested under `jruby-9.1.15.0` and `active_record-5.0.6`, `active_record-5.1.6` 

To Run the script

`ruby find_a_bug.rb`

### Note: 
The issue happens at random. I myself had to restart the script more than onces to reproduce the issue.

## What is the issue?

```
undefined local variable or method `default_scope_override' for #<Class:0x10e1be41>
Did you mean?  default_scope_override=
org/jruby/RubyBasicObject.java:1657:in `method_missing'
/Users/werain/.rvm/gems/jruby-9.1.15.0/gems/activerecord-5.1.6/lib/active_record/dynamic_matchers.rb:22:in `method_missing'
/Users/werain/.rvm/gems/jruby-9.1.15.0/gems/activerecord-5.1.6/lib/active_record/scoping/default.rb:111:in `build_default_scope'
/Users/werain/.rvm/gems/jruby-9.1.15.0/gems/activerecord-5.1.6/lib/active_record/scoping/named.rb:43:in `default_scoped'
/Users/werain/.rvm/gems/jruby-9.1.15.0/gems/activerecord-5.1.6/lib/active_record/scoping/named.rb:28:in `all'
/Users/werain/.rvm/gems/jruby-9.1.15.0/gems/activerecord-5.1.6/lib/active_record/querying.rb:3:in `first'
find_a_bug.rb:27:in `block in find_a_bug.rb'
/Users/werain/.rvm/gems/jruby-9.1.15.0/gems/activerecord-5.1.6/lib/active_record/connection_adapters/abstract/connection_pool.rb:408:in `with_connection'
find_a_bug.rb:25:in `block in find_a_bug.rb'
```


 ## What is the problem?
 Can be found over [here](https://github.com/rails/rails/issues/32422)
 

  
 
