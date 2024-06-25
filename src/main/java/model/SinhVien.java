package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SinhVien {
    private String maSv;
    private String tenSv;
    private int tuoi;
    private String diaChi;

    private String gioiTinh; // radio
   private String tenLop; // load selection
}
