lightsaber = require 'lightsaber'
{ type } = lightsaber
Node = require 'nodesphere'

class Permanode
  @cache: {}

  Node.allow_values_of_class Permanode

  constructor: (name, data) ->
    if type(name) is 'object'
      data = name
      name = null
    throw new Error "Permanode with name '#{name}' already exists" if name? and Permanode.cache[name]?
#    @anchor = new Sphere
#    @algorithm = 'sha512'
    @anchor = new Node
    @content = new Node data

    Permanode.cache[@address()] = @
    Permanode.cache[name] = @

  attr: (key, value) ->
    @content.attr key, value

  get: (key) ->
    @content.get key

  address: -> @anchor.address()

  @get: (name) ->
    Permanode.cache[name]

module.exports = Permanode
