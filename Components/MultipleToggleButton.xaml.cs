using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using FontAwesome.WPF.Converters;
using FontAwesome.WPF;
using System.Drawing;
namespace ForksnSpoons.Components
{
    /// <summary>
    /// Логика взаимодействия для MultipleToggleButton.xaml
    /// </summary>
    public partial class MultipleToggleButton : UserControl
    {
        public List<string> states = new List<string>();
        private int StateIndex { get; set; } = 0;
        public Style Style
        {
            get { return ToggleControl.Style; }
            set { ToggleControl.Style = value; }
        }
        public ControlTemplate Template
        {
            get { return ToggleControl.Template; }
            set { ToggleControl.Template = value; }
        }
        public  object ButtonContent 
        { 
            get { return ToggleControl.Content; } 
            set { ToggleControl.Content = value; }
        }
        public string State 
        { 
            get 
            {
                return states.ElementAtOrDefault(StateIndex);
            }
        }
        public event RoutedEventHandler Click
        {
            add { ToggleControl.Click += value; }
            remove { ToggleControl.Click -= value; }
        }
        public static readonly RoutedEvent ClickEvent = EventManager.RegisterRoutedEvent(
                                                                                    "Click", 
                                                                                    RoutingStrategy.Bubble, 
                                                                                    typeof(RoutedEventHandler), 
                                                                                    typeof(MultipleToggleButton));
        public MultipleToggleButton()
        {
            DataContext = this;
            InitializeComponent();
            ToggleControl.Click += Toggle;
            
            Icon.Icon = FontAwesome.WPF.FontAwesomeIcon.Minus;
        }
        private void Toggle(object sender, RoutedEventArgs e)
        {
            if (StateIndex == states.Count() - 1) 
            {
                StateIndex = 0;
            }
            else
            {
                StateIndex++;
            }
            Icon.Icon = getIconFromString();
        }
        FontAwesomeIcon getIconFromString()
        {
            return (FontAwesomeIcon)Enum.Parse(typeof(FontAwesomeIcon), State);
        }

        
    }
}
