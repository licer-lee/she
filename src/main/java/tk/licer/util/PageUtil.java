package tk.licer.util;

import tk.licer.model.page.EasyuiPageModel;
import tk.licer.model.page.Page;
import tk.licer.model.page.PageEasyui;

/**
 * 分页工具类
 * 
 * @author Administrator
 * 
 */
public class PageUtil {

	/**
	 * 封装easyui分页对象
	 * 
	 * @param count
	 *            总数
	 * @param data
	 * @return
	 */
	public static EasyuiPageModel convert(long count, Object data) {

		EasyuiPageModel easyuiPageModel = new EasyuiPageModel();
		easyuiPageModel.setTotal(count);
		easyuiPageModel.setRows(data);
		return easyuiPageModel;
	}

	
	/**
	 * 创建分页对象
	 * @param pe
	 * @return
	 */
	public static Page createPage(PageEasyui pe) {
		
		pe.setRows(getPageSize(pe.getRows()));
		pe.setPage(getCurrentPage(pe.getPage()));
		int totalPage = getTotalPage(pe.getRows(), pe.getTotalCount());
		int beginIndex = getBeginIndex(pe.getRows(), pe.getPage());
		boolean hasPrePage = getHasPrePage(pe.getPage());
		boolean hasNextPage = getHasNextPage(totalPage, pe.getPage());
		return new Page(pe.getRows(), pe.getTotalCount(), totalPage, pe.getPage(),
				beginIndex, hasPrePage, hasNextPage, pe.getSort(), pe.getOrder());
	}

	
	//TODO  ????
	/*public static Page createPage(Page page, int totalCount) {
		
		int everyPage = getPageSize(page.getPageSize());
		int currentPage = getCurrentPage(page.getCurrPage());
		int totalPage = getTotalPage(everyPage, totalCount);
		int beginIndex = getBeginIndex(everyPage, currentPage);
		boolean hasPrePage = getHasPrePage(currentPage);
		boolean hasNextPage = getHasNextPage(totalPage, currentPage);
		return new Page(everyPage, totalCount, totalPage, currentPage,
				beginIndex, hasPrePage, hasNextPage);
	}*/

	// 设置每页显示记录数
	public static int getPageSize(int pageSize) {
		return pageSize == 0 ? 10 : pageSize;
	}

	// 设置当前页
	public static int getCurrentPage(int currentPage) {
		return currentPage == 0 ? 1 : currentPage;
	}

	// 设置总页数,需要总记录数，每页显示多少
	public static int getTotalPage(int everyPage, int totalCount) {
		int totalPage = 0;
		if (totalCount % everyPage == 0) {
			totalPage = totalCount / everyPage;
		} else {
			totalPage = totalCount / everyPage + 1;
		}
		return totalPage;
	}

	// 设置起始点，需要每页显示多少，当前页
	public static int getBeginIndex(int everyPage, int currentPage) {
		return (currentPage - 1) * everyPage;
	}

	// 设置是否有上一页，需要当前页
	public static boolean getHasPrePage(int currentPage) {
		return currentPage == 1 ? false : true;
	}

	// 设置是否有下一个，需要总页数和当前页
	public static boolean getHasNextPage(int totalPage, int currentPage) {
		return currentPage == totalPage || totalPage == 0 ? false : true;
	}

}
