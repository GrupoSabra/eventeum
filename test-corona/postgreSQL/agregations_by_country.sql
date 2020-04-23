-- View: public.agregations_by_country

-- DROP VIEW public.agregations_by_country;

CREATE OR REPLACE VIEW public.agregations_by_country
 AS
 SELECT c.name_es,
    c.name_en,
    c.name_pt,
    c.centroid,
    count(DISTINCT rc."SubjectHashId") AS userstotal,
    count(*) AS transactioncount,
    count(*) FILTER (WHERE rc."HasNoSymptoms" IS NOT NULL AND rc."HasNoSymptoms" = true) AS nosymptoms,
    count(*) FILTER (WHERE rc."HasSymptoms" IS NOT NULL AND rc."HasSymptoms" = true) AS symptoms,
    count(*) FILTER (WHERE rc."HasFever" IS NOT NULL AND rc."HasFever" = true) AS fever,
    count(*) FILTER (WHERE rc."HasCought" IS NOT NULL AND rc."HasCought" = true) AS cought,
    count(*) FILTER (WHERE rc."HasBreathingIssues" IS NOT NULL AND rc."HasBreathingIssues" = true) AS breathingissues,
    count(*) FILTER (WHERE rc."HasLossSmell" IS NOT NULL AND rc."HasLossSmell" = true) AS losssmell,
    count(*) FILTER (WHERE rc."HasHeadache" IS NOT NULL AND rc."HasHeadache" = true) AS headache,
    count(*) FILTER (WHERE rc."HasMusclePain" IS NOT NULL AND rc."HasMusclePain" = true) AS hasmusclepain,
    count(*) FILTER (WHERE rc."HasSoreThroat" IS NOT NULL AND rc."HasSoreThroat" = true) AS sorethroat,
    count(*) FILTER (WHERE rc."CredentialType" = 3) AS infection,
    count(*) FILTER (WHERE rc."CredentialType" = 4) AS recovery,
    count(*) FILTER (WHERE rc."CredentialType" = 0 OR rc."CredentialType" = 1 AND date_part('day'::text, now() - rc."StartDate"::timestamp with time zone) > 1::double precision) AS confinement,
    count(*) FILTER (WHERE rc."CredentialType" = 1 AND date_part('day'::text, now() - rc."StartDate"::timestamp with time zone) <= 1::double precision) AS interruption,
    count(*) FILTER (WHERE rc."Reason" = 0) AS food,
    count(*) FILTER (WHERE rc."Reason" = 1) AS work,
    count(*) FILTER (WHERE rc."Reason" = 2) AS medicines,
    count(*) FILTER (WHERE rc."Reason" = 3) AS doctor,
    count(*) FILTER (WHERE rc."Reason" = 4) AS moving,
    count(*) FILTER (WHERE rc."Reason" = 5) AS assist,
    count(*) FILTER (WHERE rc."Reason" = 6) AS financial,
    count(*) FILTER (WHERE rc."Reason" = 7) AS force,
    count(*) FILTER (WHERE rc."Reason" = 8) AS pets,
    count(*) FILTER (WHERE rc."Sex" = 0) AS male,
    count(*) FILTER (WHERE rc."Sex" = 1) AS female,
    count(*) FILTER (WHERE rc."Sex" = 2) AS unspecifiedsex,
    count(*) FILTER (WHERE rc."Sex" = 3) AS othersex,
    avg(rc."Age") FILTER (WHERE rc."Age" IS NOT NULL) AS age,
    count(*) FILTER (WHERE rc."Age" <= 18) AS form1318count,
    count(*) FILTER (WHERE rc."Age" > 18 AND rc."Age" <= 30) AS form1930count,
    count(*) FILTER (WHERE rc."Age" > 30 AND rc."Age" <= 40) AS form3140count,
    count(*) FILTER (WHERE rc."Age" > 40 AND rc."Age" <= 65) AS form4165count,
    count(*) FILTER (WHERE rc."Age" > 65) AS form66count
   FROM "RegisteredCredentials" rc
     JOIN "Countries" c ON c.gid = rc."CountryGId"
  WHERE rc."IsRevoked" IS NULL OR rc."IsRevoked" = false
  GROUP BY rc."CountryGId", c.name_es, c.name_en, c.name_pt, c.centroid;

