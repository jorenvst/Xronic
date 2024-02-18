using mobiletimeapp.ViewModels;
using System.ComponentModel;
using Xamarin.Forms;

namespace mobiletimeapp.Views
{
    public partial class ItemDetailPage : ContentPage
    {
        public ItemDetailPage()
        {
            InitializeComponent();
            BindingContext = new ItemDetailViewModel();
        }
    }
}