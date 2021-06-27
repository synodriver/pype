# -*- coding: utf-8 -*-
from skbuild import setup


def get_dis():
    with open("README.markdown", "r", encoding="utf-8") as f:
        return f.read()


def main():
    dis = get_dis()
    setup(
        name="pype",
        version="0.1.0",
        url="https://github.com/synodriver/pytea",
        packages=['pype'],
        keywords=["game", "engine"],
        description="python binding for painterengine",
        long_description=dis,
        author='synodriver',
        author_email="diguohuangjiajinweijun@gmail.com",
        python_requires=">=3.6",
        license="BSD 3-Clause",
        install_requires=['cython'],
        classifiers=[
            "Development Status :: 3 - Alpha",
            "Operating System :: OS Independent",
            "License :: OSI Approved :: BSD License",
            "Programming Language :: C",
            "Programming Language :: Cython",
            "Programming Language :: Python",
            "Programming Language :: Python :: 3.6",
            "Programming Language :: Python :: 3.7",
            "Programming Language :: Python :: 3.8",
            "Programming Language :: Python :: 3.9",
            "Programming Language :: Python :: Implementation :: CPython"
        ],
        include_package_data=True,
        zip_safe=True
    )


if __name__ == "__main__":
    main()
