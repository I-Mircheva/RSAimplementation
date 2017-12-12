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
    #2 random prime numbers
      keys = Array.new(3, 1)
      p = Prime.prime_division(rand(100)).pop[0]
      q = Prime.prime_division(rand(100)).pop[0]

      n = p*q;
      keys[0] = n
      # double count;
      totient = (p-1)*(q-1);

      # # //public key
      # # //e stands for encrypt
      # double e=2;

      # # //for checking co-prime which satisfies e > 1
      while (e = rand(totient)) && e.gcd(totient) != 1
      end

      keys[1] = e

      # # //private key
      # # //d stands for decrypt
      # double d;

      # # //k can be any arbitrary value
      # double k = 2;

      # # //choosing d such that it satisfies d*e = 1 + k * totient
      # d = (1 + (k*totient))/e;
   end

   def encrypt message
    #Message data - i
    message.split("").each do |i|
      @c = i**@e;
      @m = @c**@d;
      @c %= @n; #Encrypted data
    end
      #encrypts the message passed. The message is of type string. Encrypts each symbol of this string by using its ASCII number representation and returns the encrypted message.
   end

   def decrypt message
    message.split("").each do |i|
      @m %= @n; #Original Message Sent
    end
      #decrypts the message passed. The message is of type string. Decrypts each symbol of this string by using its ASCII number representationand returns the decrypted message.
   end
end

puts "hop"
d = gets
opa = RSA.new(1,2,d)
# puts opa.d
