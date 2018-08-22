###################################################################################
# Author: Tirtha Subedi            

#
# Purpose: The class imports a file, encrypts the file, and exports the cipher to a new file
#           You need to implement the decrypt function.
####################################################################################
####################################################################################
import sys

class CaesarCipher:

    """ This caesarCipher will let user keep secret messages"""

    # FIXME: Add a docstring for the class definition

    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"            # The alphabet, which will be used to do our shifts

    def __init__(self, input_file = "message_input.txt", key = 0, crypt_type = "encrypt"):
        """
        A constructor for the CaesarCipher class

        :param input_file: The file to be encrypted/decrypted
        :param key: The amount each message/cipher needs shifted
        :param crypt_type: Either encrypt or decrypt
        """
        self.input_file = input_file                            # The file to be encrypted or decrypted
        self.key = key                                          # The amount each message/cipher will be shifted
        self.message = ""                                       # A placeholder for the message
        self.cipher = ""                                        # A placeholder for the cipher
        self.crypt_type = crypt_type                            # Either "encrypt" or "decrypt"
        self.import_file()                                      # Calls the import_file() method below

    def import_file(self):
        """
        Imports a file stored in the variable self.input_file

        :return: a string representing the contents of the file
        """
        f = open(self.input_file, "r")
        if self.crypt_type == "encrypt":
            self.message = f.read()                  # Set self.message to the file contents
        elif self.crypt_type == "decrypt":
            self.cipher = f.read()                   # Set self.cipher to the file contents
        f.close()

    def export_file(self, text_to_export, filename):
        """
        Exports a file called filename

        :param text_to_export: the string to be written to the exported file
        :param filename: a string representing the name of the file to be exported to
        """
        f = open(filename, "w")
        f.write(text_to_export)
        f.close()
        print("File exported to " + filename)

    def encrypt(self):
        """
        Converts an original message into a ciphered message with each letter shifted to the right by the key
        :return: a string representing the ciphertext
        """
        output = ""
        for i in self.message:
            if i.upper() in self.alphabet:
                old_letter = self.alphabet.find(i.upper())
                # Uses modulus to return the correct index for each letter after the shift
                # (for cases where the index is outside the range of self.alphabet,
                #  it wraps back to the beginning of the alphabet)
                output += self.alphabet[(old_letter + self.key) % 26]

            else:
                output += i         # Adds non-alphabet characters directly
                print(output)
        return output


    def decrypt(self):
        """
        Converts a cipher text into an original message by shifting each letter to the left by the key

        :return: a string representing the original message
        """
        # TODO Complete the decrypt method
        output = ""
        for i in self.cipher:
            if i.upper() in self.alphabet:
                old_letter = self.alphabet.find(i.upper())
                # Uses modulus to return the correct index for each letter after the shift
                # (for cases where the index is outside the range of self.alphabet,
                #  it wraps back to the beginning of the alphabet)
                output += self.alphabet[(old_letter - self.key) % 26]
            else:
                output += i
        return output         # Obviously this should output something else

def main():
    # A sample encryption
    cipher0 = CaesarCipher("message_input.txt", 2, "encrypt")   # Constructs a new CaesarCipher object called cipher0
    cipher_text0 = cipher0.encrypt()                            # Encrypts the file specified in the constructor
    cipher0.export_file(cipher_text0, "cipher_sample.txt")      # Writes the output to a file


    # Caesar has some letters to send and receive.
    # Letter 1 goes to P. Lentulus Spinther, who has agreed with Caesar to use a key of 3
    # TODO Construct a new CaesarCipher object called cipher1
    # TODO Encrypt the file specified in the constructor
    # TODO Write the output to a file
    cipher1 = CaesarCipher("letter_to_friend_1.txt", 3, "encrypt")
    cipher_text1 = cipher1.encrypt()
    cipher1.export_file(cipher_text1, "cipher_sample1.txt")

    # Letter 2 goes to Marcus Tullius Cicero, who has agreed to use a key of 14
    # TODO Construct a new CaesarCipher object called cipher2
    # TODO Encrypt the file specified in the constructor
    # TODO Write the output to a file
    cipher2 = CaesarCipher("letter_to_friend_2.txt", 14, "encrypt")
    cipher_text2 = cipher2.encrypt()
    cipher1.export_file(cipher_text2, "cipher_sample2.txt")



    # Letter 3 is coming from Cicero for Caesar to decrypt. Again, they agreed to use key 14
   # constructs a new CaesarCipher object called cipher3
    # # TODO Decrypt the file specified in the constructor
    # # TODO Write the output to a file using the export_file() method
    cipher3=CaesarCipher("letter_from_friend_3.txt", 14, "decrypt")
    cipher_text3 = cipher3.decrypt()
    cipher1.export_file(cipher_text3, "cipher_sample3.txt")

if __name__ == "__main__":
    main()
