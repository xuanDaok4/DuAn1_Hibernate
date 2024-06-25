package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NhanVienModel {
    private String maNv;
    private String tenNv;
    private int tuoi;
    private String gioiTinh;
    private String chucVu;


}
