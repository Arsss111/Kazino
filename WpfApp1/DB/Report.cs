//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp1.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class Report
    {
        public int ID_Report { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> GameCount { get; set; }
        public Nullable<int> Wins { get; set; }
        public Nullable<int> Losses { get; set; }
        public Nullable<decimal> AmountResult { get; set; }
    
        public virtual User User { get; set; }
    }
}