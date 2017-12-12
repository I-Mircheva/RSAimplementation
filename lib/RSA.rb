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
      # # //choosing d such that it satisfies d*e = 1 + k * totient
      d = (1 + (k*totient))/e
      keys[2] = d

      keys
   end

   def encrypt message
    #Message data - i
    passed = message.split("").each do |i|
      (i.ord) = (i.ord)**@e;
      @m = (i.ord)**@d;
      (i.ord) %= @n; #Encrypted data
    end
    passed.join(",")
      #encrypts the message passed. The message is of type string. Encrypts each symbol of this string by using its ASCII number representation and returns the encrypted message.
   end

   def decrypt message
    passed = message.split(",").each do |i|
      (i.to_i) = i.to_i ** @d
      i %= @n; #Original Message Sent
    end
    passed.join("")
      #decrypts the message passed. The message is of type string. Decrypts each symbol of this string by using its ASCII number representationand returns the decrypted message.
   end
end

