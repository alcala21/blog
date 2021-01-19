import subprocess
import os.path


imagedir = '../../../images'
out_imagedir = '../../../static/images'
files = ['simple-broadcasting', 'matrix-vector', 'matrix-matrix', 'reshaping']


def build_if_modified(files):
    modified = False

    for file in files:
      filename = imagedir + '/' + file
      out_filename = out_imagedir + '/' + file

      if not os.path.exists(out_filename + '.png') or \
        os.path.getctime(filename + ".tex") > os.path.getctime(out_filename + '.png'):
        result = build_png(file)
        modified = True

        subprocess.run(f"rm {filename + '.aux'} {filename + '.log'}", shell=True)

    return modified



def build_png(file):
    filename = imagedir + '/' + file
    out_filename = out_imagedir + '/' + file
    # Make pdf image
    result2 = 1
    result = subprocess.run(['pdflatex', f"-output-directory={imagedir}", filename])
    if result.returncode == 0:
        result2 = subprocess.run(['convert', '-flatten', '-density', "600", filename + ".pdf", out_filename + ".png"])

    return result2


def main():
    build_if_modified(files)

main()