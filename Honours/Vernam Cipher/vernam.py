# Run using python3

def cipherMessage(message,key):
    convert = "";
    i = 0;
    # Bitwise operation
    for letter in message:
        convert = convert + chr(ord(letter) ^ ord(key[i]));
        i = i + 1;
    return convert

print("Please note - there might be characters that are not visually shown when encrypting at times, therefore an automatic decryption can be done..");
msg = input("Enter a message to encrypt:\t");
key = input("Enter the key:\t");
if(len(msg) != len(key)):
    print("Please enter a valid key that matches the length of the message.");
else:
    mNumWords = msg.split(" ");
    kNumWords = key.split(" ");
    if(len(mNumWords) != len(kNumWords)):
        print("Please enter a valid key where there are as many words as in the message.");
    else:
        print("Encrypted Message (Printed Below):");
        encryptedmessage = cipherMessage(msg,key);
        print(encryptedmessage);
        
        do = input("If the encrypted message is not visible, enter 'show' to decrypt automatically. Otherwise press enter to proceed with program: ")
        if(do == "show"):
            print("Decrypted Message:");
            decryptedmessage = cipherMessage(encryptedmessage,key);
            print(decryptedmessage);
        else:
            msg = input("Enter a message to decrypt:\t");
            key = input("Enter the key:\t");
            if(len(msg) != len(key)):
                print("Please enter a valid key that matches the length of the message.");
            else:
                mNumWords = msg.split(" ");
                kNumWords = key.split(" ");
                if(len(mNumWords) != len(kNumWords)):
                    print("Please enter a valid key where there are as many words as in the message.");
                else:
                    print("Decrypted Message:");
                    decryptedmessage = cipherMessage(msg,key);
                    print(decryptedmessage);
