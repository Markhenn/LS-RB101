# Working with Blocks

## Example 6

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

# => [{ :c => "cat" }] 
```
### Analysis

| Line |	Action | Object |	Side Effect | Return Value |	Is Return Value Used? |
| --- | --- | --- | --- | --- | --- |
| 1 | method call <br/> select | outer array | none | based on <br/> select | no |
| 1 - 5 | outer block <br/> execution | sub hash | none | boolean | yes, select  |
| 2 | method call <br/> all? | sub hash | none | boolean | yes outer block |
| 2 - 4 | inner block <br/> exection | key, value <br/> of subhash | none | boolean | yes all? |
| 3 | method call <br/> to_s | key | none | string of <br/> symbol | yes comparison |
| 3 | reference <br/> method call | value | none | string | yes comparison |
| 3 | comparison | index 0 and <br/> return right | none | boolean | yes inner block |

