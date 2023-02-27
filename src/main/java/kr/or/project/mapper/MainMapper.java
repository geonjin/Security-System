package kr.or.project.mapper;

import java.util.List;

import kr.or.project.annotation.MariaDbMapper;
import kr.or.project.main.model.CmgRegstr;
import kr.or.project.main.model.DailyCmgSttus;
import kr.or.project.main.model.MonthCmgSttus;
import kr.or.project.main.model.NoticeInfo;

@MariaDbMapper
public interface MainMapper {
	
//	public List<NoticeInfo> selectMainInfo(NoticeInfo noticeInfo) throws Exception;

	public void updateCmgRegstr(CmgRegstr cmgRegstrParam);
	public void updateNoticeInfo(NoticeInfo noticeInfo);
	public void updateGoingTm(CmgRegstr cmgRegstrParam);
	
	
	public int insertCmgRegstr(CmgRegstr cmgRegstrParam);
	public int insertNoticeInfo(NoticeInfo noticeInfoParam);
	public void insertDailyCmgSttus(DailyCmgSttus dailyCmgSttusParam);


	public List<NoticeInfo> selectHomeNoticeInfo();
	public List<NoticeInfo> selectAllNoticeInfo();

	public List<CmgRegstr> selectHomeCmgRegstr();
	public List<CmgRegstr> selectAllCmgRegstr();
	public CmgRegstr selectCmgRegstr(int idx);
	public NoticeInfo selectNoticeInfo(int idx);
	public DailyCmgSttus selectDailyCmgSttus(String daily);
	public List<MonthCmgSttus> selectMonthCmgSttus(String month);
	
}
