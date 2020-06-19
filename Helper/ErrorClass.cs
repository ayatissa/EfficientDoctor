using System;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Data.Entity.Infrastructure;
using System.Web;
using System.Data;
using Helper;


namespace  Helper
{
    public static class ErrorClass
    {
       
        public static string GetError(Exception ex, string ClassName, string FunctionName,Exception inner)
        {
            Log _Log = new Log();
            string ErrorDesc = "";
            string Error = "";
            string exception_name = ex.GetType().Name;

            if (exception_name == "DbEntityValidationException")
            {


                DbEntityValidationException e = (DbEntityValidationException)ex;
                foreach (var eve in e.EntityValidationErrors)
                {


                    ErrorDesc = "Entity of type " + eve.Entry.Entity.GetType().Name + " has the following validation errors:" + eve.Entry.State;
                    foreach (var ve in eve.ValidationErrors)
                    {


                        Error = ve.PropertyName + "-" + ve.ErrorMessage + "- Class Name : " + ClassName + "- Function Name : " + FunctionName + "- Date : " + DateTime.Now;
                    }
                }

            }
            else if (exception_name == "DbUpdateException")
            {
                DbUpdateException e = (DbUpdateException)ex;
                SqlException s = e.InnerException.InnerException as SqlException;
                ErrorDesc = "Error Descreption: " + s.Message;

                Error = "line No= " + s.LineNumber.ToString() + "Proc " + s.Procedure + ErrorDesc + "- Class Name : " + ClassName + "- Function Name : " + FunctionName + "- Date : " + DateTime.Now;

            }

            else
            {
                ErrorDesc = ex.Message.ToString();
                Error = "Source= " + ex.Source.ToString() + " Error Descreption: " + ErrorDesc + "- Class Name : " + ClassName + "- Function Name : " + FunctionName + "- Date : " + DateTime.Now;
            }

            if (HttpContext.Current != null)
            {
                if (inner != null)
                {
                    HttpContext.Current.Session["ErrorDetails"] = ErrorDesc + " ------- " + Error + " ------- " + inner.Message;
                    _Log.Write_Log_Data_To_TextFile("", Log.LogData_Action_Type.AppError, Error, ClassName, Log.Module_Name.Helper_Class, "Remmarks", Log.LogsSavingType.Errors);

                    return ErrorDesc + " ------- " + Error + " ------- " + inner.Message;
                }
                else
                {
                    HttpContext.Current.Session["ErrorDetails"] = ErrorDesc + " ------- " + Error + " ------- ";
                    _Log.Write_Log_Data_To_TextFile("", Log.LogData_Action_Type.AppError, Error, ClassName, Log.Module_Name.Helper_Class, "Remmarks", Log.LogsSavingType.Errors);

                    return ErrorDesc + " ------- " + Error;
                }

            }
            _Log.Write_Log_Data_To_TextFile("", Log.LogData_Action_Type.AppError, Error, ClassName, Log.Module_Name.Helper_Class, "Remmarks", Log.LogsSavingType.Errors);

            return ErrorDesc + " ------- " + Error;
        }

    }


}