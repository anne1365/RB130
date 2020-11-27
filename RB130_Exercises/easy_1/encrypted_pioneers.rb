
def decrypt_rot13(encrypted_arr)
  decrypted_arr = []
  
  encrypted_arr.each do |string|
    new_word = ''
    
    string.chars.each do |char|
      new_letter = ' '
      (/[A-Za-z]/).match?(char) ? 13.times { new_letter = char.next!.chars.last } : new_letter = char
      new_word << new_letter
    end
    
    decrypted_arr << new_word
  end
  
  decrypted_arr.join(' ')
end

string = ["uryyb"]
ENCRYPTED_PIONEERS = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'
].freeze

p decrypt_rot13(string)
p decrypt_rot13(ENCRYPTED_PIONEERS)


puts 'a'.ord + 13
p 110.chr
