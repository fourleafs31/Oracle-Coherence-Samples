package com.oracle.handson;

import com.tangosol.net.CacheFactory;
import com.tangosol.net.NamedCache;
import java.math.BigDecimal;
import java.util.*;

public class RunEmpGetAll 
{
	public RunEmpGetAll() 
	{
	}

	public static void main(String[] args) 
	{
		Vector keys = new Vector();
//		keys.add(100L); // empId = 100 : Exist data.
//		keys.add(110L); // empId = 110 : Exist data
		keys.add(1000L); // empId = 1000 : NOT Exist data.
		keys.add(2000L); // empId = 2000 : NOT Exist data.

		NamedCache employees = CacheFactory.getCache("Employees");
		// getAll
		Map<Long, Employees> resMap = employees.getAll(keys);
		for(Long key : resMap.keySet()){
			System.out.println(key + ": " + resMap.get(key));
		}

	}
}
