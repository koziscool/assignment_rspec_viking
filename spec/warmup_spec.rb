
require_relative "../lib/warmup"

describe "warmup tests"  do 
    
    let( :warmup ) { Warmup.new }

    let(:fake_array) do 
      double( size: 3 )
    end

    let(:some_string) {  "tetris"  } 

    let(:loud_string) {  some_string }

    describe "#get_shout" do

        it "takes a string and returns uppercase" do
            allow(warmup).to receive(:gets).and_return("shout")
            expect { warmup.gets_shout }.to output("SHOUT\n").to_stdout
            # expect(warmup.gets_shout).to eq("SHOUT")
        end

    end


    describe "#triple_size" do

      it "takes in a double that accepts size method" do
        expect(warmup.triple_size(fake_array)).to eq(9)
      end

    end

  

    describe "#calls_some_methods" do

      it "ensures that upcase! is called" do
        expect(some_string).to receive(:upcase!).and_return("TETRIS")
        warmup.calls_some_methods(some_string)
      end

      it "ensures that reverse! is called" do
        allow(some_string).to receive(:upcase!).and_return(loud_string)
        expect(some_string).to receive(:reverse!)
        warmup.calls_some_methods(some_string)
      end

      it "returns unrelated string" do
        allow(some_string).to receive(:upcase!).and_return(loud_string)
        expect(warmup.calls_some_methods(some_string)).not_to eq("SIRTET")
      end

    end

end

