using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using INISelector.Utilities;

namespace INISelector
{
    public partial class MainWindow : Window
    {
        public Dictionary<string, Dictionary<string, string>> Data { get; set; }
        readonly int row = 0;

        public MainWindow()
        {
            InitializeComponent();

            Data = INIParser.ReadINIFile(Path.Combine(Directory.GetCurrentDirectory(), "SampleINIFile.ini"));
            
            foreach (string key in Data.Keys)
            {
                if (key.EndsWith("Default")) continue;

                MainGrid.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto});

                TextBlock keyTB = new TextBlock
                {
                    Text = key,
                    FontSize = 16,
                    FontWeight = FontWeights.Bold,
                    Margin = new Thickness(5),
                    VerticalAlignment = VerticalAlignment.Center
                };
                Grid.SetRow(keyTB, row);
                Grid.SetColumn(keyTB, 0);
                MainGrid.Children.Add(keyTB);

                ComboBox valueCB = new ComboBox
                {
                    Margin = new Thickness(5),
                    ItemsSource = Data[key].Keys
                };
                Grid.SetRow(valueCB, row);
                Grid.SetColumn(valueCB, 1);
                MainGrid.Children.Add(valueCB);

                ++row;
            }

            this.Height = row * 50;
        }
    }
}
