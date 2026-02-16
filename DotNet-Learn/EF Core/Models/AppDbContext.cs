using Microsoft.EntityFrameworkCore;

namespace EF_Core.Models;

public class AppDbContext:DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> o):base(o)
    {
        
    }
    public virtual DbSet<Customers> Customers { get; set; }
    public virtual DbSet<OrderItems> OrderItems { get; set; }
    public virtual DbSet<Orders> Orders { get; set; }
    public virtual DbSet<Payments> Payments { get; set; }
    public virtual DbSet<Products> Products { get; set; }
}
