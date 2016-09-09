This is test for Coherence JPA. Which is based on the below:

Japanese Document:
Oracle Fusion Middleware Oracle Coherenceチュートリアル
12c (12.1.3)
E56204-01 8 JPAとCoherenceの併用
http://docs.oracle.com/cd/E57014_01/coherence/tutorial/usejpa.htm

English Document:
8 Using JPA with Coherence (12.1.2)
https://docs.oracle.com/middleware/1212/coherence/COHTU/usejpa.htm#COHTU279

* Requirement
1. ant
2. JDK
3. Coherence
4. JDBC Driver

* How to build.
1. Modyfy the following files for your enviroment.

setEnv.sh
src.properties
src/META-INF/persistence.xml

2. Run the below:

$ . ./setEnv.sh

3. Run the below:

$ ant

* How to run.

0. Create ./logs directory:

$ mkdir logs

1. Simple App: 

$ ./RunEmployee.sh

2. NamedCache.getAll() test app:

$ ./RunEmpGetAll.sh
