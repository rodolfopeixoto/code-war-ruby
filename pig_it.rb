require 'pry'

def pig_it text
  text.gsub(/(\w)(\w*)(\s|$)/, '\2\1ay\3')    
end

   pig_it("Pig latin is cool")
   pig_it('Barba non facit philosophum')
   pig_it("Hic et nunc")