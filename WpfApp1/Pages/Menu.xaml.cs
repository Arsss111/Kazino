using System;
using WpfApp1.DB;
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
using QRCoder;
using System.IO;
using Telegram.Bot.Types;
using System.Drawing;
using System.Drawing.Imaging;

namespace WpfApp1.Pages
{

    public partial class Menu : Page
    {
        string _name;
        public Menu(int balance, string name)
        {
            InitializeComponent();
            _name = name;
            
        }

        private void TopUpButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Deposit(_name));
        }

        private void ProfileButton_Click(object sender, RoutedEventArgs e)
        {
            
        }

        

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == _name);
            NavigationService.Navigate(new Crash(user.Username, user.UserID));
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == _name);
            NavigationService.Navigate(new Profile(user.Username));
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == _name);
            NavigationService.Navigate(new Mometka(user.Username));
        }
    }
}
