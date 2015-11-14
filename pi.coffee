#!/usr/bin/env coffee

require 'log-a-log'

durations = require 'durations'
Decimal = require 'decimal.js'

count = 100000000

numerator = new Decimal(1)
denominator = new Decimal(1)

watch = durations.stopwatch().start()
w = durations.stopwatch().start()
for idx in [1 .. count]
  value = 2 * idx
  numerator = numerator.times(value).times(value)
  denominator = denominator.times(value - 1).times(value + 1)

  if idx % 100000 == 0
    console.log "(#{w}) (#{watch}) idx=#{idx} approximation=#{numerator.dividedBy(denominator).times(2)}"
    #console.log "(#{w}) idx=#{idx}, numerator=#{numerator}, denominator=#{denominator}"
    w.reset().start()

console.log "Numerator and denominator generation took #{watch}"

approx = numerator.dividedBy(denominator)
approx = approx.times(2)

console.log "Full computation took #{watch}"

console.log "Pi approximation: #{approx}"

