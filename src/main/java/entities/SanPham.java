package entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "san_pham")
@Entity
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="ma_san_pham")
    private String maSP;
    @Column(name="ten_san_pham")
    private String tenSP;
    @Column(name="trang_thai")
    private String trangThai;
    @Column(name="ngay_tao")
    private Date ngayTao;
    @Column(name="ngay_sua")
    private Date ngaySua;

    @ManyToOne
    @JoinColumn(name = "id_danh_muc")
    private DanhMuc danhMuc;

    @Override
    public String toString() {
        return "SanPham{" +
                "id=" + id +
                ", maSP='" + maSP + '\'' +
                ", tenSP='" + tenSP + '\'' +
                ", trangThai='" + trangThai + '\'' +
                ", ngayTao=" + ngayTao +
                ", ngaySua=" + ngaySua +
                ", danhMuc=" + danhMuc +
                '}';
    }
}
