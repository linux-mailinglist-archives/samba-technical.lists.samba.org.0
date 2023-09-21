Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 171897A9391
	for <lists+samba-technical@lfdr.de>; Thu, 21 Sep 2023 12:22:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uxXpT8Z5eKo7sQ5ikW9YIyza1Tln36PZf5EHCRm9INg=; b=OV2SuCpXbAJrHE5WNsrEuTKJxt
	PD1KdYdz4zfNRTmrRdTaheXQMq78KrKRyIlkjwFwEng3gie+ukpj/MvlwkOoP6lavPHYSVhKmGiCr
	PJOg3MNbEM8sgZ6TvBj9ZhsYogWFs5t2a4OzXmVL1c7z8RFFC9yMpWCZPTD70xayp9T604+SeXvcK
	t0QxTzckYst5bXn83YpDRP22xEUPjeEpeVZ8W5UVYUSxADM4DowCINo5gx+elJNsxxm+e8FceMOWo
	VnrBa6PZEmAWYoCw1EPpYGbbulCpQzroyyHoZTIzNXY6llUPOJxXnP0zs4dslrwvR7tOupaBK0Uxy
	xSRmawxQ==;
Received: from ip6-localhost ([::1]:46608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qjGpC-005aNl-Tw; Thu, 21 Sep 2023 10:22:22 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33152) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qjGp5-005aNc-K2
 for samba-technical@lists.samba.org; Thu, 21 Sep 2023 10:22:19 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38KKJei7007933; Thu, 21 Sep 2023 08:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=uxXpT8Z5eKo7sQ5ikW9YIyza1Tln36PZf5EHCRm9INg=;
 b=G62Gl8AU/mveAY14VPHhC9eVGXroi4NAu1kmbnGqqV/ciPO6puO7gDIr+t3zO17guxff
 671F85KlfKGotVIqIBHwiKpvB4dkJonZBX3rZDmmGboKfAWh0ko667xHN9GJx4EIvfWH
 VUUZQ46z1NuIcz3ikH9+Ocdj4U1kHk5sJJcBE7v/TElKqAegr2gRIXoJvQteqbmh6Q/Y
 gc2Gc4tXNQ2JA2gFTXsq0oAzt51oUdo86+7zHUduArfWDXgoAfAPyHkwJYXMEoTJo6cp
 9XTBNYpD8iH8UqAlx1kBPk7gHchNSFw90gWF0CiPKbNhrHaCqw5j/goF/WZo6M7/Rg5z 7Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t539csc36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 08:58:19 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 38L8H05E002208; Thu, 21 Sep 2023 08:58:19 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3t52t80mpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 08:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYBWGSIbaXrcCgunU23iMQru6yX83SpmenH2U9D8nz6Nx2Fm42Np3hOQZJ/uIawqKBwdQKpOQbTW1Wak6DEJewZ4MtmOr0AHpluQb7Tn0XVnD8izbOVV3nN8uLgOFmo1vdiauL1trUIsRaLdEZaLLvDN98M/FaN+srpRYe5ycLYpxX2Np0kJcXgEavtf2xI3tD6tbOTH1tay3Sav+PfX5xa1I2m9xxeSXSg5MU8j3QYKcUPb5RswXpyY23xqV4PYvxM2+h+UkP5JnJLZKNRk5HiVyl30UbCHS2wgzUj7qGknovsPV4McXae4+bktjDaa6+7zIkD+zxDfANzsghgqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxXpT8Z5eKo7sQ5ikW9YIyza1Tln36PZf5EHCRm9INg=;
 b=bs/mV7xZARFtJ71xXLA2yklM9jJXIRSYpE0JtwDpajuaO21KvgV2RQ5clfZ+uU9Yd/zvCE/HgQHt3aYGqmBFce+tLRsfXFqC+cXw2vGPHKKbMPwwR95MpslZDiF+rRTgw4dy2jHACdH3c8B2HsTxTDzAAhiHinAmOnL8DuWkDvacNTORCQKDDpsVWm5+thmc53OmP+/5eNsu9P235JAy0apBq6313bdWgoDJfKenkh8NgoWD4AR1W1whcZ7EYSKCwiQWXZuDlzzfSUaArfjXbgs/696Rh7TyXvCcmJ7RF+hNtO17pYv84EJUNbX+MIWyI9xDkoz29ZDMs73o8200XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxXpT8Z5eKo7sQ5ikW9YIyza1Tln36PZf5EHCRm9INg=;
 b=Oqopz5tpALdhVxZ1uZuVoPBwXOfHpt8+GFCx+THg4xvPoOiTxnLlUL6woXBMHDgH3xqOwgN1IaC6+3Wfkw+mnLVg0n/ftp+0+/2wY6zOUBAWp81EHb/UfZqIWOCj6ou86KejwZOwiZhs/Jq/WNG+VglivtsI8ihvWBldpqrBV6w=
