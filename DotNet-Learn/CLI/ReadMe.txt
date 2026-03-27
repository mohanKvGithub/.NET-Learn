1) dotnet new <template> -n <ProjectName> ----> create new project with template and name
2) dotnet new list ---> list all templates available
3) dotnet sln add <PathToProject>.csproj ---> add project to solution
4) dotnet --version ---> check dotnet version
5) dotnet --list-sdks ---> list all installed SDKs
6) dotnet new sln -n MySolution ---> create new solution with name MySolution
7) dotnet sln list ---> list all projects in the solution
8) dotnet sln remove MyApp/MyApp.csproj ---> remove project from solution
9) dotnet add MyApi/MyApi.csproj reference MyLibrary/MyLibrary.csproj
10) dotnet add package Newtonsoft.Json ---> add NuGet package to project
11) dotnet add package Newtonsoft.Json --version 13.0.3  ---> add NutGet package with version
12) dotnet restore ---> Restore packages
13) dotnet build ---> Build Project
14) dotnet build MyApp.csproj ---> Build specific project
15) dotnet run ---> Run project
16) dotnet run --project MyApp/MyApp.csproj ---> Run specific project
17) dotnet watch run ---> Run project and watch for changes (hot reload)
18) dotnet clean ---> Clean project, Removes previously built files from the project.
19) dotnet publish -c Release -o "C:\Users\NISSI338\OneDrive\Documents\TestPublish" ---> Publish project in release configuration to specified output folder
20) dotnet --info ---> Display detailed information about the .NET environment, including installed SDKs and runtimes.