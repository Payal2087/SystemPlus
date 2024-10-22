*** Variables ***
${Locator_URL}    /child-care-locator
${Find_Center}    (//a[@href='https://www.brighthorizons.com/child-care-locator'])[4]
${Location_Search}    //form/div/div[1]/input[@name="addressInput"]
${Center_count}    //div/div[2]/span[@class='resultsNumber']
${First_Center_Name}    //div/div[2]/h3[@class="centerResult__name"]
${First_Center_Address}    //div/div[2]/span[@class="centerResult__address"]
${First_Center_Name_Popup}    //div/span[@class='mapTooltip__headline']
${First_Center_Address_Popup}    //div/div[@class='mapTooltip__address']
${Result_List}    //div[3]/div[2][contains(@class,'centerResult')]
${Home_Page}      //nav/div[3]/div[3]/a[contains(@href,'www.brighthorizons.com')]
${Center_List_Count}    //div[contains(@class,'centerResult')]/h3
