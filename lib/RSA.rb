
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
    p = Prime.prime_division(rand(1000)).pop[0]
    q = Prime.prime_division(rand(1000)).pop[0]

    n = p*q
    keys[0] = n
    totient = (p-1)*(q-1)

    while ((e = rand(totient)) && e.gcd(totient) != 1)
    end
    keys[1] = e

    d = keys[2]

    while ((d * e)%totient != 1 && d = d + 1)
    end
    keys[2] = d

    keys
  end

  def encrypt message
    passed = message.split("").map! { |i|
      c = (i.ord)**@e
      i = c % @n
    }
    passed.join(".")
  end

  def decrypt message
    passed = message.split(".").map! { |i|
      m = i.to_i ** @d
      i = (m % @n).chr
    }
    passed.join("")
  end
end
