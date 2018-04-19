FROM daocloud.io/python:3.6.1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --upgrade pip
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ -r requirements.txt
ADD . /code/