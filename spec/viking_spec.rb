# Your code here

require_relative '../lib/viking'

describe "Viking"  do 
    
    let(:lars){Viking.new("Lars", 80)}

    describe "initialize" do

      it "assigns name when instantiated" do
        expect(lars.name).to eq("Lars")
      end

      it "assigns health when instantiated" do
        expect(lars.health).to eq(80)
      end

      it "weapon is default to nil" do
        expect(lars.weapon).to eq(nil)
      end

    end

    describe "can't overwrite health" do
      it "Once assigned health cannot be overwritten" do
        expect{lars.health = 200}.to raise_error NoMethodError
      end
    end

    describe "pick up weapon" do
      
      it "assigns weapon to viking" do
        random_weapon = Weapon.new("random")
        lars.pick_up_weapon(random_weapon)
        expect(lars.weapon).to eq(random_weapon)
      end

      it "assigns new weapon to viking" do
        random_weapon = Weapon.new("random")
        lars.pick_up_weapon(random_weapon)
        other_weapon = Weapon.new("other")
        lars.pick_up_weapon(other_weapon)
        expect(lars.weapon).not_to eq(random_weapon)
      end

      it "doesn't allow non weapons to be assigned" do
        random_viking = Viking.new
        expect{lars.pick_up_weapon(random_viking)}.to raise_error "Can't pick up that thing"
      end

    end

    describe "drop a weapon" do

      it "dropping a weapon, makes viking weaponless" do
        random_weapon = Weapon.new("random")
        lars.pick_up_weapon(random_weapon)
        lars.drop_weapon
        expect(lars.weapon).to eq(nil)
      end
    end

    describe "" do


    end
end