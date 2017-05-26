package dbsearch.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dbsearch.domain.Category;
import dbsearch.domain.repository.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;
	
	public List<Category> getAllCategory() {
		return categoryRepository.getAllCategory();
	}

	public boolean addCategory(Category category) {
		return categoryRepository.addCategory(category);
	}

	public Category getCategoryById(int id) {
		return categoryRepository.getCategoryById(id);
	}
	
	public List<Category> getCategoryByParent(int parent){
		return categoryRepository.getCategoryByParent(parent);
	}
	
	public boolean updateCategory(Category category) {
		return categoryRepository.updateCategory(category);
	}
	
	public boolean deleteCategory(Category category){
		return categoryRepository.deleteCategory(category);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<List<Category>> getAllCategoryViaList() {
		List retList=new ArrayList();
		//��ȡһ�����
		List parentList=new ArrayList();
		parentList=categoryRepository.getCategoryByParent(1);
		//����ÿһ��һ��������ѯ���Ӧ�Ķ�����𣬲�����Ӧ��һ�������������һ��templist�У�Ȼ������templist����retList��Ϊ����ֵ��
		if(!parentList.isEmpty()){
			for(int i=0;i<parentList.size();i++){
				//���������м���ɶ���
				List tempList=new ArrayList();
				List tempList2=new ArrayList();
				Category tempParentCategory=new Category();
				
				tempList.add(parentList.get(i));
				tempParentCategory=(Category)parentList.get(i);
				int parentId=tempParentCategory.getId();
				tempList2=getCategoryByParent(parentId);
				if(!tempList2.isEmpty()){
					for(int k=0;k<tempList2.size();k++){
						tempList.add(tempList2.get(k));
					}
				}
				retList.add(tempList);
			}
		}
		return retList;
	}
}
