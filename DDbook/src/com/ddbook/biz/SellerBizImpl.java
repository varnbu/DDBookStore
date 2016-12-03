package com.ddbook.biz;

import java.util.List;

import com.ddbook.dao.SellerDao;
import com.ddbook.po.Seller;

public class SellerBizImpl implements SellerBiz{
	SellerDao sdao = new SellerDao();
	@Override
	public boolean addSeller(Seller seller) {
		String sql = "insert into sellerinfo(sname,srealname,cardId,password)values(?,?,?,?)";
		Object[] params={seller.getName(),seller.getSrealname(),seller.getCardid(),seller.getPassword()};
		return sdao.update(sql, params);
	}

	@Override
	public List<Seller> getSeller(int sid) {
		String sql = "select * from sellerinfo where sellerid="+sid;
		return sdao.query(sql, Seller.class);
	}

	@Override
	public boolean upadtePassword(int sid, String password) {
		String sql = "update sellerinfo set password = ? where sid = ?";
		Object[] params = {password,sid};
		return sdao.update(sql, params);
	}

	@Override
	public boolean updateSeller(Seller seller) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
