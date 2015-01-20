import sys,os

def help():
    print 'Usage %s [page_number] [name] [code_a] [code_b] [download]'%sys.argv[0]
    print '[download] must be true or false'

if len(sys.argv) != 6 or (sys.argv[5] != 'false' and sys.argv[5] != 'true'):
    help()
    sys.exit(-1)

PAGE_NUMBER = sys.argv[1]
NAME = sys.argv[2]
CODE_A = sys.argv[3]
CODE_B = sys.argv[4]
DOWNLOAD = sys.argv[5]


if DOWNLOAD == 'true':
    print 'Start download files'
    for page in range(0,int(PAGE_NUMBER)):
        os.system('wget http://www.pinaxo.com/viewer/render/%s/%s/%s -O %03d.jpg'%(CODE_A,page,CODE_B,page))

for page in range(0,int(PAGE_NUMBER)):
    os.system('sam2p %03d.jpg PDF: %03d.pdf'%(page,page))
    #os.system('rm %03d.jpg'%page)

os.system('pdfjoin *.pdf -o %s.pdf'%NAME)
os.system('pdfnup %s.pdf'%NAME)

sys.exit(0)
