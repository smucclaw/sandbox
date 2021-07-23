
import setuptools

with open("README.md" ,"r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="not-a-pypack_carrotsnotfound",
    version="0.0.1",
    author="alfred ang",
    author_email="not_an_actual@email.com",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/smucclaw/sandbox",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent"
    ],
    python_require=">=3.6",
)
