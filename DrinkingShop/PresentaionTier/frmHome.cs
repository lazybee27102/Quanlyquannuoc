using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PresentaionTier
{
    public partial class frmHome : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frmHome()
        {
            InitializeComponent();
        }
        private bool ExistForm(XtraForm form)
        {
            foreach (var child in MdiChildren)
            {
                if (child.Name == form.Name)
                {
                    child.Activate();
                    return true;

                }
            }
            return false;
        }
        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmMenu frmmenu = new frmMenu();
            if (ExistForm(frmmenu)) return;
            frmmenu.MdiParent = this;

            frmmenu.Show();
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmBill frmbill = new frmBill();
            if (ExistForm(frmbill)) return;
            frmbill.MdiParent = this;

            frmbill.Show();
        }

        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmMixing frmbill = new frmMixing();
            if (ExistForm(frmbill)) return;
            frmbill.MdiParent = this;

            frmbill.Show();
        }

        private void barButtonItem12_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmImportRequest frmbill = new frmImportRequest();
            if (ExistForm(frmbill)) return;
            frmbill.MdiParent = this;

            frmbill.Show();
        }

        private void barButtonItem10_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmImport frmbill = new frmImport();
            if (ExistForm(frmbill)) return;
            frmbill.MdiParent = this;

            frmbill.Show();
        }

        private void barButtonItem18_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmApproveImportRequest frmbill = new frmApproveImportRequest();
            if (ExistForm(frmbill)) return;
            frmbill.MdiParent = this;

            frmbill.Show();
        }

        private void barButtonItem8_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmApproveMixing frmbill = new frmApproveMixing();
            if (ExistForm(frmbill)) return;
            frmbill.MdiParent = this;

            frmbill.Show();
        }
    }
}
