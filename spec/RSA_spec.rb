require 'rspec'
require 'spec_helper'

describe RSA do

  msg = "Hello world!"
    rsa = RSA.new(2231, 181, 1021)
    new_keys = rsa.new_key
    rsa_rand = RSA.new(new_keys[0], new_keys[1], new_keys[2])

      it "Tries if return n works" do
        expect(rsa.n).to eq(2231)
      end

      it "Tries if return e works" do
        expect(rsa.e).to eq(181)
      end

      it "Tries if return d works" do
        expect(rsa.d).to eq(1021)
      end

      it "Tries if crypt changes message to right numbers" do
        expect(rsa.encrypt("abc")).to eq "388.1359.247"
      end

      it "Tries if crypt/decrypt works" do
        expect(rsa.decrypt(rsa.encrypt(msg))).to eq(msg)
      end

      it "Tries if crypt/decrypt works with random keys" do
        expect(rsa_rand.decrypt(rsa_rand.encrypt(msg))).to eq(msg)
      end

      it "Tries if crypt/decrypt works with long message" do
        msg = "@#(SD(J!NC(@asdfomg.;51483lo lel {}:\" :))))2412561sdf"
        expect(rsa_rand.decrypt(rsa_rand.encrypt(msg))).to eq(msg)
      end

end
