

--скриптов- два, но они аналогичны и привязаны к двум столбцам в закладке - дата начала и дата окончания

--в случае несоответствия условия, выдается предупреждение о некорректно введенной дате, и изменения не вносятся.

--столбцы - у них обязательно должны быть с типом "Дата" указанное в примере событие именно для них)

--_ID_PAGE_NUMBER_ - вместо этой константы автоматически подставится текущий номер строки
-- вот это -> ValueGuideDatePageForCont1_3 наименование события, 3 - номер столбца, 
--первая часть PageForCont1 - наименование закладки, ValueGuideDate - событие связано с изменение даты


declare @Res nvarchar(4000)

set @Res=
' declare @DateBegin datetime, @DateEnd datetime, @S1 varchar(250), @S2 varchar(250) '+
' select @DateBegin=[2], @DateEnd=_DATE1_ from PageForCont1 where [id]=_ID_PAGE_NUMBER_ '+
' if @DateBegin>@DateEnd '+
' begin '+
'  set  @S1='+char(39)+'1'+char(39)+' set @S2='+char(39)+'Начало этапа не может быть позже окончания.'+char(39)+
' end else '+
' begin '+
'  set  @S1='+char(39)+'0'+char(39)+' set @S2='+char(39)+char(39)+
' end '+
' select @S1, @S2 '

delete from Contacts_SqlScript where Event='ValueGuideDatePageForCont1_3'

insert Contacts_SqlScript (Event, Sql_Script)
values ('ValueGuideDatePageForCont1_3', @Res)
set @Res=
' declare @DateBegin datetime, @DateEnd datetime, @S1 varchar(250), @S2 varchar(250) '+
' select @DateBegin=_DATE1_,@DateEnd=[3] from PageForCont1 where [id]=_ID_PAGE_NUMBER_ '+
' if @DateBegin>@DateEnd '+
' begin '+
'  set  @S1='+char(39)+'1'+char(39)+' set @S2='+char(39)+'Начало этапа не может быть позже окончания.'+char(39)+
' end else '+
' begin '+
'  set  @S1='+char(39)+'0'+char(39)+' set @S2='+char(39)+char(39)+
' end '+
' select @S1, @S2 '

delete from Contacts_SqlScript where Event='ValueGuideDatePageForCont1_2'

insert Contacts_SqlScript (Event, Sql_Script)
values ('ValueGuideDatePageForCont1_2', @Res)


