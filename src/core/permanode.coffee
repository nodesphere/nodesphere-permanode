lightsaber = require 'lightsaber'
{ p, type } = lightsaber
Node = require 'nodesphere'


# NOTES ON FUTURE PERMANODE IMPL:
#    @head = new Node
#    @versions = []
#    @contents = []
#    @anchors = []
#    @named_anchors = []

class Permanode
  @cache: {}

  constructor: (name, data) ->
    @class_name = 'Permanode'
    if type(name) is 'object'
      data = name
      name = null
    throw new Error "Permanode with name '#{name}' already exists" if name? and Permanode.cache[name]?
    @anchor = new Node #null, algorithm: 'permanode'
    @content = new Node data

    Permanode.cache[@address()] = @
    Permanode.cache[name] = @

  attr: (key, value) -> @content.attr key, value

  get: (key) -> @content.get key

  address: -> @anchor.address()

  @get: (name) -> Permanode.cache[name]

module.exports = Permanode
