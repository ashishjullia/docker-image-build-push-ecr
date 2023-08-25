# Specify the base image
FROM public.ecr.aws/lambda/python:3.10

# Set the working directory in the container
WORKDIR ${LAMBDA_TASK_ROOT}

# Copy the entire project directory to the container
COPY . .

CMD ["main.main"]
