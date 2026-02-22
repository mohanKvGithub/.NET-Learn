### dotnet-ef tool ###
dotnet tool install --global dotnet-ef

### Scaffold Command ###
dotnet ef dbcontext scaffold "Data Source=DESKTOP-KKLQNQB\SQLEXPRESS;Initial Catalog=.NetLearn;User ID=sa;Password=SqlAdm!n;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -o Models --force
