use bodytrue;

select * from review;
select * from img;

SELECT PRO_NO,PRO_NAME,TR_NAME,ROUND(AVG(RE_RATE),1) AS RATE_AVG
FROM PROGRAM P JOIN TRAINER T ON P.PRO_TR_NO = T.TR_NO JOIN REVIEW R ON P.PRO_NO = R.RE_PRO_NO
GROUP BY RE_PRO_NO;

SELECT P.PRO_NO, P.PRO_NAME, T.TR_NAME AS PRO_TRAINER, ROUND(AVG(R.RE_RATE), 1) AS PRO_RATE_AVG, substring_index(GROUP_CONCAT(I.IMG_PATH),',',1) AS IMG_PATH
    FROM PROGRAM P
    LEFT JOIN TRAINER T ON P.PRO_TR_NO = T.TR_NO
    LEFT JOIN REVIEW R ON P.PRO_NO = R.RE_PRO_NO
    LEFT JOIN IMG I ON P.PRO_NO = I.IMG_PRO_NO
    GROUP BY P.PRO_NO;