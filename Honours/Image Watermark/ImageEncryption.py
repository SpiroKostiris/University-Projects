import numpy
from numpy import *
from skimage import img_as_float
import os
import imageio
import matplotlib.pyplot as pyplot
from scipy import misc
from PIL import Image

def WM(cipher, plaintext, covertext, size, R):

    # Fuction: Watermarks an image using noise diffusion

    # Input arrays:
    # cipher - noise field image
    # plaintext - the watermark image
    # covertext - host image
    # N.B. All input arrays are taken to be of type float with
    # values ranging from 0 to 1 inclusively.

    #Parameters: size - image size (assumed to be size x size)
    # R - watermarking ratio
    
    # Ouput: watermark - watermarked image

    # Internal functions: FFT - Foward Fast Fourier Transform
    # IFFT - Inverse Fast Fourier Transform
    # MAX - Computes the maximum value
    # REAL - Extracts the real component
    # ABS - Computes the absolute value
    
    cipher = numpy.fft.fft(cipher); # Compute spectrum of cipher
    plaintex = numpy.fft.fft(plaintext); # Compute spectrum of plaintext
    powerspectrum = numpy.power(numpy.absolute(cipher), 2); # Compute Power Spectrum of cipher

    # Pre-condition power spectrum of cipher
    for i in range(size):
        for j in range(size):
            for l in range(3):
                temp = powerspectrum[i][j][l];
                if(temp == 0):
                    powerspectrum[i][j] = 1;

    # Diffuse plaintext image with pre-conditioned cipher
    # diffusion = numpy.empty([200,200],dtype=complex);
    # for i in range(_size):
    #    for j in range(_size):
    #        diffusion[i][j] = cipher[i][j]*plaintext[i][j]/powerspectrum[i][j];

    diffusion = numpy.divide(numpy.multiply(cipher,plaintext), powerspectrum);
    diffusion = numpy.real(numpy.fft.ifft(diffusion)); # Compute real part of IFFT
    diffusion = numpy.divide(diffusion,numpy.max(diffusion)); # Normalise diffused field

    # Compute the watermark
    watermark = numpy.add(numpy.multiply(R,diffusion), covertext);
    watermark = numpy.divide(watermark,numpy.max(watermark)); # Normalise for output
    return watermark;


def RECWM(cipher,watermark,covertext,plaintext,size,R):
    # Function: Recovers watermark from watermarked image

    # Input arrays: cipher - noise field image
    # watermark - watermarked image
    # covertext - host image
    # N.B. All input arrays are taken to be of type float with
    # values ranging from 0 to 1 inclusively.
    #
    # Parameters: n - image size (assumed to be size x size)

    # Output: plaintext - recovered watermark image

    # Internal functions: FFT - Forward Fast Fourier Transform
    # IFFT - Inverse Fast Fourier Transform
    # MAX - Computes the maximum value
    # REAL - Exatracts the real component
    # CONJ - Conjugates a complex array

    # Subtract covertext from watermarked image
    diffusion = numpy.zeros([200,200,3], dtype=complex);
    diffusion = numpy.subtract(watermark, covertext);

    cipher = numpy.fft.fft(cipher); # Compute spectrum of cipher
    diffusion = numpy.fft.fft(diffusion); # Compute spectrum of diffused field
    plaintext = numpy.zeros([200,200,3],dtype=complex);
    plaintext = numpy.multiply(numpy.conjugate(cipher), diffusion);
    plaintext = numpy.real(numpy.fft.ifft(plaintext)); # Compute real part of IFFT
    plaintext = numpy.divide(plaintext, numpy.max(plaintext)); # Normalise output
    return plaintext;

# Start Program
# Convert to black and white for 2 dimensions
# Normalize RGB colours to get float between 0-1
plaintext = img_as_float(Image.open('E_mc2.bmp'));
covertext = img_as_float(Image.open('Albert-Einstein.bmp'));
cipher = img_as_float(Image.open('noise.bmp'));


#print(shape(plaintext));  # (200, 200,3)
size = len(plaintext); # 200
R = 0.05;

pyplot.title("Host");
pyplot.imshow(covertext,'gray');
pyplot.show()

watermark = WM(cipher,plaintext,covertext,size,R);
pyplot.title("Watermarked");
pyplot.imshow(watermark,'gray');
pyplot.show()

convertback = RECWM(cipher,watermark,covertext,plaintext,size,R);
pyplot.title("Reverted Back");
pyplot.imshow(convertback,'gray');
pyplot.show()

