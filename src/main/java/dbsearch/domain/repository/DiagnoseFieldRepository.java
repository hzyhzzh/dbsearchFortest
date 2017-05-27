package dbsearch.domain.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dbsearch.domain.DiagnoseField;

@Repository
public class DiagnoseFieldRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<DiagnoseField> getAllDiagnoseField() {
		String hsql = "from diagnosefield";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hsql);
		return query.list();
	}
	
	public List<DiagnoseField> getAllFieldExcQT(String str) {
		String hsql = "from DiagnoseField where parent=1 and name <> '"+str+"'";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hsql);
		return query.list();
	}
	
	public boolean addDiagnoseField(DiagnoseField diagnosefield) {
		Session session = sessionFactory.openSession();
		session.save(diagnosefield);
		return true;
	}

	public DiagnoseField getDiagnoseFieldById(int id) {
		String hql = "from diagnosefield where id=?";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		query.setInteger(0, id);
		return (DiagnoseField) query.uniqueResult();
	}
	
	
	@SuppressWarnings("unchecked")
	public DiagnoseField getDiagnoseFieldByName(String name, Integer parentId) {
		String hql = "from diagnosefield where name=? and parent=?";
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery(hql);
			query.setString(0, name.trim());
			query.setInteger(1, parentId);
			query.setMaxResults(1);
			return (DiagnoseField) query.uniqueResult();
		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<DiagnoseField> getDiagnoseFieldByParent(int parent) {
		String hql = "from diagnosefield where parent=?";
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery(hql);
			query.setInteger(0, parent);
			return query.list();
		} finally {
			session.close();
		}
	}
	
	public boolean updateDiagnoseField(DiagnoseField field) {
		Session session = sessionFactory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			Object mergedEntity = session.merge(field);
			session.saveOrUpdate(mergedEntity);
			// session.update(field);
			tx.commit();
		} finally {
			session.close();
		}
		return true;
	}
	
	public boolean deleteDiagnoseField(DiagnoseField field) {
		Session session = sessionFactory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			Object mergedEntity = session.merge(field);
			session.delete(mergedEntity);
			// session.update(field);
			tx.commit();
		} finally {
			session.close();
		}
		return true;
	}
	
	public DiagnoseField getDiagnoseField(String name1Leavel, String name2Leavel) {
		if(name1Leavel == null || name2Leavel == null){
			return null;
		}
		DiagnoseField cate1 = getDiagnoseFieldByName(name1Leavel, 1);
		if (cate1 != null) {
			return getDiagnoseFieldByName(name2Leavel, cate1.getId());
		}
		return null;
	}
	
}
