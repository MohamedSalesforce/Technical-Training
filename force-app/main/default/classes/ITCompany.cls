public with sharing class ITCompany {
    public ITCompany() {

    }
    public static list<Human> onBoardEmployees(){
        list<Human> sFEmployees = new list<Human>();
        
        Human human1 = (new Human('Raghul','raghul@gmail.com',24,'Male'));
        sFEmployees.add(human1);

        Human human2= (new Human('Muthu','muthu@gmail.com',24,'Male'));
        sFEmployees.add(human2);

        Human human3= (new Human('Naveen','naveen@gmail.com',24,'Male'));
        sFEmployees.add(human3);

        Human human4= (new Human('Kumar','kumar@gmail.com',24,'Male'));
        sFEmployees.add(human4);

        Human human5= (new Human('Stebin','stebin@gmail.com',24,'Male'));
        sFEmployees.add(human5);

        Human human6= (new Human('Steve','steve@gmail.com',24,'Male'));
        sFEmployees.add(human6);

        Human human7= (new Human('Sudharson','sudharson@gmail.com',24,'Male'));
        sFEmployees.add(human7);

        Human human8= (new Human('jagan','jagan@gmail.com',24,'Male'));
        sFEmployees.add(human8);

        Human human9= (new Human('gowtam','gowtam@gmail.com',24,'Male'));
        sFEmployees.add(human9);

        Human human10= (new Human('Gopal','gopal@gmail.com',24,'Male'));
        sFEmployees.add(human10);

        return sFEmployees;
    }

    public static list<Human> identifySuperHumans()
    {
        list<Human> findSuperHuman = onBoardEmployees();
        list<Human> listOfSuperHumans = new list<Human>();
        String dayToday = ITCompanyUtility.giveMeTheDayToday();
        if (dayToday == 'Fri') 
        {
            for (Human employee : findSuperHuman) 
            {
                if (employee.lastName != null &&
                    employee.lastName.startsWith('A') || employee.lastName.startsWith('M') ||
                    employee.lastName.startsWith('D') || employee.lastName.startsWith('P') ||
                    employee.lastName.startsWith('V') ||
                    employee.lastName.startsWith('a') || employee.lastName.startsWith('m') ||
                    employee.lastName.startsWith('d') || employee.lastName.startsWith('p') ||
                    employee.lastName.startsWith('v')) 
                {
                    employee.activateSuperHumanCapability();
                }
            }
        }
        return listOfSuperHumans;
    }
}