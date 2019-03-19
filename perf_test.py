#!/usr/bin/env python
import time, pytesseract
from PIL import Image

def perf_time(image_path, tess_lang, tess_config=''):
    now = time.perf_counter()
    text = pytesseract.image_to_string(Image.open(image_path), lang=tess_lang, config=tess_config)
    tim = time.perf_counter() - now
    print("Image: {}, with Lang: {}, with Conf: {}, took {:.3f} seconds".format(image_path, tess_lang, tess_config, tim))
    with open('{}.{}.{:.3f}secs.txt'.format(image_path, tess_lang, tim), 'w') as f:
        f.write(text)

for img in ['{}dpi_fc.jpg'.format(x) for x in (300, 400, 600)]:
    for lang in ['chi_{}{}'.format(x,y) for x in ('sim', 'tra') for y in ('', '_fast', '_best')]+['eng']:
        print(img, lang)
        perf_time(img, lang)
