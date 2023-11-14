using crud.models;
using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для work.xaml
    /// </summary>
    public partial class work : Window
    {
        public work()
        {
            InitializeComponent();
            BDWorkers.ItemsSource = crudOlegEntities.GetContext().workers.ToList();
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            AddWorkers add = new AddWorkers(null);
            this.Visibility = Visibility.Hidden;
            add.Show();
        }

        private void Delete(object sender, RoutedEventArgs e)
        {
            var workersDell = BDWorkers.SelectedItems.Cast<workers>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {workersDell.Count()} элементов?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    crudOlegEntities.GetContext().workers.RemoveRange(workersDell);
                    crudOlegEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    BDWorkers.ItemsSource = crudOlegEntities.GetContext().workers.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            AddWorkers add = new AddWorkers((sender as Button).DataContext as workers);
            this.Visibility = Visibility.Hidden;
            add.Show(); 
        }
    }
}
