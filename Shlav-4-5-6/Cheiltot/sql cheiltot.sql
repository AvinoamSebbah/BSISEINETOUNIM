***SUM OF SALARY FOR ALL SCIENTIST WORKING ON SPECIFIC VIRUS*** 1/4 easy
SELECT  SUM(salary)
FROM medicament, cure, virus,scientist, work_on
WHERE virus.virusid = cure.virusId and virus.virusname = 'COVID-19' and medicament.medId = cure.medid    and  scientist.scientistId = work_on.scientistId and  medicament.medId = work_on.medid

***MED NAME WITH CRITICAL QUANTITY*** 2/4 easy - INDEX 
SELECT medName
FROM medicament
WHERE quantity < 10000

CREATE INDEX medicamentQuantity
ON medicament (quantity)

***SCIENTIST NAMES WORKING AT SPECIFIC LABORATORY*** 3/4 easy
SELECT scientistname
FROM scientist, laboratory
WHERE scientist.labid = laboratory.labid and laboratory.labname = 'EHN INC.'

***LABORATORY WITH LOW PROTECTION LEVEL WORKING ON DANGEROUS VIRUS*** 4/4 easy
SELECT DISTINCT labName
from virus, laboratory, analyzes
where laboratory.protectionlevel < 2 and virus.dangerlevel > 90 and analyzes.labid = laboratory.labid and analyzes.virusid = virus.virusid


**********************************************************************************************************************************************

***NAME OF ALL SCIENTIST WORKING ON COVID-19*** 1/4 HARD - 1.22 Seconds
SELECT  scientistName
FROM medicament, cure, virus,scientist, work_on
WHERE virus.virusid = cure.virusId and virus.virusname = 'COVID-19' and medicament.medId = cure.medid    and  scientist.scientistId = work_on.scientistId and  medicament.medId = work_on.medid

***FREQUENCY OF MEDICAMENT CURE FOR VIRUS*** 2/4 HARD - 10.68 Seconds to 8.90 Seconds - INDEX
SELECT medicament.medName, COUNT(cure.medid) AS MOST_VIRUS_CURE
from cure,medicament
WHERE medicament.medId = cure.medID
GROUP BY medicament.medName
ORDER BY COUNT(cure.medId) DESC

CREATE INDEX medicamentIdentification
ON cure (medId)

CREATE INDEX medicamentNameIdentification
ON medicament (medName)


***SCIENTIST WITH IMMUNOLOGY SPECIALIZATION WORKING ON DANGEROUS VIRUS*** 3.44 seconds to 2.40 seconds - INDEX
SELECT DISTINCT scientistName
FROM medicament, cure, virus,scientist, work_on
WHERE virus.virusid = cure.virusId and scientist.specialization = 'Immunology'  and virus.dangerlevel > 80 and medicament.medId = cure.medid    and  scientist.scientistId = work_on.scientistId and  medicament.medId = work_on.medid

CREATE INDEX scientistSpecialization
ON scientist ('Immunology')

CREATE INDEX virusDanger
ON virus (dangerlevel)


***SCIENTIST WORKING IN ISRAEL*** 7 seconds
Select scientistname, lablocation
from scientist , laboratory
where laboratory.labid = scientist.labid and lablocation LIKE '%ISRAEL%'
