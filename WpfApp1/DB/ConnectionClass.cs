using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp1.DB
{
    internal class ConnectionClass
    {
        public static kazikEntities connect = new kazikEntities();
        public static GameSessions gameSessions;
        public static User user;
    }
}
