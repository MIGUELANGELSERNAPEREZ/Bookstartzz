using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using Backend.Modelos;

namespace Bookstarzz
{
    public partial class FrmGenerarReportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridExport.DataSource = new DaoUsuario().getAll();
                gridExport.DataBind();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExporttoExcel.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);


                gridExport.AllowPaging = false;
                gridExport.DataSource = new DaoUsuario().getAll();


                foreach (TableCell cell in gridExport.HeaderRow.Cells)
                {
                    cell.BackColor = gridExport.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in gridExport.Rows)
                {
                    //row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gridExport.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gridExport.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                gridExport.RenderControl(hw);


                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();

                }
        }
    }
}