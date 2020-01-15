import sys
import numpy

if __name__ == '__main__':
    numpy.random.seed(int(sys.argv[2]))
    n = int(sys.argv[3])
    i = 0
    for line in open(sys.argv[1], "r"):
        cnt = numpy.random.poisson(lam=1)
        i += cnt
        for _ in range(cnt):
            sys.stdout.write(line)
        if i >= n:
            break