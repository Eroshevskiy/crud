using crud.pages;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace crud
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void workClick(object sender, RoutedEventArgs e)
        {
            work wor = new work();
            this.Visibility = Visibility.Hidden;
            wor.Show();

        }

        private void addClick(object sender, RoutedEventArgs e)
        {
            AddWorkers add = new AddWorkers(null);
            this.Visibility = Visibility.Hidden;
            add.Show();

        }
    }
}
