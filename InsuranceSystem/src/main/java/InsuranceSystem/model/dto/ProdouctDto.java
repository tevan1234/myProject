package InsuranceSystem.model.dto;

import lombok.Data;

@Data
public class ProdouctDto {
	public int Pid;
	public String Ptype;//險種
	public Double Pprice;//年繳
	public Boolean Pstatus;// 上架中/停賣
	public int Psales;//售出件數
}