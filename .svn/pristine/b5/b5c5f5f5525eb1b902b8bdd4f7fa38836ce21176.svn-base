package kr.or.project.main.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.project.main.model.CmgRegstr;
import kr.or.project.main.model.DailyCmgSttus;
import kr.or.project.main.model.MonthCmgSttus;
import kr.or.project.main.model.NoticeInfo;
import kr.or.project.main.service.MainService;
import kr.or.project.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mapper;

	@Inject
	private SqlSession sql;
	
	@Override
	public int insertCmgRegstr(CmgRegstr cmgRegstrParam) {
		// TODO Auto-generated method stub
		try {
			return mapper.insertCmgRegstr(cmgRegstrParam);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int insertNoticeInfo(NoticeInfo noticeInfoParam) {
		// TODO Auto-generated method stub
		try {
			return mapper.insertNoticeInfo(noticeInfoParam);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public CmgRegstr selectCmgRegstr(int idx) {
		// TODO Auto-generated method stub
		try {
			return sql.selectOne("kr.or.project.mapper.MainMapper.selectCmgRegstr", idx);
			//return mapper.selectCmgRegstr(idx);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public NoticeInfo selectNoticeInfo(int idx) {
		// TODO Auto-generated method stub
		try {
			return sql.selectOne("kr.or.project.mapper.MainMapper.selectNoticeInfo", idx);
			//return mapper.selectCmgRegstr(idx);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CmgRegstr> selectAllCmgRegstr() {
		// TODO Auto-generated method stub
		try {
		return mapper.selectAllCmgRegstr();
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
		
	}

	@Override
	public List<NoticeInfo> selectAllNoticeInfo() {
		// TODO Auto-generated method stub
		try {
			return mapper.selectAllNoticeInfo();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<NoticeInfo> selectHomeNoticeInfo() {
		// TODO Auto-generated method stub
		try {
			return mapper.selectHomeNoticeInfo();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CmgRegstr> selectHomeCmgRegstr() {
		// TODO Auto-generated method stub
		try {
			return mapper.selectHomeCmgRegstr();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void updateCmgRegstr(CmgRegstr cmgRegstrParam) {
		// TODO Auto-generated method stub
		try {
			mapper.updateCmgRegstr(cmgRegstrParam);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateNoticeInfo(NoticeInfo noticeInfo) {
		// TODO Auto-generated method stub
		try {
			mapper.updateNoticeInfo(noticeInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateGoingTm(CmgRegstr cmgRegstrParam) {
		try {
			mapper.updateGoingTm(cmgRegstrParam);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public DailyCmgSttus selectDailyCmgSttus(String daily) {
		// TODO Auto-generated method stub
		try {
			return mapper.selectDailyCmgSttus(daily);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<MonthCmgSttus> selectMonthCmgSttus(String month) {
		// TODO Auto-generated method stub
		try {
			return mapper.selectMonthCmgSttus(month);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public void insertDailyCmgSttus(DailyCmgSttus dailyCmgSttusParam) {
		// TODO Auto-generated method stub
		try {
			mapper.insertDailyCmgSttus(dailyCmgSttusParam);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@Override
//	public List<NoticeInfo> selectMainInfo(NoticeInfo noticeInfo) {
//		try {
//			return mapper.selectMainInfo(noticeInfo);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}

}
