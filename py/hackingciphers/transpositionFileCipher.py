# Transposition Cipher Encrypt/Decrypt File

import time, os, sys, transpositionEncrypt, transpositionDecrypt

def main():
    #inputFilename = 'frankenstein.txt'
    inputFilename = 'frankenstein.encrypted.txt'
    # NOTE: outputFilename will overwrite an existing file.
    #outputFilename = 'frankenstein.encrypted.txt'
    outputFilename = 'frankenstein.decrypted.txt'
    myKey = 10
    #myMode = 'encrypt'
    myMode = 'decrypt'

    # If the input file doesn't exist, the program will exit.
    if not os.path.exists(inputFilename):
        print('The file %s does not exist. Quitting....' % inputFilename)
        sys.exit()

    # If the output file already exists, let the user quit.
    if os.path.exists(outputFilename):
        print('This will overwrite the file %s.  (C)ontinue or (Q)uit?' % outputFilename)
        response = input('> ')
        if not response.lower().startswith('c'):
            sys.exit()

    # Read in the message from input file
    fileObj = open(inputFilename)
    content = fileObj.read()
    fileObj.close()

    print('%sing...' % myMode.title())

    # Measure how long the encryption/decryption takes.
    startTime = time.time()

    if myMode == 'encrypt':
        translated = transpositionEncrypt.encryptMessage(myKey, content)
    elif myMode == 'decrypt':
        translated = transpositionDecrypt.decryptMessage(myKey, content)

    totalTime = round(time.time() - startTime, 2)
    print('%sion time: %s secods' % (myMode.title(), totalTime))

    #rite out the translated message to output file.
    outputFileObj = open(outputFilename, 'w')
    outputFileObj.write(translated)
    outputFileObj.close()

    print('Done %sing %s (%s characters).' % (myMode, inputFilename, len(content)))

if __name__ == '__main__':
    main()
