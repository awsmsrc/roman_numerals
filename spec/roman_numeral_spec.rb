require_relative '../roman_numeral.rb'

describe RomanNumeral do
  subject { RomanNumeral.new }
  describe "#generate" do
    context "with invalid input" do
      it "validates none numerical values" do
        expect { subject.generate('z') }.to raise_error(InvalidInputError)
      end
      it "validates values are within the specified range" do
        expect { subject.generate(0) }.to raise_error(InvalidInputError)
        expect { subject.generate(4000) }.to raise_error(InvalidInputError)
      end
    end
    context "when the input is represented by a single symbol" do
      specify { subject.generate(1).should == 'I' }
      specify { subject.generate(4).should == 'IV' }
      specify { subject.generate(5).should == 'V' }
      specify { subject.generate(9).should == 'IX' }
      specify { subject.generate(10).should == 'X' }
      specify { subject.generate(40).should == 'XL' }
      specify { subject.generate(50).should == 'L' }
      specify { subject.generate(90).should == 'XC' }
      specify { subject.generate(100).should == 'C' }
      specify { subject.generate(400).should == 'CD' }
      specify { subject.generate(500).should == 'D' }
      specify { subject.generate(900).should == 'CM' }
      specify { subject.generate(1000).should == 'M' }
    end
    specify { subject.generate(3999).should == 'MMMCMXCIX' }
  end
end
