# Stage 1: Build Stage
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS build

# Remove the contents of a directory
RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*

# Set the working directory
WORKDIR /inetpub/wwwroot

# Copy files into the working directory
COPY ./WebOutput .

# Stage 2: Runtime Stage
FROM build AS runtime

# Set a placeholder value for the environment variable
ENV NEW_PLACEHOLDER "INTRO"

# Create an entrypoint script for runtime content replacement
COPY entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT ["powershell", "/entrypoint.ps1"]
