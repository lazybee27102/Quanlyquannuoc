using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using BUS;
using DTO;

namespace PresentaionTier
{
    public partial class frmMenu : DevExpress.XtraEditors.XtraForm
    {
        public frmMenu()
        {
            InitializeComponent();
        }
        DataTable table = new DataTable();

        private void frmMenu_Load(object sender, EventArgs e)
        {

            try
            {
                btnYeuCauPhaChe.Enabled = false;
                btnThanhToan.Enabled = false;
                dgvDanhSachSanPham.DataSource = SANPHAM_BUS.sp_DanhSachSanPham();
                string NRFormat = "### ### ##0";
                dgvDanhSachSanPham.Columns[3].DefaultCellStyle.Format = NRFormat;

                addColums();
            }
            catch
            {
                MessageBox.Show("Không tìm thấy dữ liệu");
            }
            
        }

        

        private void dgvDanhSachSanPham_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.RowIndex != -1 && e.ColumnIndex != -1)
                {
                    txtSoLuong.Clear();

                    txtMaThucUong.Text = dgvDanhSachSanPham.Rows[e.RowIndex].Cells["MaSanPham"].Value.ToString();
                    txtTenThucUong.Text = dgvDanhSachSanPham.Rows[e.RowIndex].Cells["TenSanPham"].Value.ToString();
                    txtDonViBan.Text = dgvDanhSachSanPham.Rows[e.RowIndex].Cells["DonViBan"].Value.ToString();
                    txtGiaBan.Text = double.Parse(String.Format("{0:0,0}", dgvDanhSachSanPham.Rows[e.RowIndex].Cells["GiaBan"].Value.ToString())).ToString();

                    
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void txtSoLuong_KeyPress(object sender, KeyPressEventArgs e)
        {

        }

        private void txtSoTienTra_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true;
                MessageBox.Show("Không được nhập kí tự!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void txtSoTienConLai_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true;
                MessageBox.Show("Không được nhập kí tự!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void txtSoLuong_KeyPress_1(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true;
                MessageBox.Show("Không được nhập kí tự!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void txtSoTienTra_KeyPress_1(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true;
                MessageBox.Show("Không được nhập kí tự!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }

        private void txtSoTienConLai_KeyPress_1(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true;
                MessageBox.Show("Không được nhập kí tự!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
        }
        private void addColums()
        {
            DataColumn column;

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.ColumnName = "MaSanPham";
            column.ReadOnly = true;
            column.Unique = true;
            column.Caption = "Mã Sản Phẩm";
            table.Columns.Add(column);

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "TenSanPham";
            column.Caption = "Tên Sản Phẩm";
            column.ReadOnly = true;
            table.Columns.Add(column);

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.ColumnName = "SoLuong";
            column.Caption = "Số Lượng";
            table.Columns.Add(column);


            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Double");
            column.ColumnName = "GiaBan";
            column.Caption = "Giá Bán";
            column.ReadOnly = true;
            table.Columns.Add(column);

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "DonViBan";
            column.Caption = "Đơn Vị Tính";
            column.ReadOnly = true;
            table.Columns.Add(column);
            dgvDanhSachMonYeuCau.DataSource = table;

        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            if (txtMaThucUong.Text == "")
            {
                MessageBox.Show("Vui lòng chọn thức uống");
                return;
            }
            else
            {
                if (txtSoLuong.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập số lượng yêu cầu");
                    return;
                }
                else
                {

                    try
                    {
                        DataRow row = table.NewRow();
                        row["MaSanPham"] = int.Parse(txtMaThucUong.Text);
                        row["TenSanPham"] = txtTenThucUong.Text;
                        row["SoLuong"] = int.Parse(txtSoLuong.Text);
                        row["GiaBan"] = double.Parse(String.Format("{0:0,0}", txtGiaBan.Text));
                        row["DonViBan"] = (txtDonViBan.Text);
                        table.Rows.Add(row);

                        dgvDanhSachMonYeuCau.DataSource = table;

                        if (kiemtraton() == false)
                        {
                            MessageBox.Show("Nguyên liệu cung cấp cho sản phẩm này không đủ");
                            table.Clear();
                            txtTongTien.Clear();

                            return;
                        }
                        btnThanhToan.Enabled = true;

                        txtMaThucUong.Clear();
                        txtTenThucUong.Clear();
                        txtSoLuong.Clear();
                        txtDonViBan.Clear();
                        txtGiaBan.Clear();
                        tinhtongtien();
                        MessageBox.Show("Đã thêm");
                    }
                    catch
                    {
                        MessageBox.Show("Sản phẩm "+txtTenThucUong.Text.ToUpper()+" đã chọn rồi");
 
                    }
                    

                }
            }
        }

        private bool kiemtraton()
        {
            for (int i = 0; i < table.Rows.Count; i++)
            {

                int masp = int.Parse(table.Rows[i].ItemArray[0].ToString());
                long soluongban = long.Parse(table.Rows[i].ItemArray[2].ToString());

                DataTable dtb = CHITIET_SANPHAM_BUS.sp_Lay_ChiTiet_SanPham(masp);
                for (int k = 0; k < dtb.Rows.Count; k++)
                {
                    int manguyenlieu = int.Parse(dtb.Rows[k].ItemArray[1].ToString());
                    long sl_nl_phache = long.Parse(dtb.Rows[k].ItemArray[2].ToString());

                    DataTable dtb1 = NGUYENLIEU_BUS.sp_Lay_NguyenLieu(manguyenlieu);
                    long sl_ton_hientai = long.Parse(dtb1.Rows[0].ItemArray[2].ToString());

                    long sl_khau_hao = sl_nl_phache * soluongban;
                    long sl_ton_con_lai = sl_ton_hientai - sl_khau_hao;

                    if (sl_ton_con_lai < 0)
                    {
                        return false;
                    }
                }

            }
            return true;
        }

        private void tinhtongtien()
        {
            double tongtien = 0;
            for (int i = 0; i < table.Rows.Count; i++)
            {
                int sl = int.Parse(table.Rows[i].ItemArray[2].ToString());
                double gb = double.Parse(table.Rows[i].ItemArray[3].ToString());
                double tt = sl * gb;
                tongtien += tt;
            }
            txtTongTien.Text = tongtien.ToString();
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSoTheCho.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập số thẻ chờ");
                    return;
                }
                if (txtSoTienTra.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập số tiền trả");
                    return;
                }
                
                if (double.Parse(txtSoTienTra.Text) < double.Parse(txtTongTien.Text))
                {
                    MessageBox.Show("Số tiền trả chưa đủ");
                    return;
                }


                Random r = new Random();
                String mahd = ""
                    + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString()
                    + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString()
                    + DateTime.Now.Second.ToString()
                    + r.Next(1, 2000).ToString();
                int manv = 1; // xài đỡ 
                double tongtien = double.Parse(txtTongTien.Text);
                double sotientra = double.Parse(txtSoTienTra.Text);
                double tenthua = tongtien - sotientra;
                DateTime ngayhd = dtpNgayLap.Value;
                int sothe = int.Parse(txtSoTheCho.Text);
                // thêm hoá đơn
                HOADON_DTO hd = new HOADON_DTO(mahd, sothe, manv, ngayhd, tongtien, sotientra);
                HOADON_BUS.sp_Them_HoaDon(hd);
                txtSoTienConLai.Text = double.Parse(String.Format("{0:0,0}", tenthua.ToString())).ToString();
                txtMaHoaDon.Text = mahd;


                for (int i = 0; i < table.Rows.Count; i++)
                {

                    CHITIET_HOADON_DTO cthd = new CHITIET_HOADON_DTO();
                    cthd.MaHoaDon = mahd;
                    cthd.MaSanPham = int.Parse(table.Rows[i].ItemArray[0].ToString());
                    cthd.SoLuong = long.Parse(table.Rows[i].ItemArray[2].ToString());

                    //khấu hao nguyên liệu
                    DataTable dtb = CHITIET_SANPHAM_BUS.sp_Lay_ChiTiet_SanPham(cthd.MaSanPham);
                    for (int k = 0; k < dtb.Rows.Count; k++)
                    {
                        int manguyenlieu = int.Parse(dtb.Rows[k].ItemArray[1].ToString());
                        long sl_nl_phache = long.Parse(dtb.Rows[k].ItemArray[2].ToString());

                        DataTable dtb1 = NGUYENLIEU_BUS.sp_Lay_NguyenLieu(manguyenlieu);
                        long sl_ton_hientai = long.Parse(dtb1.Rows[0].ItemArray[2].ToString());

                        long sl_khau_hao = sl_nl_phache * cthd.SoLuong;
                        long sl_ton_cap_nhat = sl_ton_hientai - sl_khau_hao;

                        NGUYENLIEU_BUS.sp_CapNhat_SoLuong_NguyenLieu(manguyenlieu, sl_ton_cap_nhat);
                    }

                    // thêm chi tiết hoá đơn
                    CHITIET_HOADON_BUS.sp_Them_ChiTiet_HoaDon(cthd);
                }




                btnThem.Enabled = false;
                btnXoa.Enabled = false;
                btnCapNhat.Enabled = false;
                btnThanhToan.Enabled = false;

                // xuat hoa don o day


                btnYeuCauPhaChe.Enabled = true;
            }
            catch
            {
                MessageBox.Show("Thanh toán không thành công");
            }

        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMaThucUong.Text == "")
                {
                    MessageBox.Show("Vui lòng chọn sản phẩm để thay đổi số lượng");
                    return;
                }
                else 
                {
                    if (txtSoLuong.Text == "")
                    {
                        MessageBox.Show("Vui lòng nhập số lượng yêu cầu");
                        return;
                    }
                    
                    int rowIndex = dgvDanhSachMonYeuCau.CurrentCell.RowIndex;
                    DataGridViewRow dataRow = dgvDanhSachMonYeuCau.Rows[rowIndex];
                    dataRow.Cells["SoLuong"].Value = int.Parse(txtSoLuong.Text);
                    if (kiemtraton() == false)
                    {
                        MessageBox.Show("Nguyên liệu cung cấp cho sản phẩm này không đủ");
                        table.Clear();
                        txtTongTien.Clear();
                        return;
                    }
                    tinhtongtien();
                    MessageBox.Show("Đã cập nhật số lượng");
                }
                
            }
            catch
            {
                MessageBox.Show("Cập nhật thất bại");
            }

        }
        private void dgvDanhSachMonYeuCau_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.RowIndex != -1 && e.ColumnIndex != -1)
                {
                    txtMaThucUong.Text = dgvDanhSachMonYeuCau.Rows[e.RowIndex].Cells["MaSanPham"].Value.ToString();
                    txtTenThucUong.Text = dgvDanhSachMonYeuCau.Rows[e.RowIndex].Cells["TenSanPham"].Value.ToString();
                    txtDonViBan.Text = dgvDanhSachMonYeuCau.Rows[e.RowIndex].Cells["DonViBan"].Value.ToString();
                    txtGiaBan.Text = dgvDanhSachMonYeuCau.Rows[e.RowIndex].Cells["GiaBan"].Value.ToString();
                    txtSoLuong.Text = dgvDanhSachMonYeuCau.Rows[e.RowIndex].Cells["SoLuong"].Value.ToString();
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMaThucUong.Text == "")
                {
                    MessageBox.Show("Vui lòng chọn sản phẩm để xoá");
                    return;
                }
                else 
                { 
                    int rowIndex = dgvDanhSachMonYeuCau.CurrentCell.RowIndex;
                    dgvDanhSachMonYeuCau.Rows.RemoveAt(rowIndex);
                    txtMaThucUong.Clear();
                    txtTenThucUong.Clear();
                    txtSoLuong.Clear();
                    txtDonViBan.Clear();
                    txtGiaBan.Clear();
                    if (table.Rows.Count == 0)
                        btnThanhToan.Enabled = false;
                    tinhtongtien();

                    MessageBox.Show("Đã xoá");

                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Xoá thất bại");

            }
        }

        private void groupControl2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnYeuCauPhaChe_Click(object sender, EventArgs e)
        {

            PHIEUPHACHE_DTO ppc = new PHIEUPHACHE_DTO(int.Parse(txtSoTheCho.Text), txtMaHoaDon.Text, dtpNgayLap.Value, 0);
            PHIEUPHACHE_BUS.sp_Them_PhieuPhaChe(ppc);

            btnThem.Enabled = true;
            btnXoa.Enabled = true;
            btnCapNhat.Enabled = true;
            btnYeuCauPhaChe.Enabled = false;
            txtMaHoaDon.Clear();
            txtTongTien.Clear();
            txtSoTienTra.Clear();
            txtSoTienConLai.Clear();
            txtSoTheCho.Clear();

            table.Clear();
            

            MessageBox.Show("Đã yêu cầu pha chế cho khách hàng");
        }

        private void txtSoTheCho_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {

                e.Handled = true;
                MessageBox.Show("Không được nhập kí tự!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                
                

                
            }
        }

       

    }
}