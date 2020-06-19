using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Helper
{
    public static class CommonClass
    {
        public static string GetProcedureData(string ProcedureName, SqlParameter[] Parameters)
        {
            string ParametersString = "";
            foreach (SqlParameter Param in Parameters)
            {
                ParametersString = ParametersString + '@' + Param.ParameterName + ",";
            }

            string ProcedureData = ProcedureName + " " + ParametersString.Remove(ParametersString.Length - 1);

            return ProcedureData;
        }
        public static object GetDefaultValue<T>(object value)
        {


            if (value == null)
            {
                return Activator.CreateInstance(typeof(T));
            }
            else
            {
                return value;

            }

        }
        public static DataTable ToDataTable<T>(this IList<T> data)
        {
            PropertyDescriptorCollection props =
                TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            for (int i = 0; i < props.Count; i++)
            {
                PropertyDescriptor prop = props[i];
              
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(
            prop.PropertyType) ?? prop.PropertyType);
            }
            object[] values = new object[props.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = props[i].GetValue(item);
                }
                table.Rows.Add(values);
            }
            return table;
        }

    }
}
