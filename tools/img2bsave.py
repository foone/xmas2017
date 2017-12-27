import sys,os
from PIL import Image
from itertools import izip_longest,chain
def grouper(iterable, n, fillvalue=None):
    "Collect data into fixed-length chunks or blocks"
    # grouper('ABCDEFG', 3, 'x') --> ABC DEF Gxx
    args = [iter(iterable)] * n
    return izip_longest(fillvalue=fillvalue, *args)

if len(sys.argv)!=3:
	print 'Usage: img2bsave.py <IMAGE> <DIRECTORY>'
	sys.exit()
im = Image.open(sys.argv[1])
OUTPATH=sys.argv[2]

evens,odds=[],[]
for i in range(0,100):
	for target,y in [(evens,i*2),(odds,i*2+1)]:
		line=im.crop((0,y,320,y+1))
		linenums=[ord(x) for x in line.tobytes()]
		outbytes=[(a<<6|b<<4|c<<2|d) for (a,b,c,d) in grouper(linenums,4)]
		out=''.join(chr(x) for x in outbytes)
		target.append(out)

with open(os.path.join(OUTPATH,'screen1.bsv'),'wb') as f:
	f.write('fd00b80000401f'.decode('hex'))
	for entry in evens:
		f.write(entry)

with open(os.path.join(OUTPATH,'screen2.bsv'),'wb') as f:
	f.write('fd00b80000401f'.decode('hex'))
	for entry in odds:
		f.write(entry)
