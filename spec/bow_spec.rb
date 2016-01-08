# Your code here

require_relative "../lib/weapons/bow"

describe "Bow" do 

    let(:bow) { Bow.new }

    describe "#arrows" do 
        
        it "readable" do 
            expect(bow.arrows).to be_a(Integer)
        end

        it "initializes to 10" do 
            expect(bow.arrows).to eq(10)
        end

        it "initializes to parameter" do 
            other_bow = Bow.new(15)
            expect(other_bow.arrows).to eq(15)
        end
    end

    describe "#use" do 
        it "bow use reduces arrows by one" do 
            expect{ bow.use }.to change(bow, :arrows).by(-1)
        end    

        it "bow use throws error if out of arrows" do
            other_bow = Bow.new(0)
            expect{ other_bow.use }.to raise_error "Out of arrows"
        end    
    end

end
