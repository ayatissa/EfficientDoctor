using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Configuration;

namespace Helper
{
    public class Log
    {
        /// <summary>
        /// Define the Logs flags
        /// </summary>
        public enum LogData_Action_Type
            {
            LogIn = 1,
            AccessPage = 2,
            NewTask = 3,
            ChangeStatus = 4,
            OverrideMidTerm = 5,
            OverrideCycle = 6,
            SendEmail = 7,
            DB_Transaction = 8,
            schedule_Job = 9,
            AppError = 10
            };
        public enum Module_Name
            {
            Data_Access_Layer = 1,
            Business_Access_Layer = 2,
            Data_Entity = 3,
            User_Interface = 4,
            Helper_Class = 5
            //Send_Reminder_Email_job = 6,
            //Import_Active_Directory_Job = 7
            }
        public enum LogInResult
            {
            Success = 1,
            Access_Denied = 2
            }
        public enum LogsSavingType
            {
            Errors = 1,
            Accessing_page = 2,
            Log_Data = 3,
            Emails = 4
            }

        /// <summary>
        /// This function to collect the Data in one row and prepare it to be written in text file
        /// </summary>
        /// <param name="ServiceID"></param>
        /// <param name="Action_Type"></param>
        /// <param name="Message"></param>
        /// <param name="Page_Name"></param>
        /// <param name="ModuleName"></param>
        /// <param name="Remmarks"></param>
        /// <param name="Trans_Type"></param>
        /// <returns></returns>
        public bool Write_Log_Data_To_TextFile(string ServiceID, LogData_Action_Type Action_Type, string Message, string Page_Name, Module_Name ModuleName, string Remmarks, LogsSavingType Trans_Type)
            {
            StringBuilder Text1 = new StringBuilder();
            Text1.Append(ServiceID);
            Text1.Append(";");
            Text1.Append(ServiceID);
            Text1.Append(";");
            Text1.Append(Action_Type);
            Text1.Append(";");
            Text1.Append(Message);
            Text1.Append(";");
            Text1.Append(Page_Name);
            Text1.Append(";");
            Text1.Append(ModuleName);
            Text1.Append(";");
            Text1.Append(Remmarks);
            Text1.Append(";");
            Text1.Append(DateTime.Now);

            return WriteToFile(Text1.ToString(), Trans_Type);
            }
     
        /// <summary>
        /// This function to write the Log data in the text file
        /// </summary>
        /// <param name="sText"></param>
        /// <param name="Trans_Type"></param>
        /// <returns></returns>
        public bool  WriteToFile(String sText, LogsSavingType Trans_Type  )
        {
            
           System.IO.StreamWriter writer;
           writer=null;
           System.IO.FileStream fs;
           fs=null;

            try
            {
                //create a separate file for each day
                string spath;
                spath = System.Configuration.ConfigurationSettings.AppSettings["logfolder"];
                string logpath="";
                
                if (Trans_Type==LogsSavingType.Errors) //Error
                    logpath = String.Format("{1}{2}-{0:yyyyMMdd}.txt", DateTime.Today, spath, "Errors");
                if (Trans_Type==LogsSavingType.Accessing_page) //AccesPage
                    logpath = String.Format("{1}{2}-{0:yyyyMMdd}.txt", DateTime.Today, spath, "AccessPage");
                //if (int.Parse(Trans_Type.ToString())==3) //
                //    logpath = String.Format("{1}{2}-{0:yyyyMMdd}.txt", DateTime.Today, spath, "");
                //if (int.Parse(Trans_Type.ToString())==4)
                //    logpath = String.Format("{1}{2}-{0:yyyyMMdd}.txt", DateTime.Today, spath, "");

            
                fs= new System.IO.FileStream(logpath, System.IO.FileMode.Append, System.IO.FileAccess.Write);
                writer = new System.IO.StreamWriter(fs);
                writer.WriteLine(sText);
                return true;
            }
                catch (Exception ex)
            {
                    throw (ex);
                
            }
                finally
            {
                if (writer !=null)
                 writer.Close();

                if (fs !=null)
                 fs.Close();

            }


        }

    }
}
