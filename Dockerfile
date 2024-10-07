FROM public.ecr.aws/docker/library/python:3.10

# Install PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client

# Copy requirements file and install dependencies
COPY ./requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

# Set environment variables for PostgreSQL
ENV POSTGRES_DB='amazon'
ENV POSTGRES_USER='workshop_user'
ENV POSTGRES_PASSWORD='workshop_user1'

# Set PostgreSQL and Elasticsearch host variables to your local IP address
ENV POSTGRES_HOST='172.21.15.45'
ENV POSTGRES_PORT='5435'

ENV ES_HOST='172.21.15.45'
ENV ES_PORT='9200'

# Copy the application files to the container
COPY ./ ./ 

# Set the working directory
WORKDIR src/app/
