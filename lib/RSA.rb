require 'prime'

class RSA
   def initialize n, e, d
    @n = n.to_i
    @e = e.to_i
    @d = d.to_i
   end

   def n
    @n
   end

   def e
    @e
   end

   def d
    @d
   end

   def new_key
      keys = Array.new(3, 1)
      p = Prime.prime_division(rand(100)).pop[0]
      q = Prime.prime_division(rand(100)).pop[0]

      n = p*q
      keys[0] = n

      totient = (p-1)*(q-1)

      while (e = rand(totient)) && e.gcd(totient) != 1
      end

      keys[1] = e

      k = 2
      # # //choosing d such that it satisfies d * e = 1 + k * totient
      d = (1 + (k*totient))/e
      keys[2] = d

      keys
   end

   def encrypt message
    passed = message.split("").map! { |i|
      c = (i.ord)**@e;
      i = c % @n;
    }
    passed.join(",")
   end

   def decrypt message
    passed = message.split(",").map! { |i|
      c = i.to_i ** @d
      i = c % @n; #Original Message Sent
      i = i.chr
    }
    passed.join("")
   end
end

pony = RSA.new(224, 11, 23)

p pony.encrypt("The quick brown fox jumps over the lazy dog")
p pony.decrypt(pony.encrypt("The quick brown fox jumps over the lazy dog"))
