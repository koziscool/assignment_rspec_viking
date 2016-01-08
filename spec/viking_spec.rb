# Your code here

require_relative '../lib/viking'

describe "Viking"  do 
    
    let (:random_weapon) { Weapon.new("random") }

    let( :viking_with_weapon )  do
        Viking.new("Lars", 80, 55, random_weapon)
    end

    describe "initialize" do
      it "assigns name when instantiated" do
        expect(Viking.new.name).to eq("RandomViking")
      end

      it "assigns health when instantiated" do
        expect(Viking.new.health).to eq(100)
      end

      it "weapon is default to nil" do
        expect(Viking.new.weapon).to eq(nil)
      end
    end

    describe "can't overwrite health" do
      it "Once assigned health cannot be overwritten" do
        expect{viking_with_weapon.health = 200}.to raise_error NoMethodError
      end
    end

    describe "#pick up weapon" do
      
      it "assigns weapon to viking" do
        expect(viking_with_weapon.weapon).to eq(random_weapon)
      end

      it "assigns new weapon to viking" do
        other_weapon = Weapon.new("other")
        viking_with_weapon.pick_up_weapon(other_weapon)
        expect(viking_with_weapon.weapon).not_to eq(random_weapon)
      end

      it "doesn't allow non weapons to be assigned" do
        expect{viking_with_weapon.pick_up_weapon(Viking.new)}.to raise_error "Can't pick up that thing"
      end

    end

    describe "drop a weapon" do

      it "dropping a weapon, makes viking weaponless" do
        viking_with_weapon.drop_weapon
        expect(viking_with_weapon.weapon).to eq(nil)
      end
    end

    describe "#receive_attack" do

        it "reduces viking's health by specified amount" do 
            viking_with_weapon.receive_attack(20)
            expect(viking_with_weapon.health).to eq(60)
        end

        it "recieving attack calls take_damage" do 
            expect(viking_with_weapon).to receive(:take_damage)
            viking_with_weapon.receive_attack(20)
        end

    end
end


