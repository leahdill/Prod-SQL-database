-- Raw prod to join in Aries
#DEFINE :PDT='02/01/2021'
SELECT s.user_ref As 'User Ref',
       RTRIM(s.name+' '+ISNULL(s.number,'')) As 'SiteName',
			 s.api As 'API#',
			 x.econ As 'Aries ID',
       d.period, d.grs_oil, d.grs_gas, d.grs_wtr
  FROM md_summary d
	LEFT JOIN site s ON d.site_id = s.site_id
	LEFT JOIN xref x ON s.site_id = x.site_id
 WHERE d.period >= :PDT
 ORDER By s.user_ref, d.period