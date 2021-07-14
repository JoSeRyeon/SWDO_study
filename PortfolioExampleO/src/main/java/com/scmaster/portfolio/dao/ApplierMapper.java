package com.scmaster.portfolio.dao;

import com.scmaster.portfolio.vo.ApplierVO;

public interface ApplierMapper {
	
	public int applierInsert(ApplierVO applier);
	public ApplierVO applierSelectOne(String applier_id);
}
