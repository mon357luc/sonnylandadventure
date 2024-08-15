using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Windows;
using INISelector.Utilities; // Adjust namespace as necessary

namespace INISelector
{
    public partial class MainWindow : Window
    {
        public Dictionary<string, Dictionary<string, string>>? Data { get; set; }
        public ObservableCollection<string> ComboBoxItems { get; set; }
        public ObservableCollection<string> ListBoxItems { get; set; }
        public MainWindow()
        {
            InitializeComponent();

            Data = INIParser.ReadINIFile(Path.Combine(Directory.GetCurrentDirectory(), "SampleINIFile.ini"));

            ComboBoxItems = new ObservableCollection<string>();
            ListBoxItems = new ObservableCollection<string>(Data.Keys);
            
            DataContext = this;
        }

        private void ListBox_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            if (ListBoxCategories.SelectedItem is string selectedKey && Data.ContainsKey(selectedKey))
            {
                ComboBoxItems.Clear();
                foreach (var kvp in Data[selectedKey])
                {
                    ComboBoxItems.Add(kvp.Key); // Add key as ComboBox item
                }
            }
        }
    }
}
