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
@Table (name = "ctsp")
@Entity
public class ChiTietSanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="gia_ban")
    private Double giaBan;
    @Column(name="so_luong_ton")
    private Integer soLuong;
    @Column(name="trang_thai")
    private String trangThai;
    @Column(name="ngay_tao")
    private Date ngayTao;
    @Column(name="ngay_sua")
    private Date ngaySua;

    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "id_size")
    private Size size;

    @ManyToOne
    @JoinColumn(name = "id_sp")
    private SanPham sanPham;

}
