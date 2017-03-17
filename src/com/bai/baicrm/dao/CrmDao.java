package com.bai.baicrm.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bai.baicrm.entity.Client;
import com.bai.baicrm.entity.ClientCommunications;
import com.bai.baicrm.entity.User;

@Repository
public class CrmDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Transactional
	public void addFutClient(Client client, ClientCommunications client2) {
		entityManager.persist(client);
		entityManager.persist(client2);
	}

	@Transactional
	public void addExistClient(Client client, ClientCommunications client2) {
		entityManager.persist(client);
		entityManager.persist(client2);
	}

	@Transactional
	public void addPastClient(Client client, ClientCommunications client2) {
		entityManager.persist(client);
		entityManager.persist(client2);
	}

	@Transactional
	public List<User> getUserAuth(String name, String pswd) {
		String jsql = "Select o from User as o where o.name='" + name
				+ "' and o.pswd='" + pswd + "'";
		Query query = entityManager.createQuery(jsql);
		@SuppressWarnings("unchecked")
		List<User> list = query.getResultList();
		return list;
	}

	@Transactional
	public List<Client> getClientInfo(String value) {
		if (value == "") {
			String jsql1 = "Select c from Client as c where c.typeofclient='future'";
			Query query1 = entityManager.createQuery(jsql1);
			@SuppressWarnings("unchecked")
			List<Client> list = query1.getResultList();
			return list;
		} else {
			String jsql1 = "Select f from Client as f where (f.id LIKE '%"+ value +"%' OR f.name LIKE '%"
					+ value + "%' OR f.turnover LIKE '%" + value
					+ "%' OR f.location LIKE '%" + value
					+ "%' OR f.country LIKE '%" + value
					+ "%' OR f.contactperson LIKE '%" + value
					+ "%') AND f.typeofclient='future'";
			Query query1 = entityManager.createQuery(jsql1);
			@SuppressWarnings("unchecked")
			List<Client> list = query1.getResultList();
			return list;
		}
	}

	@Transactional
	public List<Client> getExistingClientInfo(String value) {
		if (value == "") {
			String jsql = "Select c from Client as c where c.typeofclient='exist'";
			Query query = entityManager.createQuery(jsql);
			@SuppressWarnings("unchecked")
			List<Client> list = query.getResultList();
			return list;
		} else {
			String jsql = "Select e from Client as e where (e.id LIKE '%"+ value +"%' OR e.name LIKE '%"
					+ value + "%' OR e.turnover LIKE '%" + value
					+ "%' OR e.location LIKE '%" + value
					+ "%' OR e.country LIKE '%" + value
					+ "%' OR e.assignment='" + value + "' OR e.assignsector='"
					+ value + "' OR e.contactperson='" + value
					+ "') AND e.typeofclient='exist'";
			Query query = entityManager.createQuery(jsql);
			@SuppressWarnings("unchecked")
			List<Client> list = query.getResultList();
			return list;
		}
	}

	@Transactional
	public List<Client> getPastClientInfo(String value) {
		if (value == "") {
			String jsql = "Select c from Client as c where c.typeofclient='past'";
			Query query = entityManager.createQuery(jsql);
			@SuppressWarnings("unchecked")
			List<Client> list = query.getResultList();

			return list;
		} else {
			String jsql = "Select p from Client as p where (p.id LIKE '%"+ value +"%' OR p.name='" + value
					+ "' OR p.turnover='" + value + "' OR p.location='" + value
					+ "' OR p.country='" + value + "' OR p.assignment='"
					+ value + "' OR p.assignsector='" + value
					+ "' OR p.contactperson='" + value
					+ "') AND p.typeofclient='past'";
			Query query = entityManager.createQuery(jsql);
			@SuppressWarnings("unchecked")
			List<Client> list = query.getResultList();
			return list;
		}
	}

	@Transactional
	public <E> E get(Class<E> classname, Serializable pk) {

		E e = (E) entityManager.find(classname, pk); // select based on primary
														// key pk
		return e;
	}

	@Transactional
	public <E> List<E> getAll(Class<E> classname) {

		String jsql = "Select o from " + classname.getName() + " as o";
		Query query = entityManager.createQuery(jsql);
		@SuppressWarnings("unchecked")
		List<E> list = query.getResultList();
		return list;
	}

	@Transactional
	public void updateFutClient(Client future, ClientCommunications future2) {
		String turnover = future.getTurnover();
		long noe = future.getNoe();
		String name = future.getName();
		String address = future.getAddress();
		String location = future.getLocation();
		String country = future.getCountry();
		String poc = future.getContactperson();
		String type = future.getTypeofclient();
		String clientPoc = future.getClientcontact();
		String cPocNum = future.getClientnumber();
		String cPocId= future.getClientemail();
		String serviceType= future.getServicetype();
		String id = future.getId();

		entityManager.merge(future2);

		String jsql1 = "Update Client as f SET f.turnover='" + turnover
				+ "' where f.id='" + id + "'";
		String jsql2 = "Update Client as f SET f.noe='" + noe
				+ "' where f.id='" + id + "'";
		String jsql4 = "Update Client as f SET f.address='" + address
				+ "' where f.id='" + id + "'";
		String jsql5 = "Update Client as f SET f.name='" + name
				+ "' where f.id='" + id + "'";
		String jsql6 = "Update Client as f SET f.location='" + location
				+ "' where f.id='" + id + "'";
		String jsql7 = "Update Client as f SET f.country='" + country
				+ "' where f.id='" + id + "'";
		String jsql8 = "Update Client as f SET f.contactperson='" + poc
				+ "' where f.id='" + id + "'";
		String jsql9 = "Update Client as f SET f.typeofclient='" + type
				+ "' where f.id='" + id + "'";
		String jsql10 = "Update Client as f SET f.clientcontact='" + clientPoc
				+ "' where f.id='" + id + "'";
		String jsql11 = "Update Client as f SET f.clientnumber='" + cPocNum
				+ "' where f.id='" + id + "'";
		String jsql12 = "Update Client as f SET f.clientemail='" + cPocId
				+ "' where f.id='" + id + "'";
		String jsql13 = "Update Client as f SET f.servicetype='" + serviceType
				+ "' where f.id='" + id + "'";

		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query4 = entityManager.createQuery(jsql4);
		Query query5 = entityManager.createQuery(jsql5);
		Query query6 = entityManager.createQuery(jsql6);
		Query query7 = entityManager.createQuery(jsql7);
		Query query8 = entityManager.createQuery(jsql8);
		Query query9 = entityManager.createQuery(jsql9);
		Query query10 = entityManager.createQuery(jsql10);
		Query query11 = entityManager.createQuery(jsql11);
		Query query12 = entityManager.createQuery(jsql12);
		Query query13 = entityManager.createQuery(jsql13);

		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result4 = query4.executeUpdate();
		int result5 = query5.executeUpdate();
		int result6 = query6.executeUpdate();
		int result7 = query7.executeUpdate();
		int result8 = query8.executeUpdate();
		int result9 = query9.executeUpdate();
		int result10 = query10.executeUpdate();
		int result11 = query11.executeUpdate();
		int result12 = query12.executeUpdate();
		int result13 = query13.executeUpdate();

		int result = result1 + result2 + result4 + result5 + result6 + result7
				+ result8 + result9+ result10+ result11+ result12+ result13;

		System.out.println("Columns affected are " + result);
	}

	@Transactional
	public void updateExistClient(Client exist, ClientCommunications exist2) {
		String turnover = exist.getTurnover();
		long noe = exist.getNoe();
		String assignment = exist.getAssignment();
		String assignsector = exist.getAssignsector();
		String assignyear = exist.getAssignyear();
		String name = exist.getName();
		String address = exist.getAddress();
		String location = exist.getLocation();
		String country = exist.getCountry();
		String poc = exist.getContactperson();
		String clientPoc = exist.getClientcontact();
		String cPocNum = exist.getClientnumber();
		String cPocId= exist.getClientemail();
		String type = exist.getTypeofclient();
		String serviceType= exist.getTypeofclient();
		String id = exist.getId();

		entityManager.merge(exist2);

		String jsql1 = "Update Client as e SET e.turnover='" + turnover
				+ "' where e.id='" + id + "'";
		String jsql2 = "Update Client as e SET e.noe='" + noe
				+ "' where e.id='" + id + "'";
		String jsql3 = "Update Client as e SET e.assignment='" + assignment
				+ "' where e.id='" + id + "'";
		String jsql4 = "Update Client as e SET e.assignsector='" + assignsector
				+ "' where e.id='" + id + "'";
		String jsql5 = "Update Client as e SET e.assignyear='" + assignyear
				+ "' where e.id='" + id + "'";
		String jsql6 = "Update Client as e SET e.name='" + name
				+ "' where e.id='" + id + "'";
		String jsql7 = "Update Client as e SET e.address='" + address
				+ "' where e.id='" + id + "'";
		String jsql8 = "Update Client as e SET e.location='" + location
				+ "' where e.id='" + id + "'";
		String jsql9 = "Update Client as e SET e.country='" + country
				+ "' where e.id='" + id + "'";
		String jsql10 = "Update Client as e SET e.contactperson='" + poc
				+ "' where e.id='" + id + "'";
		String jsql11 = "Update Client as e SET e.clientcontact='" + clientPoc
				+ "' where e.id='" + id + "'";
		String jsql12 = "Update Client as e SET e.clientnumber='" + cPocNum
				+ "' where e.id='" + id + "'";
		String jsql13 = "Update Client as e SET e.clientemail='" + cPocId
				+ "' where e.id='" + id + "'";
		String jsql14 = "Update Client as e SET e.typeofclient='" + type
				+ "' where e.id='" + id + "'";
		String jsql15 = "Update Client as e SET e.servicetype='" + serviceType
				+ "' where e.id='" + id + "'";

		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query3 = entityManager.createQuery(jsql3);
		Query query4 = entityManager.createQuery(jsql4);
		Query query5 = entityManager.createQuery(jsql5);
		Query query6 = entityManager.createQuery(jsql6);
		Query query7 = entityManager.createQuery(jsql7);
		Query query8 = entityManager.createQuery(jsql8);
		Query query9 = entityManager.createQuery(jsql9);
		Query query10 = entityManager.createQuery(jsql10);
		Query query11 = entityManager.createQuery(jsql11);
		Query query12 = entityManager.createQuery(jsql12);
		Query query13 = entityManager.createQuery(jsql13);
		Query query14 = entityManager.createQuery(jsql14);
		Query query15 = entityManager.createQuery(jsql15);

		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result3 = query3.executeUpdate();
		int result4 = query4.executeUpdate();
		int result5 = query5.executeUpdate();
		int result6 = query6.executeUpdate();
		int result7 = query7.executeUpdate();
		int result8 = query8.executeUpdate();
		int result9 = query9.executeUpdate();
		int result10 = query10.executeUpdate();
		int result11 = query11.executeUpdate();
		int result12 = query12.executeUpdate();
		int result13 = query13.executeUpdate();
		int result14 = query14.executeUpdate();
		int result15 = query15.executeUpdate();

		int result = result1 + result2 + result3 + result4 + result5 + result6
				+ result7 + result8 + result9 + result10 + result11+ result12+ result13+ result14+ result15;

		System.out.println("Columns affected are " + result);
	}

	@Transactional
	public List<Client> getClosedClientInfo(String value) {
		if (value == "") {
			String jsql = "Select c from Client as C where c.typeofclient='closed'";
			Query query = entityManager.createQuery(jsql);
			@SuppressWarnings("unchecked")
			List<Client> list = query.getResultList();
			return list;
		} else {
			String jsql = "Select cc from Client as cc where (cc.id LIKE '%"+ value +"%' OR cc.name LIKE '%" + value
					+ "%' OR cc.turnover LIKE '%" + value + "%' OR cc.location LIKE '%" + value
					+ "%' OR cc.country LIKE '%" + value + "%' OR cc.contactperson LIKE '%"
					+ value + "%') AND cc.typeofclient='closed' ";
			Query query = entityManager.createQuery(jsql);
			@SuppressWarnings("unchecked")
			List<Client> list = query.getResultList();
			return list;
		}
	}

	@Transactional
	public void updatePastClient(Client past, ClientCommunications past2) {

		String turnover = past.getTurnover();
		long noe = past.getNoe();
		String name = past.getName();
		String address = past.getAddress();
		String location = past.getLocation();
		String country = past.getCountry();
		String poc = past.getContactperson();
		String clientPoc = past.getClientcontact();
		String cPocNum = past.getClientnumber();
		String cPocId= past.getClientemail();
		String type = past.getTypeofclient();
		String serviceType= past.getServicetype();
		String id = past.getId();

		entityManager.merge(past2);

		String jsql1 = "Update Client as p SET p.turnover='" + turnover
				+ "' where p.id='" + id + "'";
		String jsql2 = "Update Client as p SET p.noe='" + noe
				+ "' where p.id='" + id + "'";
		String jsql6 = "Update Client as p SET p.name='" + name
				+ "' where p.id='" + id + "'";
		String jsql7 = "Update Client as p SET p.address='" + address
				+ "' where p.id='" + id + "'";
		String jsql8 = "Update Client as p SET p.location='" + location
				+ "' where p.id='" + id + "'";
		String jsql9 = "Update Client as p SET p.country='" + country
				+ "' where p.id='" + id + "'";
		String jsql10 = "Update Client as p SET p.contactperson='" + poc
				+ "' where p.id='" + id + "'";
		String jsql11 = "Update Client as p SET p.clientcontact='" + clientPoc
				+ "' where p.id='" + id + "'";
		String jsql12 = "Update Client as p SET p.clientnumber='" + cPocNum
				+ "' where p.id='" + id + "'";
		String jsql13 = "Update Client as p SET p.clientemail='" + cPocId
				+ "' where p.id='" + id + "'";
		String jsql14 = "Update Client as p SET p.typeofclient='" + type
				+ "' where p.id='" + id + "'";
		String jsql15 = "Update Client as p SET p.servicetype='" + serviceType
				+ "' where p.id='" + id + "'";

		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query6 = entityManager.createQuery(jsql6);
		Query query7 = entityManager.createQuery(jsql7);
		Query query8 = entityManager.createQuery(jsql8);
		Query query9 = entityManager.createQuery(jsql9);
		Query query10 = entityManager.createQuery(jsql10);
		Query query11 = entityManager.createQuery(jsql11);
		Query query12 = entityManager.createQuery(jsql12);
		Query query13 = entityManager.createQuery(jsql13);
		Query query14 = entityManager.createQuery(jsql14);
		Query query15 = entityManager.createQuery(jsql15);

		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result6 = query6.executeUpdate();
		int result7 = query7.executeUpdate();
		int result8 = query8.executeUpdate();
		int result9 = query9.executeUpdate();
		int result10 = query10.executeUpdate();
		int result11 = query11.executeUpdate();
		int result12 = query12.executeUpdate();
		int result13 = query13.executeUpdate();
		int result14 = query14.executeUpdate();
		int result15 = query15.executeUpdate();

		int result = result1 + result2 + result6 + result7 + result8 + result9
				+ result10 + result11+ result12+ result13+ result14+ result15;

		System.out.println("Columns affected are " + result);

	}

	@Transactional
	public void deletePastClients(String id) {
		// TODO Auto-generated method stub
		String jsql1 = "Delete from ClientCommunications cc where cc.client='"
				+ id + "'";
		String jsql2 = "Delete from AttachedFiles af where af.client='" + id
				+ "'";
		String jsql3 = "Delete from Client c where c.id='" + id + "'";

		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query3 = entityManager.createQuery(jsql3);

		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result3 = query3.executeUpdate();

		int result = result1 + result2 + result3;

		System.out.println("Columns affected are " + result);
	}

	@Transactional
	public void deleteExistClients(String id) {
		// TODO Auto-generated method stub
		String jsql1 = "Delete from ClientCommunications cc where cc.client='"
				+ id + "'";
		String jsql2 = "Delete from AttachedFiles af where af.client='" + id
				+ "'";
		String jsql3 = "Delete from Client c where c.id='" + id + "'";

		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query3 = entityManager.createQuery(jsql3);

		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result3 = query3.executeUpdate();

		int result = result1 + result2 + result3;

		System.out.println("Columns affected are " + result);
	}

	@Transactional
	public void deleteFutureClients(String id) {
		// TODO Auto-generated method stub
		String jsql1 = "Delete from ClientCommunications cc where cc.client='"
				+ id + "'";
		String jsql2 = "Delete from AttachedFiles af where af.client='" + id
				+ "'";
		String jsql3 = "Delete from Client c where c.id='" + id + "'";

		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query3 = entityManager.createQuery(jsql3);

		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result3 = query3.executeUpdate();

		int result = result1 + result2 + result3;

		System.out.println("Columns affected are " + result);
	}

	@Transactional
	public void updateFutComm(ClientCommunications future) {
		// TODO Auto-generated method stub

		String commDate = future.getDate();
		String comm = future.getComm();
		String remDate = future.getRemdate();

		int id = future.getId();

		String jsql1 = "Update ClientCommunications as f SET f.date='"
				+ commDate + "' where f.id=" + id;
		String jsql2 = "Update ClientCommunications as f SET f.comm='" + comm
				+ "' where f.id=" + id;
		String jsql3 = "Update ClientCommunications as f SET f.remdate='"
				+ remDate + "' where f.id=" + id;
		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query3 = entityManager.createQuery(jsql3);
		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result3 = query3.executeUpdate();

		int result = result1 + result2 + result3;

		System.out.println("Columns affected are " + result);
	}

	@Transactional
	public void updateExistComm(ClientCommunications exist) {
		// TODO Auto-generated method stub

		String commDate = exist.getDate();
		String comm = exist.getComm();
		String remDate = exist.getRemdate();

		int id = exist.getId();

		String jsql1 = "Update ClientCommunications as f SET f.date='"
				+ commDate + "' where f.id=" + id;
		String jsql2 = "Update ClientCommunications as f SET f.comm='" + comm
				+ "' where f.id=" + id;
		String jsql3 = "Update ClientCommunications as f SET f.remdate='"
				+ remDate + "' where f.id=" + id;
		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query3 = entityManager.createQuery(jsql3);
		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result3 = query3.executeUpdate();

		int result = result1 + result2 + result3;

		System.out.println("Columns affected are " + result);
	}

	@Transactional
	public void updatePastComm(ClientCommunications past) {
		// TODO Auto-generated method stub

		String commDate = past.getDate();
		String comm = past.getComm();
		String remDate = past.getRemdate();

		int id = past.getId();

		String jsql1 = "Update ClientCommunications as f SET f.date='"
				+ commDate + "' where f.id=" + id;
		String jsql2 = "Update ClientCommunications as f SET f.comm='" + comm
				+ "' where f.id=" + id;
		String jsql3 = "Update ClientCommunications as f SET f.remdate='"
				+ remDate + "' where f.id=" + id;
		Query query1 = entityManager.createQuery(jsql1);
		Query query2 = entityManager.createQuery(jsql2);
		Query query3 = entityManager.createQuery(jsql3);
		int result1 = query1.executeUpdate();
		int result2 = query2.executeUpdate();
		int result3 = query3.executeUpdate();

		int result = result1 + result2 + result3;

		System.out.println("Columns affected are " + result);
	}
}