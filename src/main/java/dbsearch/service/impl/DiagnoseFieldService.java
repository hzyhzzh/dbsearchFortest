package dbsearch.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dbsearch.domain.DiagnoseField;
import dbsearch.domain.repository.DiagnoseFieldRepository;

@Service
public class DiagnoseFieldService {
	@Autowired
	private DiagnoseFieldRepository diagnosefieldRepository;
	public List<DiagnoseField> getAllDiagnoseField() {
		return diagnosefieldRepository.getAllDiagnoseField();
	}

	public boolean addDiagnoseField(DiagnoseField diagnosefield) {
		return diagnosefieldRepository.addDiagnoseField(diagnosefield);
	}

	public DiagnoseField getDiagnoseFieldById(int id) {
		return diagnosefieldRepository.getDiagnoseFieldById(id);
	}
	
	public List<DiagnoseField> getDiagnoseFieldByParent(int parent){
		return diagnosefieldRepository.getDiagnoseFieldByParent(parent);
	}
	
	public boolean updateDiagnoseField(DiagnoseField diagnoseField) {
		return diagnosefieldRepository.updateDiagnoseField(diagnoseField);
	}
	
	public boolean deleteDiagnoseField(DiagnoseField diagnosefield){
		return diagnosefieldRepository.deleteDiagnoseField(diagnosefield);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<List<DiagnoseField>> getAllDiagnoseFieldViaList() {
		List retList=new ArrayList();
		
		List parentList=new ArrayList();
		
		parentList=diagnosefieldRepository.getDiagnoseFieldByParent(1);
		
		if(!parentList.isEmpty()){
			for(int i=0;i<parentList.size();i++){
				
				List tempList=new ArrayList();
				List tempList2=new ArrayList();
				DiagnoseField tempParentDiagnoseField=new DiagnoseField();
				
				tempList.add(parentList.get(i));
				tempParentDiagnoseField=(DiagnoseField)parentList.get(i);
				int parentId=tempParentDiagnoseField.getId();
				tempList2=diagnosefieldRepository.getDiagnoseFieldByParent(parentId);
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
