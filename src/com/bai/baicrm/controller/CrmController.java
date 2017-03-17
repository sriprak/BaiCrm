package com.bai.baicrm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bai.baicrm.dao.CrmDao;
import com.bai.baicrm.entity.Client;
import com.bai.baicrm.entity.ClientCommunications;
import com.bai.baicrm.entity.User;


@Controller
public class CrmController {

	@Autowired
	private CrmDao crmDao;

	@RequestMapping(method = { RequestMethod.POST }, value = "/auth.do")
	public String authenticate(@RequestParam("user") String name,
			@RequestParam("pass") String pass, Map<String, String> model) {
		List<User> user = crmDao.getUserAuth(name, pass);
		if (user.size() == 0) {
			model.put("error", "Invalid Username or Password");
			return "login.jsp";
		} else
			return "remDateClient.jsp";

	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/addFuture.do")
	@Transactional
	public String saveFuture(@RequestParam("enqno") String enq,
			@RequestParam("cname") String name,
			@RequestParam("caddress") String address,
			@RequestParam("cturnover") String turnover,
			@RequestParam("cnoe") long employee,
			@RequestParam("cloc") String location,
			@RequestParam("countries") String country,
			@RequestParam("poc") String poc, @RequestParam("date") String date,
			@RequestParam("cpoc") String cpoc,
			@RequestParam("cpocno") String cpocnum,
			@RequestParam("cpocid") String cpocid,
			@RequestParam("commhist") String commhist,
			@RequestParam("remdate") String remdate,
			@RequestParam("servicetype") String servicetype,
			@RequestParam("type") String type, Map<String, String> model) {
		Client client = new Client();
		client.setId(enq);
		client.setName(name);
		client.setAddress(address);
		client.setTurnover(turnover);
		client.setNoe(employee);
		client.setLocation(location);
		client.setCountry(country);
		client.setContactperson(poc);
		client.setClientcontact(cpoc);
		client.setClientnumber(cpocnum);
		client.setClientemail(cpocid);
		client.setTypeofclient(type);
		client.setServicetype(servicetype);
		ClientCommunications client2 = new ClientCommunications();
		client2.setRemdate(remdate);
		client2.setDate(date);
		client2.setComm(commhist);
		client2.setClient(client);
		crmDao.addFutClient(client, client2);
		model.put("success", "values inserted into database successfully");
		return "addFuture.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/addExisting.do")
	@Transactional
	public String saveExisting(@RequestParam("enqno") String enq,
			@RequestParam("cname") String name,
			@RequestParam("caddress") String address,
			@RequestParam("cturnover") String turnover,
			@RequestParam("cnoe") long employee,
			@RequestParam("cloc") String location,
			@RequestParam("countries") String country,
			@RequestParam("cassgn") String assignment,
			@RequestParam("cassgnsect") String sector,
			@RequestParam("years") String year,
			@RequestParam("poc") String poc,
			@RequestParam("cpoc") String cpoc,
			@RequestParam("cpocno") String cpocnum,
			@RequestParam("cpocid") String cpocid,
			@RequestParam("commdate") String date,
			@RequestParam("commhist") String commhist,
			@RequestParam("type") String type,
			@RequestParam("servicetype") String servicetype,
			@RequestParam("remdate") String remdate, Map<String, String> model) {
		Client client = new Client();
		client.setId(enq);
		client.setName(name);
		client.setAddress(address);
		client.setTurnover(turnover);
		client.setNoe(employee);
		client.setLocation(location);
		client.setCountry(country);
		client.setAssignment(assignment);
		client.setAssignsector(sector);
		client.setAssignyear(year);
		client.setContactperson(poc);
		client.setClientcontact(cpoc);
		client.setClientnumber(cpocnum);
		client.setClientemail(cpocid);
		client.setTypeofclient(type);
		client.setServicetype(servicetype);
		ClientCommunications client2 = new ClientCommunications();
		client2.setRemdate(remdate);
		client2.setDate(date);
		client2.setComm(commhist);
		client2.setClient(client);
		crmDao.addExistClient(client, client2);
		model.put("success", "values inserted into database successfully");
		return "addExisting.jsp";

	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/addPast.do")
	@Transactional
	public String savePast(@RequestParam("enqno") String enq,
			@RequestParam("cname") String name,
			@RequestParam("caddress") String address,
			@RequestParam("cturnover") String turnover,
			@RequestParam("cnoe") long employee,
			@RequestParam("cloc") String location,
			@RequestParam("countries") String country,
			@RequestParam("cassgn") String assignment,
			@RequestParam("cassgnsect") String sector,
			@RequestParam("years") String year,
			@RequestParam("poc") String poc, 
			@RequestParam("cpoc") String cpoc,
			@RequestParam("cpocno") String cpocnum,
			@RequestParam("cpocid") String cpocid,
			@RequestParam("type") String type,
			@RequestParam("commdate") String date,
			@RequestParam("servicetype") String servicetype,
			@RequestParam("commhist") String comm, Map<String, String> model) {
		Client client = new Client();
		client.setId(enq);
		client.setName(name);
		client.setAddress(address);
		client.setTurnover(turnover);
		client.setNoe(employee);
		client.setLocation(location);
		client.setCountry(country);
		client.setAssignment(assignment);
		client.setAssignsector(sector);
		client.setAssignyear(year);
		client.setContactperson(poc);
		client.setClientcontact(cpoc);
		client.setClientnumber(cpocnum);
		client.setClientemail(cpocid);
		client.setTypeofclient(type);
		client.setServicetype(servicetype);
		ClientCommunications client2 = new ClientCommunications();
		client2.setDate(date);
		client2.setComm(comm);
		client2.setClient(client);
		crmDao.addPastClient(client, client2);
		model.put("success", "values inserted into database successfully");
		return "addPast.jsp";

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(method = { RequestMethod.GET }, value = "/searchFuture.do")
	@Transactional
	public String findFutClient(@RequestParam("searchValue") String value,
			Map<String, String> model, Map model3, Map modelCount) {
		List<Client> client2 = crmDao.getClientInfo(value);
		int size = client2.size();
		System.out.print(size);
		if (size == 0) {
			model.put("error", "No such value in the database");
			return "searchFuture.jsp";
		} else {
			model.put("success", "The Search is Complete");
			modelCount.put("total", size);
			model3.put("futureclient", client2);

			return "searchFuture.jsp";
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(method = { RequestMethod.GET }, value = "/searchExisting.do")
	@Transactional
	public String findExistClient(@RequestParam("searchValue") String value,
			Map<String, String> model, Map model1, Map modelCount) {
		List<Client> client1 = crmDao.getExistingClientInfo(value);
		int size = client1.size();
		if (size == 0) {
			model.put("error", "No such value in the database");
			return "searchExisting.jsp";
		} else {
			model.put("success", "The Search is Complete");
			modelCount.put("total", size);
			model1.put("existclient", client1);
			return "searchExisting.jsp";

		}

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(method = { RequestMethod.GET }, value = "/searchPast.do")
	@Transactional
	public String findPastClient(@RequestParam("searchValue") String value,
			Map<String, String> model, Map model2, Map modelCount) {
		List<Client> client1 = crmDao.getPastClientInfo(value);
		int size = client1.size();
		if (size == 0) {
			model.put("error", "No such value in the database");
			return "searchPast.jsp";
		} else {
			model.put("success", "The Search is Complete");
			modelCount.put("total", size);
			model2.put("pastclient", client1);
			return "searchPast.jsp";
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(method = { RequestMethod.GET }, value = "/searchClosed.do")
	@Transactional
	public String findClosedClient(@RequestParam("searchValue") String value,
			Map<String, String> model, Map model3, Map modelCount) {
		List<Client> closedclient = crmDao.getClosedClientInfo(value);
		int size = closedclient.size();
		if (size == 0) {
			model.put("error", "No such value in the database");
			return "searchClosed.jsp";
		} else {
			model.put("successc", "The Search is Complete");
			modelCount.put("total", size);
			model3.put("closedcases", closedclient);
			return "searchClosed.jsp";
		}
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/editFutClient.do")
	@Transactional
	public String editFutureClient(@RequestParam("id") String id,
			Map<String, Object> model4) {

		Client future = crmDao.get(Client.class, id);
		System.out.println(future.getName());
		model4.put("futclient", future);
		return "addFuture.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/editExistClient.do")
	@Transactional
	public String editExistingClient(@RequestParam("id") String id,
			Map<String, Object> model5) {
		Client exist = crmDao.get(Client.class, id);
		System.out.println(exist.getName());
		model5.put("existclient", exist);
		return "addExisting.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/editPastClient.do")
	@Transactional
	public String editPastClient(@RequestParam("id") String id,
			Map<String, Object> model6) {
		Client past = crmDao.get(Client.class, id);
		System.out.println(past.getName());
		model6.put("pastclient", past);
		return "addPast.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/updateFuture.do")
	public String updateFutureClient(@RequestParam("cname") String name,
			@RequestParam("caddress") String address,
			@RequestParam("cturnover") String turnover,
			@RequestParam("cnoe") long employee,
			@RequestParam("cloc") String location,
			@RequestParam("country") String country,
			@RequestParam("contactperson") String poc,
			@RequestParam("cpoc") String cpoc,
			@RequestParam("cpocno") String cpocnum,
			@RequestParam("cpocid") String cpocid,
			@RequestParam("date") String date,
			@RequestParam("commhist") String commhist,
			@RequestParam("remdate") String remdate,
			@RequestParam("enqno") String id,
			@RequestParam("servicetype") String servicetype,
			@RequestParam("type") String type, Map<String, String> model9) {
		Client future = new Client();
		future.setId(id);
		future.setName(name);
		future.setAddress(address);
		future.setTurnover(turnover);
		future.setNoe(employee);
		future.setLocation(location);
		future.setCountry(country);
		future.setContactperson(poc);
		future.setClientcontact(cpoc);
		future.setClientnumber(cpocnum);
		future.setClientemail(cpocid);
		future.setTypeofclient(type);
		future.setServicetype(servicetype);
		ClientCommunications future2 = new ClientCommunications();
		future2.setDate(date);
		future2.setComm(commhist);
		future2.setRemdate(remdate);
		future2.setClient(future);
		crmDao.updateFutClient(future, future2);
		model9.put("success5", "Values updated successfully");
		return "searchFuture.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/updateExisting.do")
	public String updateExistingClient(@RequestParam("cname") String name,
			@RequestParam("caddress") String address,
			@RequestParam("cturnover") String turnover,
			@RequestParam("cnoe") long employee,
			@RequestParam("cloc") String location,
			@RequestParam("country") String country,
			@RequestParam("assignment") String assignment,
			@RequestParam("assignsector") String sector,
			@RequestParam("assignyear") String year,
			@RequestParam("contactperson") String poc,
			@RequestParam("cpoc") String cpoc,
			@RequestParam("cpocno") String cpocnum,
			@RequestParam("cpocid") String cpocid,
			@RequestParam("commdate") String date,
			@RequestParam("commhist") String commhist,
			@RequestParam("enqno") String id,
			@RequestParam("type") String type,
			@RequestParam("servicetype") String servicetype,
			@RequestParam("remdate") String remdate, Map<String, String> modele3) {
		Client exist = new Client();
		exist.setId(id);
		exist.setName(name);
		exist.setAddress(address);
		exist.setTurnover(turnover);
		exist.setNoe(employee);
		exist.setLocation(location);
		exist.setCountry(country);
		exist.setAssignment(assignment);
		exist.setAssignsector(sector);
		exist.setAssignyear(year);
		exist.setContactperson(poc);
		exist.setClientcontact(cpoc);
		exist.setClientnumber(cpocnum);
		exist.setClientemail(cpocid);
		exist.setTypeofclient(type);
		exist.setServicetype(servicetype);
		ClientCommunications exist2 = new ClientCommunications();
		exist2.setDate(date);
		exist2.setComm(commhist);
		exist2.setRemdate(remdate);
		exist2.setClient(exist);
		crmDao.updateExistClient(exist, exist2);
		modele3.put("successes5", "Values updated successfully");
		return "searchExisting.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/updatePast.do")
	public String updatePastClient(@RequestParam("cname") String name,
			@RequestParam("caddress") String address,
			@RequestParam("cturnover") String turnover,
			@RequestParam("cnoe") long employee,
			@RequestParam("cloc") String location,
			@RequestParam("country") String country,
			@RequestParam("contactperson") String poc,
			@RequestParam("cpoc") String cpoc,
			@RequestParam("cpocno") String cpocnum,
			@RequestParam("cpocid") String cpocid,
			@RequestParam("date") String date,
			@RequestParam("commhist") String commhist,
			@RequestParam("enqno") String id,
			@RequestParam("servicetype") String servicetype,
			@RequestParam("type") String type, Map<String, String> model11) {
		Client past = new Client();
		past.setId(id);
		past.setName(name);
		past.setAddress(address);
		past.setTurnover(turnover);
		past.setNoe(employee);
		past.setLocation(location);
		past.setCountry(country);
		past.setContactperson(poc);
		past.setClientcontact(cpoc);
		past.setClientnumber(cpocnum);
		past.setClientemail(cpocid);
		past.setTypeofclient(type);
		past.setServicetype(servicetype);
		ClientCommunications past2 = new ClientCommunications();
		past2.setDate(date);
		past2.setComm(commhist);
		past2.setClient(past);
		crmDao.updatePastClient(past, past2);
		model11.put("successp2", "Values updated successfully");
		return "searchPast.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/deletePastClient.do")
	@Transactional
	public String deletePastClient(@RequestParam("id") String id,
			Map<String, String> modelDel1) {
		crmDao.deletePastClients(id);
		modelDel1.put("successDel1",
				"Values successfully deleted from the database");
		return "searchPast.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/deleteExistClient.do")
	@Transactional
	public String deleteExistingClient(@RequestParam("id") String id,
			Map<String, String> modelDel2) {
		crmDao.deleteExistClients(id);
		modelDel2.put("successDel2",
				"Values successfully deleted from the database");
		return "searchExisting.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/deleteFutureClient.do")
	@Transactional
	public String deleteFutureClient(@RequestParam("id") String id,
			Map<String, String> modelDel3) {
		crmDao.deleteFutureClients(id);
		modelDel3.put("successDel3",
				"Values successfully deleted from the database");
		return "searchFuture.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/editFutComm.do")
	@Transactional
	public String editFutureCommunication(@RequestParam("id") int commid,
			Map<String, Object> model4) {

		ClientCommunications future = crmDao.get(ClientCommunications.class,
				commid);
		System.out.println(future.getClient().getName());
		System.out.println(future.getId());
		model4.put("futComm", future);
		return "editFutComm.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/editPastComm.do")
	@Transactional
	public String editPastCommunication(@RequestParam("id") int commid,
			Map<String, Object> model5) {

		ClientCommunications past = crmDao.get(ClientCommunications.class,
				commid);
		System.out.println(past.getClient().getName());
		System.out.println(past.getId());
		model5.put("pastComm", past);
		return "editPastComm.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/editExistComm.do")
	@Transactional
	public String editExistCommunication(@RequestParam("id") int commid,
			Map<String, Object> model6) {

		ClientCommunications exist = crmDao.get(ClientCommunications.class,
				commid);
		System.out.println(exist.getClient().getName());
		System.out.println(exist.getId());
		model6.put("existComm", exist);
		return "editExistComm.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/updateFutComm.do")
	@Transactional
	public String updateFutureCommunication(@RequestParam("id") int id,
			@RequestParam("commDate") String date,
			@RequestParam("comm") String comm,
			@RequestParam("remDate") String remDate,
			Map<String, Object> modelComm1) {
		ClientCommunications future = new ClientCommunications();
		future.setId(id);
		future.setDate(date);
		future.setComm(comm);
		future.setRemdate(remDate);
		crmDao.updateFutComm(future);
		modelComm1.put("Success",
				"The values have been successfully updated in the database");

		return "searchFuture.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/updateExistComm.do")
	@Transactional
	public String updateExistCommunication(@RequestParam("id") int id,
			@RequestParam("commDate") String date,
			@RequestParam("comm") String comm,
			@RequestParam("remDate") String remDate,
			Map<String, Object> modelComm2) {
		ClientCommunications exist = new ClientCommunications();
		exist.setId(id);
		exist.setDate(date);
		exist.setComm(comm);
		exist.setRemdate(remDate);
		crmDao.updateFutComm(exist);
		modelComm2.put("Success",
				"The values have been successfully updated in the database");
		return "searchExisting.jsp";
	}

	@RequestMapping(method = { RequestMethod.GET }, value = "/updatePastComm.do")
	@Transactional
	public String updatePastCommunication(@RequestParam("id") int id,
			@RequestParam("commDate") String date,
			@RequestParam("comm") String comm,
			@RequestParam("remDate") String remDate,
			Map<String, Object> modelComm3) {
		ClientCommunications past = new ClientCommunications();
		past.setId(id);
		past.setDate(date);
		past.setComm(comm);
		past.setRemdate(remDate);
		crmDao.updateFutComm(past);
		modelComm3.put("Success",
				"The values have been successfully updated in the database");
		return "searchPast.jsp";
	}
	
}