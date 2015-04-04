require('chai').should()
lightsaber = require 'lightsaber'
{ log, p } = lightsaber

Permanode = require '../../src/core/permanode'

describe 'Permanode', ->
  beforeEach ->
    Permanode.cache = {}

  describe 'constructor', ->
    it 'should retrieve permanodes by name', ->
      joe = new Permanode 'Joe Johnston',
        github_user: 'simple10'
        facial_hair: 'beard'
      Permanode.get('Joe Johnston').should.deep.equal joe

    it 'should retrieve permanodes by address', ->
      joe = new Permanode 'Joe Johnston',
        github_user: 'simple10'
        facial_hair: 'beard'
      Permanode.get(joe.address()).should.deep.equal joe

    it 'should allow creation of permanodes with no name', ->
      joe = new Permanode
        github_user: 'simple10'
        facial_hair: 'beard'
      Permanode.get(joe.address()).should.deep.equal joe
      Permanode.get(joe.address()).get('github_user').should.equal 'simple10'

    it 'should allow you to create and retrieve attrs on permanodes', ->
      joe = new Permanode 'Joe Johnston'
      joe.attr 'sport', 'Paragliding'
      Permanode.get('Joe Johnston').get('sport').should.equal 'Paragliding'

    xit 'should allow you to change and retrieve attrs on permanodes', ->
      joe = new Permanode 'Joe Johnston',
        facial_hair: 'beard'

      Permanode.get('Joe Johnston').get('facial_hair').should.equal 'beard'
      joe.attr 'facial_hair', 'clean shaven'
      Permanode.get('Joe Johnston').get('facial_hair').should.equal 'clean shaven'
      joe.attr 'facial_hair', null
      Permanode.get('Joe Johnston').get('facial_hair').should.equal null

    it 'should throw an error when creating a permanode with a duplicate name', ->
      (->
        new Permanode 'Joe Johnston'
        new Permanode 'Joe Johnston'
      ).should.throw Error, /Permanode with name 'Joe Johnston' already exists/

#    it 'should allow cyclic references between permanodes', ->
#      john = new Permanode
#        name: 'John Shands Senechal'
#        birthDate: '1954-06-21'
#
#      jack = new Permanode
#        name: 'Jack Senechal'
#        birthDate: '1979-06-08'
#
#      jack.attr 'father', john
#      john.attr 'son',    jack
##      p 444, jack
##
#      jack.get('father').should.deep.equal john
##      john.get('son').should.deep.equal jack
#
#    it 'should have an anchor verifiably signed by the author', ->
##       author = new TrustNode
##
##       joe = new Permanode 'Joe Johnston',
##         github_user: 'simple10'
##         facial_hair: 'beard'
#
