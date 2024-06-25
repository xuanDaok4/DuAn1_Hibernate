package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class KhachHang {
    private String maKH;
    private String tenKH;
    private int tuoi;
    private String gioiTinh;
    private String trangThai;
}
