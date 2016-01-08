
require_relative "../lib/warmup"

describe "warmup tests"  do 
    
    let( :warmup ) { Warmup.new }

    let(:fake_array) do 
      double( size: 3 )
    end

    describe "#get_shout" do

        it "takes a string and returns uppercase" do
            allow(warmup).to receive(:gets).and_return("shout")
            expect { warmup.gets_shout }.to output("SHOUT\n").to_stdout
        end

    end


    describe "#triple_size" do

      it "takes in a double that accepts size method" do
        expect(warmup.triple_size(fake_array)).to eq(9)
      end

    end


    describe "#calls_some_methods" do

      it "ensures that upcase! is called" do
        string = double("String")
        expect(string).to receive(:upcase!).and_return("TETRIS")
        warmup.calls_some_methods(string)
      end


      it "ensures that reverse! is called" do
        string = "String"
        expect(string).to receive(:reverse!)
        warmup.calls_some_methods(string)
      end

      it "returns unrelated string" do
        string = "string"
        expect(warmup.calls_some_methods(string)).not_to eq("gnirts")
      end
    end

end

