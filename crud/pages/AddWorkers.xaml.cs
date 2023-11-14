using crud.models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace crud.pages
{
    /// <summary>
    /// Логика взаимодействия для AddWorkers.xaml
    /// </summary>
    public partial class AddWorkers : Window
    {
        private workers currentworker = new workers();
        public AddWorkers(workers sellectedWorkers)
        {
            InitializeComponent();
            if (sellectedWorkers != null)
            {
                currentworker = sellectedWorkers;
            }
            DataContext = currentworker;
        }

        private void Save(object sender, RoutedEventArgs e)
        {
            if (currentworker.id == 0)
            {
                crudOlegEntities.GetContext().workers.Add(currentworker);
            }

            DbContextTransaction dbContextTransaction = null;

            try
            {
                if (currentworker.id == 0)
                {
                    crudOlegEntities.GetContext().workers.Add(currentworker);
                }

                dbContextTransaction = crudOlegEntities.GetContext().Database.BeginTransaction();

                crudOlegEntities.GetContext().SaveChanges();

                MessageBox.Show("Информация сохранена!");
                dbContextTransaction.Commit();
                
            }
            catch (DbUpdateException ex)
            {
                if (dbContextTransaction != null)
                {
                    dbContextTransaction.Rollback();
                }

                var innerException = ex.InnerException;
                while (innerException != null)
                {
                    MessageBox.Show($"Внутреннее исключение: {innerException.Message}");
                    innerException = innerException.InnerException;
                }

                MessageBox.Show("Ошибка при сохранении изменений. Дополнительные сведения в внутреннем исключении.");
            }
            catch (Exception ex)
            {
                if (dbContextTransaction != null)
                {
                    dbContextTransaction.Rollback();
                }

                MessageBox.Show($"Ошибка при обновлении записей. Дополнительные сведения: {ex.Message}");
            }
            finally
            {
                dbContextTransaction?.Dispose();
            }
        }

        private void workClick(object sender, RoutedEventArgs e)
        {
            work wor = new work();
            Visibility = Visibility.Hidden;
            wor.Show();

        }
    }
}
