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
using WpfApp1.DB;

namespace WpfApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для Admin.xaml
    /// </summary>
    public partial class Admin : Page
    {
        private string _name;
        public Admin(string name)
        {
            InitializeComponent();
            _name = name;
            var user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == _name);
            ListCactus.ItemsSource = ConnectionClass.connect.User.ToList();
        }
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ListCactus_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var a = ListCactus.SelectedItem as User;
            if (a != null)
            {
                NavigationService.Navigate(new Profile(a.Username));
            }
        }
        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
