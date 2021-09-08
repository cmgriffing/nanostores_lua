# nanostores_lua

This repo uses TypeScriptToLua to convert nanostores (a framework agnostic state-management library) to lua since there did not seem to be an existing equivalent.

## Installation

The easiest way to install is via Luarocks:

```
luarocks install nanostores_lua
```

## Usage

```lua

local fooStore = nanostores:createStore()
fooStore:set("bar")

-- subscribing to changes
fooStore:subscribe(function(foo, fooValue)
    print("Initial value from a subscription", fooValue)
end)

-- listen for changes without an initial value
fooStore:listen(function(foo, fooValue)
    print("Change from a listener", fooValue)
end)

-- easy getter
local value = nanostores:getValue(fooStore)
print("current foo value", value)

-- setting values
fooStore:set("baz")

```

The [nanostores documentation](https://github.com/nanostores/nanostores) can help demonstrate what else is possible even though the syntax is slightly different.

## Contributing

To get up and running for development you will need Node.js. 14.x is the current preferred version.

```
npm install
```

or

```
yarn
```

### Building

To build the src directory from the latest nanostores repo, run:

```
npm run build
```

OR

```
yarn build
```

## License

Copyright 2021 Chris Griffing

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
