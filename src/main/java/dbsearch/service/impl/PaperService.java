package dbsearch.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dbsearch.domain.Category;
import dbsearch.domain.Paper;
import dbsearch.domain.User;
import dbsearch.domain.repository.CategoryRepository;
import dbsearch.domain.repository.PaperRepository;

@Service
public class PaperService {
	@Autowired
	private PaperRepository paperRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	
	public List<Paper> getAllPaper(){
		return paperRepository.getAllPaper();
	}
	
	public boolean addPaper(Paper paper){
		return paperRepository.addPaper(paper);
	}
	
	public Paper getPaperById(int id) {
		return paperRepository.getPaperById(id);
	}
	
	public boolean updatePaper(Paper paper) {
		return paperRepository.updatePaper(paper);
	}
	
	public boolean deletePaper(int id) {
		return paperRepository.deletePaper(id);
	}
	
	public List<Paper> getPaperByOwner(int ownerId) {
		return paperRepository.getPaperByOwner(ownerId);
	}
	
	//���ù���Ա�ϴ����ļ�Ĭ�����ͨ��
	public Paper setFileStatus(Paper paper, User user){
		if(user.getRole()==10){
			paper.setFileStatus(1);
			return paper;
		}else{
			paper.setFileStatus(0);
			return paper;
		}
		
	}
	
	/**   
	* ɾ�������ļ�   
	* @param   fileName    ��ɾ���ļ����ļ���   
	* @return �����ļ�ɾ���ɹ�����true,���򷵻�false   
	*/   
	public boolean deleteFile(String fileName,String dir){
		boolean flag=false;
		File file = new File(dir+ File.separator +fileName);
		if (file.isFile() && file.exists()) {
			file.delete();//"ɾ�������ļ�"+name+"�ɹ���"
			flag= true;
		}//"ɾ�������ļ�"+name+"ʧ�ܣ�"
		if(fileName.indexOf(".pdf")<1){//ԭ���ϴ�����word�ļ�
			fileName=fileName.substring(0, fileName.lastIndexOf('.'))+".pdf";
			File file1 = new File(dir+ File.separator +fileName);
			if (file1.isFile() && file1.exists()) {
				file1.delete();//"ɾ�������ļ�"+name+"�ɹ���"
				flag= true;
			}
		}
		return flag;
	}
	public void autoFillCategory(Paper paper){
		Category cate =  categoryRepository.getCategory(paper.getFailureBehave(), paper.getFailureCause());
		paper.setCategory(cate);
	}
}