Received: from BY5PR10MB3842.namprd10.prod.outlook.com (2603:10b6:a03:1f9::15)
 by MN6PR10MB7517.namprd10.prod.outlook.com (2603:10b6:208:47d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 08:58:00 +0000
Received: from BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::da7:3e01:f986:129d]) by BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::da7:3e01:f986:129d%7]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 08:57:59 +0000
Message-ID: <582f39dd-6963-70ad-98c8-d4b2ab8e0812@oracle.com>
Date: Thu, 21 Sep 2023 10:57:51 +0200
User-Agent: Mozilla/5.0 (X11; SunOS i86pc; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [External] : Re: How modern Samba handle krb5?
Content-Language: en-US
To: Alexander Bokovoy <ab@samba.org>
References: <85be042b-f13e-2280-e0aa-5d074fd3e4c6@oracle.com>
 <ZQwEgdmLKEadm6f5@toolbox>
In-Reply-To: <ZQwEgdmLKEadm6f5@toolbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3842:EE_|MN6PR10MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ffdda5-5855-4fba-9e42-08dbba80da97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: fozUM44AlxxY1vH0zpgdvOpGWD6blcdWLNBTdGOXaqfDUbwAEmncnIQLoqRdB4peHJYy1blNicpd+YBC+4aBIzdBwvnQ++BylzJlSbqyi9/oCg4plL+lZSsa6qBbTjULKEii3clh/wzs2lbJW7kjYGVszBZ0ITyqFJsMBMlTQ8Y4x+9MlW0TF5jugOjPNridV9w9+WKUnV3Wiv39YC++3HTCXrmX3Gw8nseuf6t6IDg03j7oOuPiZl05K72wkYfl2/T87v7fFroe2lVRmOQx4UsaVoqkoRGvegnjshvnX6BUi3x77qciyxjYkeljJ7i7OQitvidLJfUAUZzqqf5/OVAXiSdyAKFLu3HXc39Qxz2eKPSHftAySMO+90u1F54zVFWdcOdrhbtZUjGqvx/uzZ5sVSKwfpvYMrNuKsZTRMJaxXsJhXOl08d6oQ8THV4tKt3BppeBQowMMb/n3tmD69jLOwvnFh40d/kJiyKG8iDrgRoIahvp6taf7n96y0YjCmORFtOoBTn+cflFWef7JoaqjblXz48TN/py6SuaroUlviqf27khdItg2CQFqz3E65Lg1PUe+JETVGn3l4WSpi+INjQyIUIb3StvhIIntDXCLbWwwO0Kql2ZC6MdpLoq6j+X9bM58TOQIK6yrnaxxA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0JQeFVxclFrVGsrQmtESEEvOXpwQ1MydmhJdEwzVEplQklGbTRFVThmWDAy?=
 =?utf-8?B?SzBBVDFvK09jK3RrTUVOaTl6cERaVkFDdEZPd1VOOGdpL0doT2JEbUw1N3BQ?=
 =?utf-8?B?SjJYc2NNaWRnTHZKT1RuME5JQTVQZEJsUStSbVZtRGw5dzhGNkorNVhqenJu?=
 =?utf-8?B?bGZmYWQ1K2pvNkRTUUVOMFZ3Ymd3elNWMEFsRTlUb0dWV2tHa2dVa01za3V4?=
 =?utf-8?B?Z0ZlV0p3amtmV3V0L2loNE5BVXQyRm1MenVXSEp2VDFHdFNnMEIxNGF2enMx?=
 =?utf-8?B?WVpyS1ViN2RGS2xNL0xzRU11dWdSZHZ5VERHeXB4cFVaSE1Oa2lUb0QwN2Na?=
 =?utf-8?B?Q0FaM1k4MlZOVTUvWUsxN2pXSGJxRGdCRENhVHdMZ2FUekJ0YXd5dGtJVXZi?=
 =?utf-8?B?QmxoaHd0VGdKOHhmVklVeVBadUdGb0RGTTVoM0FxRXVLcVNaVU11bXdqSmha?=
 =?utf-8?B?OWV2ZVhnNFlQeDdtSVdhN3FpZDdXZGZOUFRGSjJraGZFY0U1UlkwUHlSaVM1?=
 =?utf-8?B?cjE4NXBhVk9xbnNnYTlmaXJObmxkZHp2YVRhRUo2Smh1V3FqU25tQjBCWldH?=
 =?utf-8?B?Q3VhN24zNHF2T2gwNStHRlZCRkIzZHJjWU1JZ1hjdU5SdDZPcVlDekt1dGpH?=
 =?utf-8?B?VWROS1ZGMkpJaEttd04yNFJ2ckNsQi9zdGczTlVrRkpZMFgyTklEWm1Jalk1?=
 =?utf-8?B?TkMvRmZBMWxoRUFBUkllNXVoOVo2b21obHhnRnB0bEhsK0ZjUUpya01FeXhV?=
 =?utf-8?B?RnpaMHNiUWR2UitlTGxnNGxMQjg4SHhZOHZnTmdEY3hvamhZdWlYZERFUGtj?=
 =?utf-8?B?Q2RZTWgxY3p5N0FFWW5qZ2pVR09qY285TEo3VkdNTS95NXRtK2VwWCtMTlpr?=
 =?utf-8?B?LytCb25LNW1KVzRkY1grMmw4MlpTdDdqRzNuU0pTUm0zTVdlUElsSzFyRk80?=
 =?utf-8?B?MzN2ZjgybFVCcVp3OUtWSWU0c085Y1ZaK1hOa1dQNXdHRVgzMkNSZnJabVhU?=
 =?utf-8?B?VU1mZmk1ZVZOWUtHQWV3ZkJYNmdwa094VkZLa2dMQ09WWllBTnRCWW5zWHJX?=
 =?utf-8?B?TThCc21CTnRxdCthMTRKZnlES3Fkd3k1OVdaMndnUi81MWh1cUVZWW9PWEJT?=
 =?utf-8?B?b3Z2elMxQ0kyMFJYSWtNUTFXTDlUVHcvWTRFNTJKYnMxNWZjb245aTcrbnpk?=
 =?utf-8?B?NjdpVzlpVDh2YUUrS0NUVEVMOXpjMXhHZVRkYUhxNGgzSkljY0JYMGtic3hR?=
 =?utf-8?B?bU44UjNJdkJwaHVHSDdla2xtUlFwY0JtRm50anNLaCtGRSsvVi96bURIT1py?=
 =?utf-8?B?QU4zRG9rM21uUjNIWTBwVm5KL1NPZHFHV3prTkF6TU5UZGFOc3A4SzRrYWhB?=
 =?utf-8?B?d293SWJDN2hHNkhqd2E2Qzl2SlNaZ0RoQisyWStOeHNXNk5VMGpacHczOWhH?=
 =?utf-8?B?azlDZ3JmZXR3MmVvMHdNaTVlRWZoU2g2aEVkN3l0VEZLTUg1Vy9PczM3Sndk?=
 =?utf-8?B?Mi9tSGU0OVlvVXZsNndlYjg3eG94TlBXOVdlQjI5NXhjZ2p5K2dGQ0doQzlR?=
 =?utf-8?B?Qlp0OUdKSUM0ZXpjVElidVNDTklpRjBiY2J1cExQNTRtcklkMUxIaUxBOWdC?=
 =?utf-8?B?WTEwN21OcGFqVEFIS3hoaE03UVYzRDNVYmFYdmdhZU9oREZ3RTVyUVdtNVp4?=
 =?utf-8?B?SVZvOWUyc2M2V1ROdTRyRElPaURvNUVCNEMyRWtNOVlWMldiOWpSajQ2K1hQ?=
 =?utf-8?B?Ny9xdDBFcnZKbUJ5SFdTTVpsY015dDBFbDRtcmhhZDkvcDhhSXRUNzNSQ3Rm?=
 =?utf-8?B?SU5vRnlBZVMzSWEvUkkrRi9FSGN4UDE3RENXN3VwL1RoK3g1OHZPWFdSV2t5?=
 =?utf-8?B?T0xlL0pBZHVqU3pCbXg4dm1WbmFBS3Q0Tnd2SDg1L1dDc1FpOW8yMlFJaWdv?=
 =?utf-8?B?OEUvb24xbmR2VHE4MS95a3QweUpWSGVnS0RoK3R5UXl2V2VNYnZseHNVZDdN?=
 =?utf-8?B?OFR4OVZWL0tpME52MWQxSkZ3N3k0Rk1MSnM4cDlLMnoxRmRxOVFNRUpSa3Ez?=
 =?utf-8?B?YUF5dWxFay94VCtuOG9lZk85S1AwV1VZY3AySndjTlc5RU5zaDhKTVkvSzli?=
 =?utf-8?B?UWw2cmRmcmVETUZLZktCSytsMnROTU9yVGRTb0pibVk2d3owT3hTMkxQdFZp?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Rp3i3YYOLhAcUoLD0V0F3wxsXqTy0ZkAMcIvNbLClpjjSh1+fjPB0ttsC6wG+V/+J3EmPXrcb0d9+r51tcD7/k6u1xuUyy+U4iLkQNOd8XsbWE4OsvNjBXxaX+jEC9dAZrUEKLd8VmIYWAA4iMsvWnSPCeWEznL1FqBxHjy0zDdZ7Exy+RgL0EPpS8acxhdt+7W67mZIlSCGHBElOCwxc/WVi0ykJAok+gNtNoMdL5bdEXikv7m9CTAtmBeLShQBCfRM/5FX25NHp2NeAqf2GQQbp07sEnDgLfaFWCw4A2jVPo/kl3vrNSBMfpG0/1H601t1qsV0f7WSX1qgPeB4JE0Zywf2HvyzwSNBm9DNFV8vVnIoITV4fbMe71eED20hltRz9eKPKqw6YD/LkuVV1fhU60fzKFGwFN72SpkGzKIuUXHm4D+M5K/+GmP7ao7wGIpbwhxUfhOTKpR+AgbNQKgxt+Zt4unE+5SXynICQ1DwKw96hZv87AEA9uNsKMhn9DtS8OBCd5WiDISlvfav4ZVvs+UUOhsWj8dkRZrFrCF3WBzzMtFnYgrX8jwOII3EJuxhTAKmd4bHV0v0hDNPJyOR2taqZ25t1Aoh7b+IFeecuQrCTAHW9Hu6/kSMLaOrFFxIPXFwaEqsj1GPzoy4kSc23WdVufN/vYMFpmNWykCA4ER9BT86trzxs8o5qHJIXEWTary+3N2vaUs6naD9xPiqOxrQDRvIbgIGae6MbaD68P5A/Wfd259BOG/odUI8ETIUiGaFjFXrYIsW9cNZAlgnuP1DxPO0E9SR8w/mTIc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ffdda5-5855-4fba-9e42-08dbba80da97
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3842.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFxt0kld7AB1QRvRWK8krOi/o5QdgYErHXsdzSaqkF4zIQVqZfhwSJtIbIzHGrEk6LvCXxlvmU7tpsFzLTnIFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7517
X-Proofpoint-ORIG-GUID: HkvoPddWW80Scrt7XgClQU-8Ge4v8RlY
X-Proofpoint-GUID: HkvoPddWW80Scrt7XgClQU-8Ge4v8RlY
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: =?utf-8?q?Ji=C5=99=C3=AD_=C5=A0a=C5=A1ek_-_Solaris_Prague_via_samba-techn?=
 =?utf-8?q?ical?= <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?B?SmnFmcOtIMWgYcWhZWsgLSBTb2xhcmlzIFByYWd1ZQ==?=
 <jiri.sasek@oracle.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Many thanks for railing me back, Jiri

On 9/21/23 10:53, Alexander Bokovoy wrote:
> On Чцв, 21 вер 2023, Jiří Šašek - Solaris Prague via samba-technical wrote:
>> Hi Experts,
>> While sniffing packets I have found "net ads join" and "winbindd" handles
>> krb5 by such strange way:
>>
>> No.	Time	Source	Destination	Protocol	Info
>> 47	38.477244	10.163.87.117	10.163.87.58	KRB5	AS-REQ
>> 48	38.478496	10.163.87.58	10.163.87.117	KRB5	KRB Error:
>> KRB5KDC_ERR_PREAUTH_REQUIRED
>> 49	38.479156	10.163.87.117	10.163.87.58	DNS	Standard query 0x439f URI
>> _kerberos.SMBSETUP.CZECH.SUN.COM
>> 50	38.479597	10.163.87.58	10.163.87.117	DNS	Standard query response 0x439f
>> No such name URI _kerberos.SMBSETUP.CZECH.SUN.COM SOA
>> win-lqmsb4eue0v.smbsetup.czech.sun.com
>> 51	38.479833	10.163.87.117	10.163.87.58	DNS	Standard query 0x0e56 SRV
>> _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM
>> 52	38.480165	10.163.87.58	10.163.87.117	DNS	Standard query response 0x0e56
>> No such name SRV _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM SOA
>> win-lqmsb4eue0v.smbsetup.czech.sun.com
>> 53	38.480366	10.163.87.117	10.163.87.58	DNS	Standard query 0x50be SRV
>> _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM
>> 54	38.480658	10.163.87.58	10.163.87.117	DNS	Standard query response 0x50be
>> No such name SRV _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM SOA
>> win-lqmsb4eue0v.smbsetup.czech.sun.com
>>
>> ...where Add-DnsServerResourceRecord do not support URI RR-type and also the
>> _kerberos-master is not commonly supported in DC. Can Samba still work with
>> Windows/based DC?
>>
>> Older Samba releases were able to respond on err: preauth.required by
>> preauthentication so I am curious why the modern Samba will fall into such
>> madness in such case. Is there an option to rail even the modern Samba back?
>>
>> Note: on Solaris I am pushed to use MIT krb5 API where my attempts to build
>> Samba with Heimdal to check if it will not work breaks on conflicts with
>> system headers.
> 
> URI-based discovery is part of MIT Kerberos handling of realm and KDC
> discovery. Added in MIT Kerberos 1.15 or so, in 2016, to implement what
> was later transformed into https://urldefense.com/v3/__https://datatracker.ietf.org/doc/html/draft-ietf-kitten-krb-service-discovery__;!!ACWV5N9M2RV99hQ!JvbS6_IjJ09-nGc1XUuY4c0iwfiGYV79OB_gjoMan2IRb2ov-cFNsdc0nJvXtsxPko2rWYKUhQ$
> 
> It has nothing to do with Samba and in general Active
> Directory implementations do not support URI-based discovery, though
> they probably should, for MS-KKDCP implementations be better
> discoverable.
> 
> We use it actively in FreeIPA.
> 
> 

