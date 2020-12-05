
2018-07-8

#=====================================================================================
#
#  Code chunk 1 设置工作路径
#
#=====================================================================================


# Display the current working directory
getwd();
#setwd("C:\\Users\\Administrator\\Desktop\\samples2")
setwd("F:\\Desktop\\Data_analysis_Wang")
# If necessary, change the path below to the directory where the data files are stored. 
# "." means current directory. On Windows use a forward slash / instead of the usual \.
##设置工作目录为当前目录：
workingDir = ".";
setwd(workingDir); 

options(stringsAsFactors = FALSE)



#=====================================================================================
#
#  Code chunk 2 数据导入
#
#=====================================================================================

Input=("
Samples	Condition2	Temperature	COD	NOX	SBP	DBP	MBP	HR	BIS	CO	SVV
Sample1	A_Baseline	37.5	99	98	133	75	98	68	98	3	22
       Sample1	B_Intubation	37.3	56	68	117	75	88	70	50	2.6	19
       Sample1	C_Incision	37.3	60	78	121	72	89	71	52	2.8	20
       Sample1	D_pre-CPB15min	36.8	60	79	131	70	96	65	51	2.5	21
       Sample1	E_pre-CPB10min	36.8	60	74	122	83	93	66	57	2.9	24
       Sample1	F_pre-CPB5min	36.8	60	71	137	71	98	65	45	3.2	27
       Sample1	G_CPB	33.3	52	61	NA	NA	NA	NA	33	NA	NA
       Sample1	H_CPB5min	33.3	36	63	NA	NA	NA	NA	35	NA	NA
       Sample1	I_CPB10min	33.8	41	65	NA	NA	NA	NA	43	NA	NA
       Sample1	J_CPB15min	34.3	35	61	NA	NA	NA	NA	44	NA	NA
       Sample1	K_CPB20min	34	33	58	NA	NA	NA	NA	48	NA	NA
       Sample1	L_Post-CPB	34	46	56	118	76	88	67	51	NA	NA
       Sample1	M_Post-CPB5min	36	48	74	132	77	98	68	55	4.3	28
       Sample1	N_Post-CPB10min	36.6	64	75	133	76	97	67	56	4.3	28
       Sample1	O_Post-CPB15min	36.8	66	88	135	81	98	89	57	NA	NA
       Sample1	P_Post-CPB20min	36.5	68	89	139	78	99	70	56	2.9	26
       sample2	A_Baseline	36.6	91	97	122	60	80	69	90	NA	NA
       sample2	B_Intubation	36.6	79	90	106	59	71	61	48	3.9	14
       sample2	C_Incision	36	70	80	112	61	NA	50	49	3.8	15
       sample2	D_pre-CPB15min	34.8	52	58	125	69	83	58	41	3.4	22
       sample2	E_pre-CPB10min	34.5	42	38	103	65	76	52	39	3.5	11
       sample2	F_pre-CPB5min	34.5	40	33	110	70	82	56	38	3.4	16
       sample2	G_CPB	30.6	19	29	NA	NA	NA	NA	27	NA	NA
       sample2	H_CPB5min	31	19	38	NA	NA	NA	NA	27	NA	NA
       sample2	I_CPB10min	30.5	33	24	NA	NA	NA	NA	30	NA	NA
       sample2	J_CPB15min	31	28	26	NA	NA	NA	NA	29	NA	NA
       sample2	K_CPB20min	31	20	23	NA	NA	NA	NA	31	NA	NA
       sample2	L_Post-CPB	36	52	NA	95	69	77	65	40	2.6	13
       sample2	M_Post-CPB5min	36.5	53	68	110	70	82	65	42	2.4	13
       sample2	N_Post-CPB10min	36.5	51	69	103	65	76	66	40	4.5	17
       sample2	O_Post-CPB15min	36.6	42	68	125	69	83	93	41	4	16
       sample2	P_Post-CPB20min	36.8	51	73	86	38	56	108	45	4	13
       sample3	A_Baseline	36.5	99	99	124	67	NA	49	41	NA	NA
       sample3	B_Intubation	36.5	50	69	131	69	NA	48	41	NA	NA
       sample3	C_Incision	36.5	49	68	127	67	NA	51	38	NA	NA
       sample3	D_pre-CPB15min	35.7	56	70	130	66	NA	66	44	NA	NA
       sample3	E_pre-CPB10min	35.2	57	70	132	67	NA	88	36	NA	NA
       sample3	F_pre-CPB5min	35.2	57	69	128	70	NA	78	39	NA	NA
       sample3	G_CPB	33.15	36	39	NA	NA	NA	NA	36	NA	NA
       sample3	H_CPB5min	31.5	31	36	NA	NA	NA	NA	39	NA	NA
       sample3	I_CPB10min	31.6	35	33	NA	NA	NA	NA	40	NA	NA
       sample3	J_CPB15min	31.5	36	35	NA	NA	NA	NA	39	NA	NA
       sample3	K_CPB20min	31.5	45	40	NA	NA	NA	NA	41	NA	NA
       sample3	L_Post-CPB	35.5	55	56	125	61	NA	71	40	NA	NA
       sample3	M_Post-CPB5min	36.5	40	71	126	59	NA	65	45	NA	NA
       sample3	N_Post-CPB10min	36.5	42	75	101	52	NA	65	42	NA	NA
       sample3	O_Post-CPB15min	36.5	42	69	102	52	NA	65	42	NA	NA
       sample3	P_Post-CPB20min	36.6	42	65	108	56	NA	65	42	NA	NA
       sample4	A_Baseline	36.6	89	98	132	70	NA	81	98	NA	NA
       sample4	B_Intubation	36.6	54	84	130	67	NA	78	37	NA	NA
       sample4	C_Incision	36.5	57	88	131	66	NA	75	51	NA	NA
       sample4	D_pre-CPB15min	36.5	54	84	125	65	NA	77	38	NA	NA
       sample4	E_pre-CPB10min	36.5	56	82	130	68	NA	72	42	NA	NA
       sample4	F_pre-CPB5min	35.5	54	75	127	65	NA	72	46	NA	NA
       sample4	G_CPB	35.5	48	57	NA	NA	NA	NA	41	NA	NA
       sample4	H_CPB5min	30.5	42	57	NA	NA	NA	NA	38	NA	NA
       sample4	I_CPB10min	30.5	44	60	NA	NA	NA	NA	35	NA	NA
       sample4	J_CPB15min	30.2	40	56	NA	NA	NA	NA	38	NA	NA
       sample4	K_CPB20min	30.5	43	58	NA	NA	NA	NA	35	NA	NA
       sample4	L_Post-CPB	36.5	73	91	132	75	NA	73	58	NA	NA
       sample4	M_Post-CPB5min	36.5	67	83	130	67	NA	75	61	NA	NA
       sample4	N_Post-CPB10min	36.5	64	89	133	78	NA	70	51	NA	NA
       sample4	O_Post-CPB15min	36.5	77	87	138	70	NA	71	58	NA	NA
       sample4	P_Post-CPB20min	36.5	73	89	134	70	NA	72	45	NA	NA
       sample5	A_Baseline	36.5	99	99	167	90	NA	72	98	3.2	10
       sample5	B_Intubation	36.5	58	85	140	81	NA	62	45	3	8
       sample5	C_Incision	36.5	51	87	139	79	NA	59	42	2.9	9
       sample5	D_pre-CPB15min	36.5	56	79	145	80	104	61	54	3.8	9
       sample5	E_pre-CPB10min	35.5	44	65	112	69	80	97	58	3.6	8
       sample5	F_pre-CPB5min	35.5	49	71	157	78	100	69	60	3.8	9
       sample5	G_CPB	31.3	36	34	NA	NA	NA	NA	46	NA	NA
       sample5	H_CPB5min	31.1	39	42	NA	NA	NA	NA	45	NA	NA
       sample5	I_CPB10min	31.2	37	42	NA	NA	NA	NA	44	NA	NA
       sample5	J_CPB15min	31	37	40	NA	NA	NA	NA	50	NA	NA
       sample5	K_CPB20min	31.2	37	37	NA	NA	NA	NA	46	NA	NA
       sample5	L_Post-CPB	35	40	58	82	73	85	62	39	3.8	10
       sample5	M_Post-CPB5min	35.4	47	70	143	74	105	96	39	4	4
       sample5	N_Post-CPB10min	36.6	42	77	125	71	88	96	49	4.1	4
       sample5	O_Post-CPB15min	36.6	45	78	135	78	91	90	52	4	3
       sample5	P_Post-CPB20min	36.6	45	77	140	80	92	85	58	3.8	4
       sample6	A_Baseline	36.5	99	98	99	36	57	53	96	4	12
       sample6	B_Intubation	36.8	65	89	99	36	57	45	57	3.8	10
       sample6	C_Incision	36.8	62	86	134	61	79	52	55	5	10
       sample6	D_pre-CPB15min	36.5	58	74	132	58	76	51	63	4.8	9
       sample6	E_pre-CPB10min	36.3	58	74	132	51	74	55	42	4.6	8
       sample6	F_pre-CPB5min	36.5	57	73	130	55	80	51	49	4.8	9
       sample6	G_CPB	34.3	39	34	NA	NA	NA	NA	49	NA	NA
       sample6	H_CPB5min	33.2	41	37	NA	NA	NA	NA	49	NA	NA
       sample6	I_CPB10min	33.1	42	33	NA	NA	NA	NA	46	NA	NA
       sample6	J_CPB15min	33.3	37	46	NA	NA	NA	NA	49	NA	NA
       sample6	K_CPB20min	33.2	31	45	NA	NA	NA	NA	46	NA	NA
       sample6	L_Post-CPB	35.5	57	65	132	51	74	52	46	4.9	10
       sample6	M_Post-CPB5min	36.2	62	71	130	55	80	50	48	4.8	9
       sample6	N_Post-CPB10min	36.6	60	72	134	61	79	51	49	4.3	8
       sample6	O_Post-CPB15min	36.5	61	70	132	58	76	53	59	4.5	19
       sample6	P_Post-CPB20min	36.3	57	66	122	64	89	55	46	4.6	16
       sample7	A_Baseline	36.2	98	99	168	80	107	89	96	4.1	5
       sample7	B_Intubation	36.2	33	67	122	64	89	75	38	3.5	10
       sample7	C_Incision	36.2	51	81	171	83	112	88	35	4.1	11
       sample7	D_pre-CPB15min	36.2	58	86	166	86	114	90	31	3.7	13
       sample7	E_pre-CPB10min	36.2	72	67	143	74	101	88	44	4	13
       sample7	F_pre-CPB5min	36.2	71	80	150	84	107	85	37	4.8	15
       sample7	G_CPB	33.9	81	38	NA	NA	NA	NA	38	NA	NA
       sample7	H_CPB5min	32.3	67	38	NA	NA	NA	NA	38	NA	NA
       sample7	I_CPB10min	31.2	38	40	NA	NA	NA	NA	40	NA	NA
       sample7	J_CPB15min	31.2	61	33	NA	NA	NA	NA	33	NA	NA
       sample7	K_CPB20min	31.2	53	38	NA	NA	NA	NA	38	NA	NA
       sample7	L_Post-CPB	35.8	43	53	100	68	78	99	35	3.1	16
       sample7	M_Post-CPB5min	36.3	60	87	135	64	86	94	34	5.2	13
       sample7	N_Post-CPB10min	36.3	55	85	123	63	81	98	50	4.8	4
       sample7	O_Post-CPB15min	36.3	71	74	138	68	90	101	37	5.4	7
       sample7	P_Post-CPB20min	36.3	74	89	135	67	87	100	39	5.3	7
       sample8	A_Baseline	36.7	94	97	144	60	89	56	90	3.7	3
       sample8	B_Intubation	36.6	70	60	120	53	76	62	56	4	6
       sample8	C_Incision	36.6	80	79	127	60	78	61	57	4	6
       sample8	D_pre-CPB15min	36.6	70	69	125	61	76	66	41	5	9
       sample8	E_pre-CPB10min	36.6	68	69	143	66	91	67	40	4	9
       sample8	F_pre-CPB5min	36.5	65	66	130	70	80	63	45	5	10
       sample8	G_CPB	33.2	56	60	NA	NA	NA	NA	40	NA	NA
       sample8	H_CPB5min	33.1	53	53	NA	NA	NA	NA	41	NA	NA
       sample8	I_CPB10min	32.1	49	51	NA	NA	NA	NA	40	NA	NA
       sample8	J_CPB15min	32.1	41	48	NA	NA	NA	NA	39	NA	NA
       sample8	K_CPB20min	32.5	43	46	NA	NA	NA	NA	40	NA	NA
       sample8	L_Post-CPB	36.1	57	72	87	65	72	87	42	4.5	5
       sample8	M_Post-CPB5min	36.5	52	72	142	65	87	93	41	4.7	8
       sample8	N_Post-CPB10min	36.5	57	70	146	65	89	94	26	2.7	10
       sample8	O_Post-CPB15min	36.5	60	71	132	66	87	77	47	1.5	11
       sample8	P_Post-CPB20min	36.5	61	69	143	105	116	76	37	3	10
       sample9	A_Baseline	36.5	98	99	116	72	89	72	90	3.5	22
       sample9	B_Intubation	36.4	46	68	117	70	88	71	40	3.5	21
       sample9	C_Incision	36.5	46	66	105	57	72	72	36	3.5	21
       sample9	D_pre-CPB15min	36.5	45	64	117	70	85	71	39	3.2	17
       sample9	E_pre-CPB10min	35.8	49	69	128	61	71	69	40	3.3	18
       sample9	F_pre-CPB5min	35.8	49	72	107	50	80	68	36	3	19
       sample9	G_CPB	31.7	49	49	NA	NA	NA	NA	43	NA	NA
       sample9	H_CPB5min	31	28	33	NA	NA	NA	NA	46	NA	NA
       sample9	I_CPB10min	31	27	35	NA	NA	NA	NA	47	NA	NA
       sample9	J_CPB15min	31	21	39	NA	NA	NA	NA	36	NA	NA
       sample9	K_CPB20min	31	19	41	NA	NA	NA	NA	36	NA	NA
       sample9	L_Post-CPB	36.2	50	68	64	51	54	86	41	5.7	9
       sample9	M_Post-CPB5min	36.2	56	90	113	60	74	83	43	5.7	9
       sample9	N_Post-CPB10min	36.5	72	84	108	58	72	96	57	7	14
       sample9	O_Post-CPB15min	36.6	70	75	122	59	75	94	42	6.5	12
       sample9	P_Post-CPB20min	36.5	67	68	110	56	71	94	43	5.8	13
       sample10	A_Baseline	37	99	98	122	70	78	53	89	2.1	9
       sample10	B_Intubation	37	39	68	118	86	93	52	43	2.7	9
       sample10	C_Incision	37	50	74	128	70	88	53	42	3.6	9
       sample10	D_pre-CPB15min	37	56	71	123	70	87	55	34	3.5	9
       sample10	E_pre-CPB10min	37	57	69	128	70	88	60	45	2.8	10
       sample10	F_pre-CPB5min	36.8	58	68	125	55	72	58	46	3.6	9
       sample10	G_CPB	30.9	51	39	NA	NA	NA	NA	28	NA	NA
       sample10	H_CPB5min	31.2	53	41	NA	NA	NA	NA	34	NA	NA
       sample10	I_CPB10min	31.2	55	42	NA	NA	NA	NA	40	NA	NA
       sample10	J_CPB15min	32.2	52	45	NA	NA	NA	NA	41	NA	NA
       sample10	K_CPB20min	32.3	51	45	NA	NA	NA	NA	45	NA	NA
       sample10	L_Post-CPB	35.6	50	71	125	55	72	76	41	7.6	4
       sample10	M_Post-CPB5min	35.3	52	70	122	60	78	75	50	7.3	5
       sample10	N_Post-CPB10min	35.3	55	69	138	70	89	70	41	6.6	5
       sample10	O_Post-CPB15min	35.5	56	65	135	78	81	71	40	6	6
       sample10	P_Post-CPB20min	35.6	53	80	130	68	85	72	41	5.9	6
       sample11	A_Baseline	36.5	99	99	158	61	95	62	96	3.7	9
       sample11	B_Intubation	36.5	60	74	143	60	76	45	41	3.7	8
       sample11	C_Incision	36.2	54	73	123	55	82	43	31	3.7	8
       sample11	D_pre-CPB15min	36.2	56	70	131	59	78	43	45	10	5
       sample11	E_pre-CPB10min	36.3	50	62	128	55	77	43	39	4.6	8
       sample11	F_pre-CPB5min	36.3	55	63	126	66	87	67	46	4.6	8
       sample11	G_CPB	33.5	40	45	NA	NA	NA	NA	42	NA	NA
       sample11	H_CPB5min	32.7	36	38	NA	NA	NA	NA	40	NA	NA
       sample11	I_CPB10min	33	37	38	NA	NA	NA	NA	43	NA	NA
       sample11	J_CPB15min	32	38	35	NA	NA	NA	NA	45	NA	NA
       sample11	K_CPB20min	32	36	38	NA	NA	NA	NA	46	NA	NA
       sample11	L_Post-CPB	36.4	47	61	123	55	78	79	45	5.3	8
       sample11	M_Post-CPB5min	36.4	45	57	133	62	88	84	41	6.7	3
       sample11	N_Post-CPB10min	36.4	55	66	130	76	89	87	43	5.3	9
       sample11	O_Post-CPB15min	36.5	53	70	122	49	55	80	40	6.7	9
       sample11	P_Post-CPB20min	36.5	49	67	132	60	70	81	41	6.6	8
       sample12	A_Baseline	37.4	98	99	125	60	85	71	98	3.5	13
       sample12	B_Intubation	37.4	45	71	132	72	88	73	45	3.5	12
       sample12	C_Incision	37.4	41	61	112	70	NA	65	44	3.6	11
       sample12	D_pre-CPB15min	36.9	67	81	123	68	85	64	49	3.7	7
       sample12	E_pre-CPB10min	36.4	68	80	123	68	85	64	49	2.7	8
       sample12	F_pre-CPB5min	36.4	55	67	90	56	65	72	49	2.8	22
       sample12	G_CPB	31	52	40	NA	NA	NA	NA	40	NA	NA
       sample12	H_CPB5min	30.7	52	41	NA	NA	NA	NA	40	NA	NA
       sample12	I_CPB10min	30.8	50	50	NA	NA	NA	NA	40	NA	NA
       sample12	J_CPB15min	30.6	51	52	NA	NA	NA	NA	39	NA	NA
       sample12	K_CPB20min	30.9	52	51	NA	NA	NA	NA	39	NA	NA
       sample12	L_Post-CPB	36.4	67	81	83	51	61	83	40	4.8	17
       sample12	M_Post-CPB5min	36.7	68	80	126	59	77	72	41	5.3	13
       sample12	N_Post-CPB10min	36.6	55	67	111	60	73	79	54	4.6	8
       sample12	O_Post-CPB15min	37	69	81	114	61	75	79	54	4.5	8
       sample12	P_Post-CPB20min	37	66	85	115	60	74	79	55	4.3	7
       sample13	A_Baseline	36.6	99	99	155	65	89	69	89	4.1	8
       sample13	B_Intubation	36.6	56	69	132	70	76	68	47	4	7
       sample13	C_Incision	36.6	42	64	139	59	86	65	49	4.9	7
       sample13	D_pre-CPB15min	36.5	50	71	138	62	88	70	41	4.7	7
       sample13	E_pre-CPB10min	36.5	57	72	127	80	89	70	45	4.9	8
       sample13	F_pre-CPB5min	36.5	56	71	113	63	73	74	46	4.2	7
       sample13	G_CPB	33.2	40	50	NA	NA	NA	NA	52	NA	NA
       sample13	H_CPB5min	32.9	50	49	NA	NA	NA	NA	50	NA	NA
       sample13	I_CPB10min	32.6	45	48	NA	NA	NA	NA	52	NA	NA
       sample13	J_CPB15min	32.1	43	42	NA	NA	NA	NA	64	NA	NA
       sample13	K_CPB20min	33.2	35	32	NA	NA	NA	NA	55	NA	NA
       sample13	L_Post-CPB	36.2	47	68	90	57	65	61	51	4.8	16
       sample13	M_Post-CPB5min	36.5	44	67	91	47	61	78	52	4.9	8
       sample13	N_Post-CPB10min	36.5	51	74	119	57	80	85	54	4.6	8
       sample13	O_Post-CPB15min	36.5	44	69	132	65	88	86	55	4.9	8
       sample13	P_Post-CPB20min	36.5	43	69	110	56	73	87	49	5	10
       sample14	A_Baseline	36.8	99	98	122	65	83	61	96	4.5	4
       sample14	B_Intubation	36.9	42	55	115	60	75	69	58	4.8	6
       sample14	C_Incision	36.8	45	60	111	72	85	69	57	4	10
       sample14	D_pre-CPB15min	36.8	47	65	118	73	85	68	59	4.3	11
       sample14	E_pre-CPB10min	36.8	46	66	116	78	83	68	45	4.5	10
       sample14	F_pre-CPB5min	36.8	47	66	112	70	81	66	47	4.7	9
       sample14	G_CPB	32	32	33	NA	NA	NA	NA	45	NA	NA
       sample14	H_CPB5min	32	32	28	NA	NA	NA	NA	45	NA	NA
       sample14	I_CPB10min	31	30	26	NA	NA	NA	NA	46	NA	NA
       sample14	J_CPB15min	31	29	24	NA	NA	NA	NA	45	NA	NA
       sample14	K_CPB20min	31	29	19	NA	NA	NA	NA	43	NA	NA
       sample14	L_Post-CPB	35.6	41	48	106	54	NA	NA	40	5	11
       sample14	M_Post-CPB5min	36	51	68	125	59	79	NA	54	3	12.8
       sample14	N_Post-CPB10min	36.5	63	79	144	65	NA	NA	54	3	11.7
       sample14	O_Post-CPB15min	36.8	61	61	129	64	NA	NA	58	2	10.2
       sample14	P_Post-CPB20min	36.8	59	65	98	55	NA	NA	54	8.7	11
       sample15	A_Baseline	36.5	98	98	141	89	113	63	98	5	10
       sample15	B_Intubation	36.5	38	65	136	78	101	71	45	6	11
       sample15	C_Incision	36.5	41	61	141	89	110	62	50	6.8	10
       sample15	D_pre-CPB15min	36.5	41	70	145	89	111	63	45	3.1	15
       sample15	E_pre-CPB10min	36.5	42	71	149	84	116	61	38	4.1	11
       sample15	F_pre-CPB5min	36.5	45	78	111	72	85	79	37	4	13
       sample15	G_CPB	31	25	33	NA	NA	NA	NA	44	NA	NA
       sample15	H_CPB5min	31	18	38	NA	NA	NA	NA	45	NA	NA
       sample15	I_CPB10min	31.5	18	39	NA	NA	NA	NA	43	NA	NA
       sample15	J_CPB15min	31	12	37	NA	NA	NA	NA	39	NA	NA
       sample15	K_CPB20min	31	13	37	NA	NA	NA	NA	55	NA	NA
       sample15	L_Post-CPB	34	41	43	121	70	87	76	55	4.1	11
       sample15	M_Post-CPB5min	36.5	44	71	96	65	NA	70	53	6.8	10
       sample15	N_Post-CPB10min	36.5	45	61	61	52	NA	67	47	6	11
       sample15	O_Post-CPB15min	36.5	47	65	122	67	NA	68	48	6.8	9
       sample15	P_Post-CPB20min	36.5	48	68	124	45	NA	70	48	5	10
       sample16	A_Baseline	36.2	99	98	147	77	92	74	89	NA	NA
       sample16	B_Intubation	36.2	50	68	117	60	81	64	36	34	8
       sample16	C_Incision	36.2	48	68	119	60	81	56	38	3.3	7
       sample16	D_pre-CPB15min	36.5	50	70	120	61	83	57	35	3.4	6
       sample16	E_pre-CPB10min	36.2	72	75	117	59	80	56	38	3.6	5
       sample16	F_pre-CPB5min	36.2	55	71	121	65	86	56	30	3.1	11
       sample16	G_CPB	32.2	53	48	NA	NA	NA	NA	46	NA	NA
       sample16	H_CPB5min	32.2	49	57	NA	NA	NA	NA	50	NA	NA
       sample16	I_CPB10min	32.2	50	52	NA	NA	NA	NA	52	NA	NA
       sample16	J_CPB15min	32.1	50	49	NA	NA	NA	NA	52	NA	NA
       sample16	K_CPB20min	32	45	48	NA	NA	NA	NA	50	NA	NA
       sample16	L_Post-CPB	36.2	50	68	94	41	64	86	41	5.7	9
       sample16	M_Post-CPB5min	36.2	60	76	131	68	92	57	41	3.6	6
       sample16	N_Post-CPB10min	36.2	57	72	124	65	87	58	36	3.6	6
       sample16	O_Post-CPB15min	36.2	60	76	131	68	92	57	41	3.6	6
       sample16	P_Post-CPB20min	36.2	57	72	124	65	87	58	36	3.6	6
       sample17	A_Baseline	36.5	97	99	119	60	81	72	96	NA	NA
       sample17	B_Intubation	36.5	33	34	120	61	83	88	41	4.2	4.5
       sample17	C_Incision	36.5	41	67	117	59	80	81	43	4.5	12
       sample17	D_pre-CPB15min	36.5	41	67	105	58	75	51	43	4.3	13
       sample17	E_pre-CPB10min	36.5	42	60	112	63	81	51	42	4.2	5
       sample17	F_pre-CPB5min	36.5	48	65	113	64	82	55	48	4	6
       sample17	G_CPB	33.5	40	51	NA	NA	NA	NA	48	NA	NA
       sample17	H_CPB5min	32.5	41	49	NA	NA	NA	NA	49	NA	NA
       sample17	I_CPB10min	31.5	39	45	NA	NA	NA	NA	51	NA	NA
       sample17	J_CPB15min	30.5	55	54	NA	NA	NA	NA	50	NA	NA
       sample17	K_CPB20min	31	51	41	NA	NA	NA	NA	50	NA	NA
       sample17	L_Post-CPB	35	50	82	85	60	70	56	51	1.8	21
       sample17	M_Post-CPB5min	36	51	80	90	64	74	50	52	2.2	18
       sample17	N_Post-CPB10min	36.5	53	86	102	65	79	76	49	3.2	16
       sample17	O_Post-CPB15min	36.6	52	82	108	65	79	78	51	3.8	10
       sample17	P_Post-CPB20min	36.7	55	86	119	68	88	78	52	4	12
       sample18	A_Baseline	36.6	96	98	116	78	91	99	97	NA	19
       sample18	B_Intubation	36.6	50	87	123	78	97	76	35	3.4	19
       sample18	C_Incision	36.6	48	83	122	76	93	69	39	3.3	18
       sample18	D_pre-CPB15min	36.6	46	76	135	84	104	66	38	3.5	18
       sample18	E_pre-CPB10min	36.8	48	83	115	80	91	78	50	3.6	19
       sample18	F_pre-CPB5min	36.8	45	80	117	79	90	70	51	3.8	18
       sample18	G_CPB	33.1	47	50	NA	NA	NA	NA	51	NA	NA
       sample18	H_CPB5min	31	48	42	NA	NA	NA	NA	45	NA	NA
       sample18	I_CPB10min	31	45	40	NA	NA	NA	NA	47	NA	NA
       sample18	J_CPB15min	31	46	41	NA	NA	NA	NA	55	NA	NA
       sample18	K_CPB20min	31	46	39	NA	NA	NA	NA	43	NA	NA
       sample18	L_Post-CPB	35	45	51	90	47	56	90	50	3.3	12
       sample18	M_Post-CPB5min	36.8	44	79	98	51	59	82	50	5	12
       sample18	N_Post-CPB10min	36.8	45	75	99	55	60	74	51	15	15
       sample18	O_Post-CPB15min	36.8	46	77	113	60	74	71	53	5.6	12
       sample18	P_Post-CPB20min	36.8	50	76	123	55	82	70	56	5.1	13
       sample19	A_Baseline	36.5	97	96	186	86	120	71	96	3.5	7
       sample19	B_Intubation	36.5	36	69	142	80	102	32	43	3.5	6
       sample19	C_Incision	36.5	35	45	110	67	83	51	46	3.6	12
       sample19	D_pre-CPB15min	36.3	37	45	121	74	91	50	41	3.1	13
       sample19	E_pre-CPB10min	36.3	36	44	123	75	93	57	42	3.2	15
       sample19	F_pre-CPB5min	36.3	40	48	124	75	94	57	43	3.3	16
       sample19	G_CPB	33.1	44	29	NA	NA	NA	NA	44	NA	NA
       sample19	H_CPB5min	33.2	44	38	NA	NA	NA	NA	45	NA	NA
       sample19	I_CPB10min	31.8	40	34	NA	NA	NA	NA	46	NA	NA
       sample19	J_CPB15min	31.6	45	36	NA	NA	NA	NA	45	NA	NA
       sample19	K_CPB20min	31.9	47	37	NA	NA	NA	NA	43	NA	NA
       sample19	L_Post-CPB	35	40	42	NA	NA	NA	NA	46	3.5	15
       sample19	M_Post-CPB5min	35.5	37	42	NA	NA	NA	NA	41	3.1	13
       sample19	N_Post-CPB10min	35.5	36	49	NA	NA	NA	NA	40	3.8	13
       sample19	O_Post-CPB15min	36.5	48	70	NA	NA	NA	NA	50	3.3	11
       sample19	P_Post-CPB20min	36.5	42	71	NA	NA	NA	NA	46	3.9	12
       sample20	A_Baseline	36.7	97	96	118	63	81	59	87	NA	NA
       sample20	B_Intubation	36.7	38	50	114	64	82	59	36	3.6	9
       sample20	C_Incision	36.7	39	51	121	69	89	52	34	3.8	8
       sample20	D_pre-CPB15min	36.1	42	58	115	65	63	46	45	39	7
       sample20	E_pre-CPB10min	36	57	65	121	69	89	52	34	3.8	8
       sample20	F_pre-CPB5min	36.2	57	70	115	65	63	46	45	39	7
       sample20	G_CPB	33.1	44	59	NA	NA	NA	NA	45	NA	NA
       sample20	H_CPB5min	33.2	44	58	NA	NA	NA	NA	42	NA	NA
       sample20	I_CPB10min	31.8	40	54	55	37	55	33	36	NA	NA
       sample20	J_CPB15min	31.6	45	45	NA	NA	NA	NA	42	NA	NA
       sample20	K_CPB20min	31.9	47	46	NA	NA	NA	NA	39	NA	NA
       sample20	L_Post-CPB	34.5	52	78	82	62	73	112	51	NA	NA
       sample20	M_Post-CPB5min	36.2	54	81	110	80	93	102	46	NA	NA
       sample20	N_Post-CPB10min	36.2	43	63	112	61	73	98	48	NA	NA
       sample20	O_Post-CPB15min	36.5	45	64	128	71	90	90	43	NA	NA
       sample20	P_Post-CPB20min	36.6	47	68	128	64	81	78	45	NA	NA
       sample21	A_Baseline	36.7	97	99	176	87	119	63	81	NA	NA
       sample21	B_Intubation	36.7	33	46	157	75	101	53	36	NA	NA
       sample21	C_Incision	36.5	35	32	139	70	92	50	41	NA	NA
       sample21	D_pre-CPB15min	36.5	51	70	140	70	92	46	42	NA	NA
       sample21	E_pre-CPB10min	36.3	49	60	151	77	101	46	45	4.2	5
       sample21	F_pre-CPB5min	36.2	52	65	155	79	104	50	43	4.2	5
       sample21	G_CPB	35.6	38	32	NA	NA	NA	NA	40	NA	NA
       sample21	H_CPB5min	35	39	33	NA	NA	NA	NA	40	NA	NA
       sample21	J_CPB15min	34	35	27	NA	NA	NA	NA	40	NA	NA
       sample21	K_CPB20min	33	32	23	NA	NA	NA	NA	37	NA	NA
       sample21	L_Post-CPB	35.8	44	56	124	64	80	73	43	5.8	10
       sample21	M_Post-CPB5min	35.9	55	70	122	63	79	74	42	5.7	12
       sample21	N_Post-CPB10min	36	50	70	136	71	89	81	51	6.4	11
       sample21	O_Post-CPB15min	35.8	58	66	115	66	80	86	37	6.8	12
       sample21	P_Post-CPB20min	36	53	68	129	64	83	79	46	6.9	9
       sample22	A_Baseline	37.6	97	99	115	55	76	62	98	4.4	8
       sample22	B_Intubation	36.7	38	40	117	56	78	53	51	4.4	9
       sample22	C_Incision	36.7	75	92	124	57	80	47	35	4.4	10
       sample22	D_pre-CPB15min	36.6	63	89	128	57	81	45	46	4.5	8
       sample22	E_pre-CPB10min	36.5	55	89	101	51	72	46	40	4.1	11
       sample22	F_pre-CPB5min	36.5	54	70	110	53	73	46	44	3.7	18
       sample22	G_CPB	32	28	15	NA	NA	NA	NA	34	NA	NA
       sample22	H_CPB5min	32.7	28	13	NA	NA	NA	NA	34	NA	NA
       sample22	I_CPB10min	31.6	26	12	NA	NA	NA	NA	32	NA	NA
       sample22	J_CPB15min	31.4	32	18	NA	NA	NA	NA	36	NA	NA
       sample22	K_CPB20min	31.5	29	14	NA	NA	NA	NA	35	NA	NA
       sample22	L_Post-CPB	36.4	71	96	54	47	49	79	41	NA	NA
       sample22	M_Post-CPB5min	36.4	63	94	56	51	64	83	44	NA	NA
       sample22	N_Post-CPB10min	36.4	47	68	133	63	84	113	32	8.5	10
       sample22	O_Post-CPB15min	36.4	50	76	133	63	84	113	30	8.6	9
       sample22	P_Post-CPB20min	36.4	50	73	130	63	83	114	26	8.7	9
       sample23	A_Baseline	36.5	98	97	167	84	117	64	93	5.5	16
       sample23	B_Intubation	36.6	37	68	112	64	NA	69	52	6.1	8
       sample23	C_Incision	36.5	40	60	159	82	112	68	51	6.3	9
       sample23	D_pre-CPB15min	36.2	45	62	148	84	112	74	41	5.4	11
       sample23	E_pre-CPB10min	36	53	78	133	75	98	76	53	4.3	18
       sample23	F_pre-CPB5min	36	57	73	123	90	90	74	52	4.4	17
       sample23	G_CPB	31.8	45	53	NA	NA	NA	NA	50	NA	NA
       sample23	H_CPB5min	31.9	41	46	NA	NA	NA	NA	49	NA	NA
       sample23	I_CPB10min	31.2	46	52	NA	NA	NA	NA	49	NA	NA
       sample23	J_CPB15min	31.3	44	54	NA	NA	NA	NA	41	NA	NA
       sample23	K_CPB20min	31.2	39	48	NA	NA	65	NA	52	NA	NA
       sample23	L_Post-CPB	35.1	54	80	118	80	83	97	47	7.3	12
       sample23	M_Post-CPB5min	35.6	45	72	117	65	79	94	53	7.7	8
       sample23	N_Post-CPB10min	36.5	52	71	111	62	76	88	42	7.4	10
       sample23	O_Post-CPB15min	36.6	53	72	115	63	77	88	45	7.4	9
       sample23	P_Post-CPB20min	36.5	48	67	113	62	76	87	45	7.5	12
       sample24	A_Baseline	36.5	95	95	127	65	90	62	96	NA	NA
       sample24	B_Intubation	36.5	39	60	99	49	67	52	31	NA	NA
       sample24	C_Incision	36.5	39	68	145	78	105	58	21	5	3
       sample24	D_pre-CPB15min	36.7	46	59	145	74	95	48	38	3.7	5
       sample24	E_pre-CPB10min	36.7	45	56	146	75	97	45	41	4	6
       sample24	F_pre-CPB5min	36	47	55	145	75	99	63	44	6.3	9
       sample24	G_CPB	30.4	30	37	NA	NA	NA	NA	33	NA	NA
       sample24	H_CPB5min	30.7	48	35	NA	NA	NA	NA	30	NA	NA
       sample24	I_CPB10min	30.5	43	37	NA	NA	NA	NA	36	NA	NA
       sample24	J_CPB15min	30.8	49	43	NA	NA	NA	NA	47	NA	NA
       sample24	K_CPB20min	30.6	49	39	NA	NA	NA	NA	46	NA	NA
       sample24	L_Post-CPB	36	38	66	123	63	82	74	35	5.2	7
       sample24	M_Post-CPB5min	36	47	72	132	69	87	74	37	4.9	10
       sample24	N_Post-CPB10min	36.2	44	65	118	59	74	76	34	4.4	10
       sample24	O_Post-CPB15min	36.2	49	80	110	51	68	61	34	4.4	8
       sample24	P_Post-CPB20min	36.2	44	68	119	56	72	59	28	4.7	7
       sample25	A_Baseline	36.4	97	98	102	57	75	51	96	3.4	12
       sample25	B_Intubation	36.4	38	52	113	65	83	43	30	3.3	13
       sample25	C_Incision	36	48	71	85	53	64	50	35	3.7	15
       sample25	D_pre-CPB15min	36	49	83	116	71	88	47	27	3.1	12
       sample25	E_pre-CPB10min	36	44	69	127	75	94	45	32	3.2	10
       sample25	F_pre-CPB5min	36	48	68	134	79	100	28	29	3.2	12
       sample25	G_CPB	32	48	39	NA	NA	NA	NA	28	NA	NA
       sample25	H_CPB5min	32	42	41	NA	NA	NA	NA	38	NA	NA
       sample25	I_CPB10min	31.8	40	40	NA	NA	NA	NA	41	NA	NA
       sample25	J_CPB15min	31.7	43	38	NA	NA	NA	NA	33	NA	NA
       sample25	K_CPB20min	32	50	35	NA	NA	NA	NA	35	NA	NA
       sample25	L_Post-CPB	36.2	46	85	106	60	75	41	30	3.7	10
       sample25	M_Post-CPB5min	36.2	44	67	106	59	75	40	33	3.7	10
       sample25	N_Post-CPB10min	36.3	53	80	104	59	74	52	30	3.2	10
       sample25	O_Post-CPB15min	31.3	52	88	104	59	74	49	34	3.1	10
       sample25	P_Post-CPB20min	36.4	46	73	109	60	78	45	34	3.2	14
       sample26	A_Baseline	36	97	99	150	55	86	87	89	NA	NA
       sample26	B_Intubation	36	35	35	133	51	82	62	42	4.2	6
       sample26	C_Incision	36	50	70	113	47	71	58	45	4.2	11
       sample26	D_pre-CPB15min	36	50	72	135	53	84	51	41	4.3	4
       sample26	E_pre-CPB10min	36	46	64	130	52	81	51	41	5.2	7
       sample26	F_pre-CPB5min	36	49	67	137	58	89	53	53	4.9	4
       sample26	G_CPB	31.6	38	35	NA	NA	NA	NA	30	NA	NA
       sample26	H_CPB5min	31.6	39	25	NA	NA	NA	NA	30	NA	NA
       sample26	I_CPB10min	31	39	28	NA	NA	NA	NA	31	NA	NA
       sample26	J_CPB15min	31.2	38	25	NA	NA	NA	NA	40	NA	NA
       sample26	K_CPB20min	31.6	37	30	NA	NA	NA	NA	41	NA	NA
       sample26	L_Post-CPB	35.1	51	78	64	57	60	90	38	4.6	8
       sample26	M_Post-CPB5min	36	50	71	124	53	77	81	40	4	7
       sample26	N_Post-CPB10min	36	55	74	126	54	77	80	30	4.5	8
       sample26	O_Post-CPB15min	36.2	52	81	128	55	79	81	35	4.6	8
       sample26	P_Post-CPB20min	36.2	52	78	126	54	77	81	33	4.5	8
       sample27	A_Baseline	36.6	97	99	135	56	86	63	87	NA	NA
       sample27	B_Intubation	36.6	54	77	136	58	88	52	34	4.8	5
       sample27	C_Incision	36.6	48	68	135	58	87	52	41	4.9	4
       sample27	D_pre-CPB15min	36.5	50	75	115	52	72	51	39	3.9	11
       sample27	E_pre-CPB10min	36.3	56	80	129	60	85	52	51	4.4	7
       sample27	F_pre-CPB5min	36	58	79	119	59	78	60	58	4.1	9
       sample27	G_CPB	33	45	39	NA	NA	NA	NA	50	NA	NA
       sample27	H_CPB5min	31.5	38	28	NA	NA	NA	NA	45	NA	NA
       sample27	I_CPB10min	31.5	39	29	NA	NA	NA	NA	41	NA	NA
       sample27	J_CPB15min	31.5	30	18	NA	NA	NA	NA	34	NA	NA
       sample27	K_CPB20min	31.5	35	23	NA	NA	NA	NA	40	NA	NA
       sample27	L_Post-CPB	35	NA	NA	128	64	81	78	44	6.6	6
       sample27	M_Post-CPB5min	36.5	57	73	125	57	82	46	39	4.4	12
       sample27	N_Post-CPB10min	36.5	54	72	126	58	82	47	45	4.4	11
       sample27	O_Post-CPB15min	36.5	57	73	125	57	82	46	51	4.4	12
       sample27	P_Post-CPB20min	36.5	54	72	126	58	82	47	40	4.4	11
       sample28	A_Baseline	36.7	97	99	111	70	79	88	90	NA	NA
       sample28	B_Intubation	36.7	48	54	91	52	66	50	40	2.7	9
       sample28	C_Incision	36.7	49	74	111	67	82	53	45	2.5	8
       sample28	D_pre-CPB15min	36.7	47	79	106	63	78	46	47	2.3	10
       sample28	E_pre-CPB10min	36.7	47	84	96	58	71	47	47	2.4	5
       sample28	F_pre-CPB5min	36	41	77	110	64	80	72	48	2.5	5
       sample28	G_CPB	31	53	57	NA	NA	NA	NA	41	NA	NA
       sample28	H_CPB5min	30.1	53	58	NA	NA	NA	NA	40	NA	NA
       sample28	I_CPB10min	29.5	48	48	NA	NA	NA	NA	42	NA	NA
       sample28	J_CPB15min	29.5	45	47	NA	NA	NA	NA	40	NA	NA
       sample28	K_CPB20min	28.8	48	45	NA	NA	NA	NA	40	NA	NA
       sample28	L_Post-CPB	36	55	76	119	66	84	90	43	1.3	7
       sample28	M_Post-CPB5min	36.5	53	83	124	73	87	94	42	2.1	7
       sample28	N_Post-CPB10min	36.6	48	73	134	74	88	89	49	2.9	10
       sample28	O_Post-CPB15min	36.6	47	78	102	62	70	84	49	3.3	12
       sample28	P_Post-CPB20min	36.3	45	75	117	66	83	86	43	3.3	6
       sample29	A_Baseline	36.2	97	98	169	69	109	62	91	NA	NA
       sample29	B_Intubation	36.2	50	42	128	56	81	60	49	6	4
       sample29	C_Incision	36.2	47	52	112	50	70	60	50	6.2	5
       sample29	D_pre-CPB15min	36.3	51	82	129	63	86	67	50	6.1	8
       sample29	E_pre-CPB10min	36.2	50	77	121	59	81	67	53	5.9	9
       sample29	F_pre-CPB5min	36.1	45	68	141	69	95	57	45	5.3	10
       sample29	G_CPB	35	43	51	NA	NA	NA	NA	51	NA	NA
       sample29	H_CPB5min	33	38	45	NA	NA	NA	NA	41	NA	NA
       sample29	I_CPB10min	31.8	41	48	NA	NA	NA	NA	45	NA	NA
       sample29	J_CPB15min	31.6	39	46	NA	NA	NA	NA	44	NA	NA
       sample29	K_CPB20min	31.4	38	44	NA	NA	NA	NA	44	NA	NA
       sample29	L_Post-CPB	35.9	48	68	112	64	81	83	45	3.1	4
       sample29	M_Post-CPB5min	36.1	46	70	114	65	76	86	46	5.3	7
       sample29	N_Post-CPB10min	36.5	43	76	106	54	72	89	49	7.1	11
       sample29	O_Post-CPB15min	36.4	48	77	111	51	73	84	46	7.6	8
       sample29	P_Post-CPB20min	36.5	49	78	117	52	72	84	51	7.1	7
       sample30	A_Baseline	37	99	98	121	58	78	69	91	4.5	11
       sample30	B_Intubation	37	52	73	115	59	77	54	32	4	10
       sample30	C_Incision	37	50	78	142	89	100	56	34	2.8	8
       sample30	D_pre-CPB15min	36.9	54	69	121	72	89	61	38	3.7	15
       sample30	E_pre-CPB10min	36.7	51	70	110	64	78	63	38	3.9	18
       sample30	F_pre-CPB5min	36.1	59	82	115	65	81	79	35	5.3	13
       sample30	G_CPB	32.7	62	53	NA	NA	NA	NA	43	NA	NA
       sample30	H_CPB5min	30.4	58	54	NA	NA	NA	NA	31	NA	NA
       sample30	I_CPB10min	32.8	46	45	NA	NA	NA	NA	30	NA	NA
       sample30	J_CPB15min	32.9	46	53	NA	NA	NA	NA	32	NA	NA
       sample30	K_CPB20min	32	45	50	NA	NA	NA	NA	33	NA	NA
       sample30	L_Post-CPB	36	48	66	NA	NA	NA	NA	42	NA	NA
       sample30	M_Post-CPB5min	36.6	45	75	101	52	69	94	42	5.2	6
       sample30	N_Post-CPB10min	36.6	52	82	135	58	78	94	35	7.9	13
       sample30	O_Post-CPB15min	36.6	64	89	113	52	72	84	41	8.7	14
       sample30	P_Post-CPB20min	36.2	51	72	100	54	70	81	40	7.3	9
       sample31	A_Baseline	36.5	98	98	136	75	97	65	90	4	9
       sample31	B_Intubation	36.5	60	89	135	74	96	70	36	4.5	7
       sample31	C_Incision	36.5	65	73	143	76	100	70	35	4.8	6
       sample31	D_pre-CPB15min	36.5	63	82	133	72	93	71	41	4	9
       sample31	E_pre-CPB10min	36.5	65	73	136	70	91	72	37	4.5	7
       sample31	F_pre-CPB5min	36.5	63	72	125	70	87	70	40	4.8	6
       sample31	G_CPB	28.6	52	40	NA	NA	NA	NA	40	NA	NA
       sample31	H_CPB5min	29.8	42	42	NA	NA	NA	NA	37	NA	NA
       sample31	I_CPB10min	30.1	49	41	NA	NA	NA	NA	38	NA	NA
       sample31	J_CPB15min	31.1	65	40	NA	NA	NA	NA	38	NA	NA
       sample31	K_CPB20min	30	68	42	NA	NA	NA	NA	38	NA	NA
       sample31	L_Post-CPB	36.5	63	73	135	74	96	70	36	4.5	7
       sample31	M_Post-CPB5min	36.5	62	72	143	76	100	70	35	4.8	6
       sample31	N_Post-CPB10min	36.5	62	71	NA	NA	85	NA	36	NA	NA
       sample31	O_Post-CPB15min	36.5	61	70	NA	NA	75	NA	36	NA	NA
       sample31	P_Post-CPB20min	36.5	66	75	NA	NA	82	NA	35	NA	NA
       sample32	A_Baseline	36.5	99	98	135	82	96	72	92	4.5	8
       sample32	B_Intubation	36.5	94	75	121	69	NA	80	55	4.1	2
       sample32	C_Incision	36.2	46	80	119	73	NA	80	57	4.1	2
       sample32	D_pre-CPB15min	36.2	57	89	118	74	NA	74	55	4.1	3
       sample32	E_pre-CPB10min	35.9	53	63	117	75	88	79	56	3.5	6
       sample32	F_pre-CPB5min	35.7	57	61	116	67	65	NA	51	NA	NA
       sample32	G_CPB	30.2	49	46	NA	NA	65	NA	45	NA	NA
       sample32	H_CPB5min	31.2	52	47	NA	NA	58	NA	45	NA	NA
       sample32	I_CPB10min	31.2	49	45	NA	NA	67	NA	46	NA	NA
       sample32	J_CPB15min	30.2	39	43	NA	NA	42	NA	43	NA	NA
       sample32	K_CPB20min	31.2	52	45	NA	NA	43	NA	42	NA	NA
       sample32	L_Post-CPB	34.5	52	52	129	72	NA	86	40	NA	NA
       sample32	M_Post-CPB5min	35.1	53	62	116	63	NA	80	51	4.9	7
       sample32	N_Post-CPB10min	36.4	49	89	120	63	84	76	53	4.8	5
       sample32	O_Post-CPB15min	36.3	38	72	104	56	72	75	60	4.5	7
       sample32	P_Post-CPB20min	36.5	56	78	131	68	90	70	56	4.5	3
       sample33	A_Baseline	36.3	90	99	132	70	NA	71	NA	NA	NA
       sample33	B_Intubation	36.3	80	65	122	66	NA	70	NA	NA	NA
       sample33	C_Incision	36.3	80	70	131	67	NA	74	NA	NA	NA
       sample33	D_pre-CPB15min	36.3	70	68	127	68	NA	75	NA	NA	NA
       sample33	E_pre-CPB10min	36.3	59	66	122	65	NA	74	NA	7.1	NA
       sample33	F_pre-CPB5min	36.3	50	69	122	60	NA	74	NA	8.4	NA
       sample33	G_CPB	33.8	44	55	NA	NA	NA	NA	NA	NA	NA
       sample33	H_CPB5min	32.5	35	50	NA	NA	NA	NA	NA	NA	NA
       sample33	I_CPB10min	33.2	40	44	NA	NA	NA	NA	NA	NA	NA
       sample33	J_CPB15min	33.3	40	45	NA	NA	NA	NA	NA	NA	NA
       sample33	K_CPB20min	32.6	41	49	NA	NA	NA	NA	NA	NA	NA
       sample33	L_Post-CPB	35.6	NA	NA	126	71	70	72	NA	6.3	NA
       sample33	M_Post-CPB5min	36.1	NA	NA	118	70	80	71	NA	6.4	NA
       sample33	N_Post-CPB10min	36.3	NA	NA	128	81	83	71	NA	4.5	NA
       sample33	O_Post-CPB15min	36.2	NA	NA	81	50	69	71	NA	4.1	NA
       sample33	P_Post-CPB20min	36.6	NA	NA	90	51	65	72	NA	4.4	NA
       sample34	A_Baseline	36.4	99	99	171	96	105	70	98	5.6	7
       sample34	B_Intubation	36.5	76	70	151	69	99	71	44	5.6	8
       sample34	C_Incision	36.5	36	74	177	83	119	71	45	4.4	4
       sample34	D_pre-CPB15min	36.5	60	67	163	80	113	72	44	5.4	4
       sample34	E_pre-CPB10min	36.5	63	65	123	59	70	70	45	5.3	11
       sample34	F_pre-CPB5min	36.1	62	63	138	68	95	72	49	5.3	5
       sample34	G_CPB	33	41	48	NA	NA	NA	NA	43	NA	NA
       sample34	H_CPB5min	30.7	38	40	NA	NA	NA	NA	35	NA	NA
       sample34	I_CPB10min	31	40	48	NA	NA	NA	NA	47	NA	NA
       sample34	J_CPB15min	30.5	41	43	NA	NA	NA	NA	46	NA	NA
       sample34	K_CPB20min	31.1	40	43	NA	NA	NA	NA	36	NA	NA
       sample34	L_Post-CPB	36.5	51	61	123	59	NA	59	42	4.3	11
       sample34	M_Post-CPB5min	36.5	57	78	129	61	NA	67	51	4.2	10
       sample34	N_Post-CPB10min	36.5	65	76	133	67	NA	70	54	5.1	8
       sample34	O_Post-CPB15min	36.5	66	71	123	76	NA	74	55	4.7	9
       sample34	P_Post-CPB20min	36.6	60	78	120	65	NA	75	50	4.4	10
       sample35	A_Baseline	36.5	99	99	135	78	NA	50	97	NA	NA
       sample35	B_Intubation	36.5	55	69	134	67	NA	41	51	NA	NA
       sample35	C_Incision	36.5	65	89	122	61	NA	38	52	NA	NA
       sample35	D_pre-CPB15min	35.5	72	77	145	59	NA	43	51	NA	NA
       sample35	E_pre-CPB10min	35.5	71	75	145	59	NA	46	50	NA	NA
       sample35	F_pre-CPB5min	35.5	71	75	141	60	NA	NA	51	NA	NA
       sample35	G_CPB	32.1	39	31	NA	NA	NA	NA	35	NA	NA
       sample35	H_CPB5min	31.1	35	37	NA	NA	NA	NA	35	NA	NA
       sample35	I_CPB10min	28.5	18	29	NA	NA	NA	NA	18	NA	NA
       sample35	J_CPB15min	31.2	32	31	NA	NA	NA	NA	36	NA	NA
       sample35	K_CPB20min	31.5	27	35	NA	NA	NA	NA	27	NA	NA
       sample35	L_Post-CPB	36	55	62	NA	NA	NA	NA	22	NA	NA
       sample35	M_Post-CPB5min	36.8	56	71	148	75	NA	72	49	NA	NA
       sample35	N_Post-CPB10min	36.8	60	76	138	70	NA	74	23	NA	NA
       sample35	O_Post-CPB15min	36.8	61	80	132	66	NA	71	25	NA	NA
       sample35	P_Post-CPB20min	36.8	59	77	112	59	NA	71	52	NA	NA
       

       ")
#=====================================================================================
#
#  Code chunk 3数据导入
#
#=====================================================================================

Data = read.table(textConnection(Input),header=TRUE)

#=====================================================================================
#
#  Code chunk 4 统计学描述性分析
#
#=====================================================================================

##summary(data_combine,na.rm=TRUE)  ##这个是进行总体描述
###分组进行描述性统计量，按照不同时间点进行分组分析：
#?aggregate() ##此为单返回函数，每次只返回一个简单值；

data_combine2<- Data[,c(-1,-2)]

result1<-aggregate(data_combine2,by=list(Data[,2]),mean,na.rm=TRUE) ###这个是计算前去除缺失值，保留其余值继续运算；
write.csv(result1, file="C:\\Users\\Administrator\\Desktop\\samples\\result-mean.csv")

result2<-aggregate(data_combine2,by=list(Data[,2]),sd,na.rm=TRUE) ###这个是计算前去除缺失值，保留其余值继续运算；
write.csv(result2, file="C:\\Users\\Administrator\\Desktop\\samples\\result-sd.csv")
###data_combine<-na.omit(data_combine) ###这个是删除所有缺失值所在的行，去除数据较大，不建议轻易使用；
##na.rm=TRUE这个参数在多数函数都有；

#=====================================================================================
#
#  Code chunk 5 统计学描述性分析
#
#=====================================================================================
####Temperature
if(!require(nlme)){install.packages("nlme")}
lme_fit = lme(Temperature~Condition2, data=Data,na.action=na.omit,random=~1|Samples)
anova(lme_fit)
require(multcomp)
attach(Data)
Condition2<- as.factor(Condition2)
class(Condition2)
par(mar=c(5,4,8,2))
tuk<-glht(lme_fit,linfct=mcp(Condition2="Tukey"), test = adjusted(type = "bonferroni"))
#summary(tuk)
plot(cld(tuk,level=0.05),col="white",ylim=c(25,40))
detach(Data)

####COD
if(!require(nlme)){install.packages("nlme")}
Data2 <- na.omit(Data[,c(1,2,4)])
lme_fit = lme(COD~Condition2, data=Data2,na.action=na.omit,random=~1|Samples)
anova(lme_fit)
require(multcomp)
attach(Data2)
Condition2<- as.factor(na.omit(Condition2))
class(Condition2)
par(mar=c(5,4,8,2))
tuk<-glht(lme_fit,linfct=mcp(Condition2="Tukey"), test = adjusted(type = "bonferroni"))
#summary(tuk)
plot(cld(tuk,level=0.05),col="white",ylim=c(10,100))
detach(Data2)



####NOX
if(!require(nlme)){install.packages("nlme")}
Data3 <- na.omit(Data[,c(1,2,5)])
lme_fit = lme(NOX~Condition2, data=Data3,na.action=na.omit,random=~1|Samples)
anova(lme_fit)
require(multcomp)
attach(Data3)
Condition2<- as.factor(na.omit(Condition2))
class(Condition2)
par(mar=c(5,4,8,2))
tuk<-glht(lme_fit,linfct=mcp(Condition2="Tukey"))
#summary(tuk)
plot(cld(tuk,level=0.05),col="white",ylim=c(10,100))
detach(Data3)


####BIS
if(!require(nlme)){install.packages("nlme")}
Data3 <- na.omit(Data[,c(1,2,10)])
lme_fit = lme(BIS~Condition2, data=Data3,na.action=na.omit,random=~1|Samples)
anova(lme_fit)
require(multcomp)
attach(Data3)
Condition2<- as.factor(na.omit(Condition2))
class(Condition2)
par(mar=c(5,4,8,2))
tuk<-glht(lme_fit,linfct=mcp(Condition2="Tukey"))
#summary(tuk)
plot(cld(tuk,level=0.05),col="white",ylim=c(10,100))
detach(Data3)





#=====================================================================================
#
#  Code chunk 5 ##进行Pearson correlation analysis
#
#=====================================================================================
		
####pearson correlation analysis
		
		Data = read.table(textConnection(Input),header=TRUE)
		data_new2 <-Data[which(Data$Condition2!="A_Baseline"),]
		
#data_new2<- data_new[which(data_new$Name3!="A_Baseline"),]
#length(data_new2[,2])
#opar=par(mfrow=c(2,2))
		
###1) NOX
		data_2 <- data_new2[,c(3,5)]  ###提取第2和4列
		#data_2 <- data_new2[,c("Temperature","NOX")] ##同上，只是具体指名那一列
		data_2 <- na.omit(data_2)
		
		fit_NOX <- lm(NOX~Temperature, data=data_2)
		summary(fit_NOX)
		plot(data_2$Temperature,data_2$NOX,xlab="Temperature",ylab="qNOX",
		     ylim=c(10,100),col="black",pch = 21, bg = "white")
		abline(fit_NOX,col="black")
		
		#prd1 <- predict(fit_NOX,interval="confidence",level=0.95)
		#lines(data_2$Temperature,prd1[,2],lty=3,col="blue")
		#lines(data_2$Temperature,prd1[,3],lty=3,col="blue")
		
###2)COD
		data_3 <- data_new2[,c(3,4)]  ###提取第2和4列
		#data_3 <- data_new2[,c("Temperature","COD")] ##同上，只是具体指名那一列
		data_3 <- na.omit(data_3)
		
		fit_COD <- lm(COD~Temperature, data=data_3)
		summary(fit_COD)
		plot(data_3$Temperature,data_3$COD,xlab="Temperature",ylab="qCON",
		     ylim=c(10,100),col="black",pch = 21, bg = "white")
		abline(fit_COD,col="black")
		
		#prd2 <- predict(fit_COD,interval="confidence",level=0.95)
		#lines(data_3$Temperature,prd2[,2],lty=3,col="blue")
		#lines(data_3$Temperature,prd2[,3],lty=3,col="blue")
		
###3)BIS
		data_4 <- data_new2[,c(3,10)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","BIS")] ##同上，只是具体指名那一列
		data_4 <- na.omit(data_4)
		
		fit_BIS <- lm(BIS~Temperature, data=data_4)
		summary(fit_BIS)
		plot(data_4$Temperature,data_4$BIS,xlab="Temperature",ylab="BIS",
		     ylim=c(0,100),col="black",pch = 21, bg = "white")
		abline(fit_BIS,col="black")
		
#par(opar)
		
	
		
		
###5)SBP
		data_5 <- data_new2[,c(3,6)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","SBP")] ##同上，只是具体指名那一列
		data_5 <- na.omit(data_5)
		
		fit_SBP <- lm(SBP~Temperature, data=data_5)
		summary(fit_SBP)
		plot(data_5$Temperature,data_5$SBP,xlab="Temperature",ylab="SBP",
		     ylim=c(50,200),col="black",pch = 21, bg = "white")
		abline(fit_SBP,col="black")
		
		
###6)DBP
		data_6 <- data_new2[,c(3,7)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","DBP")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_DBP <- lm(DBP~Temperature, data=data_6)
		summary(fit_DBP)
		plot(data_6$Temperature,data_6$DBP,xlab="Temperature",ylab="DBP",
		     ylim=c(30,110),col="black",pch = 21, bg = "white")
		abline(fit_DBP,col="black")
		
		
		###7)MBP
		data_6 <- data_new2[,c(3,8)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","DBP")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_MBP <- lm(MBP~Temperature, data=data_6)
		summary(fit_MBP)
		plot(data_6$Temperature,data_6$MBP,xlab="Temperature",ylab="MBP",
		     ylim=c(40,130),col="black",pch = 21, bg = "white")
		abline(fit_MBP,col="black")
		
		
		 		
		
		###7)HR
		data_6 <- data_new2[,c(3,9)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","HR")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_HR <- lm(HR~Temperature, data=data_6)
		summary(fit_HR)
		plot(data_6$Temperature,data_6$HR,xlab="Temperature",ylab="HR",
		     ylim=c(25,120),col="black",pch = 21, bg = "white")
		abline(fit_HR,col="black")
		
		
		###8)CO
		data_6 <- data_new2[,c(3,11)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","CO")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_CO <- lm(CO~Temperature, data=data_6)
		summary(fit_CO)
		plot(data_6$Temperature,data_6$CO,xlab="Temperature",ylab="CO",
		     ylim=c(1,40),col="black",pch = 21, bg = "white")
		abline(fit_CO,col="black")
		
		
		
		###9)SVV
		data_6 <- data_new2[,c(3,12)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","SVV")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_SVV <- lm(SVV~Temperature, data=data_6)
		summary(fit_SVV)
		plot(data_6$Temperature,data_6$SVV,xlab="Temperature",ylab="SVV",
		     ylim=c(1,30),col="black",pch = 21, bg = "white")
		abline(fit_SVV,col="black")
		
		
		
		
	
