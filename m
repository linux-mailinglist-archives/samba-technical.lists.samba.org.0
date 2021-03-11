Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4624E337A31
	for <lists+samba-technical@lfdr.de>; Thu, 11 Mar 2021 17:59:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=uPndhhO79lvGHS9loPLLUwdElWAH62FKQbYXK4UEfug=; b=CW+R/rUCD6tafgmgjR/8PuMYdN
	w4S3IgNmrtY2v0DmgBKty50gfIZOJ9+vYSkvclgo+6Ta1s2GFbQzbO9Q8K1UWGOlJ5JTTZTSu6lN+
	TFzzt2G2eYu3WJFUOH7WE5NiY4+pBhr1YbSrLfplmDNkQGMNSdr0Cl11TAivRy/a3NHgAlsBx+epX
	QfDF8jOMd1J0Diguy7XbP/+toLy2OGoADKrkgFh6vLyUZ8qjFsbAHT356+M1RgqaK+bVA4cbZXXVZ
	NQJTqwwiznpQqfzScVdSQcyRr8Vq0yHsGyiwKPMntC43ryLjIVmS5Zo5dvdbm/caTt7hyzsGmo+dE
	QxdD9OuQ==;
Received: from ip6-localhost ([::1]:35688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lKOe6-0051LG-JB; Thu, 11 Mar 2021 16:58:46 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:41497) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lKOe1-0051L9-6g
 for samba-technical@lists.samba.org; Thu, 11 Mar 2021 16:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1615481916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPndhhO79lvGHS9loPLLUwdElWAH62FKQbYXK4UEfug=;
 b=Qc4xxA0CKL1dEHXECrBZd0/W1Lxcnsf3olOrbu8eRkxJ19rB7k0hDHzGlDdQOeX10ouov4
 Hfb/RrUJHF1m26cjdjR9kL8Hg46yi5VW85vZOb13EsjkMXo2n431YdP+idOBj9jflUFSOO
 e9RtTOOnA/5kY+XEJ0djL5JDydBat/E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1615481916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPndhhO79lvGHS9loPLLUwdElWAH62FKQbYXK4UEfug=;
 b=Qc4xxA0CKL1dEHXECrBZd0/W1Lxcnsf3olOrbu8eRkxJ19rB7k0hDHzGlDdQOeX10ouov4
 Hfb/RrUJHF1m26cjdjR9kL8Hg46yi5VW85vZOb13EsjkMXo2n431YdP+idOBj9jflUFSOO
 e9RtTOOnA/5kY+XEJ0djL5JDydBat/E=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-xA-ZJ_HjMqqRI0f7vkO67g-1;
 Thu, 11 Mar 2021 17:58:35 +0100
X-MC-Unique: xA-ZJ_HjMqqRI0f7vkO67g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/zSz3NSIdDmk2pi8aEvof0/a0ygQiQK0E21Hh4nJNYHhzSjQlyCuCrytCWeaBAyhD48IKEKFQb1UsUOLtRJLnGaLGHG4ffmvAtRmuorj83oG9KUa+W0oeiEYq1rs6RJEX2BeHVAIhz6OxCFrUwuXfTe2wHutPJU8Nr73RkReDa5i9WIRjrTKEW6sJyaRi1IlDUN7XcoqPzLLKwPvmNGrT7daKOa+F0MEZIDUZ4N4V01uPAS1GtEuiXcZJ2FjO8+9IKWnsXj/PpXrvebel12VJt6CxSB8GYaZNBIoE6YvqEavCu/kUMYcny2fTIdfev+GBsYES53gMvzFDF71b0KHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPndhhO79lvGHS9loPLLUwdElWAH62FKQbYXK4UEfug=;
 b=l8/dfrcj18YQ7Ynw/a/RVvL0H4Mzjj0HhTyxQvME1ffBvzX/YSccO0mTcNXTpjXcUuR08KTt3/qmaGB9j4noS9WigWsYWbsfHpthj2yFVLdrCj/lcFVO/rFZV+S6KgMiDQE8vrIRWgdLDuhSc+tM/zQP3lcXk0aFCgtb1lboM31iU1QcNcT2tGjj76qcy66udW0eez+ayDb4zYWcnNwSoIpc1uvUyQUrbpHmsBt1xqHOgSyOrwQZOZzXXcRg3ayJBI1C3vdPsQZ2WrZtNrIVU0lSwT0L7TihPebtceFKcMxPh05Yrqniil8P53HddFwkCQQoMGjeAuhNuhPFLpCWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB6927.eurprd04.prod.outlook.com (2603:10a6:803:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 11 Mar
 2021 16:58:33 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%4]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 16:58:32 +0000
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 samba-technical@lists.samba.org
Subject: Re: flock possibly missing in SMB3 POSIX extensions?
In-Reply-To: <87czwdwm9g.fsf@suse.com>
References: <878s7aztu8.fsf@suse.com> <20210226181702.GA94004@jeremy-acer>
 <20210226184037.GB94004@jeremy-acer> <87czwdwm9g.fsf@suse.com>
Date: Thu, 11 Mar 2021 17:58:30 +0100
Message-ID: <87ft11tyo9.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:70b:4a76:c575:78b3:c551:390b]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:70b:4a76:c575:78b3:c551:390b) by
 ZR0P278CA0128.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Thu, 11 Mar 2021 16:58:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53a2acbd-d823-4d7c-631e-08d8e4aee733
X-MS-TrafficTypeDiagnostic: VI1PR04MB6927:
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +tB8xHwOGeMpGqVyD9/KhqHh98iU6f98rboA6kVUGrrYB3cSDcKs9RY7VFJcTdED7wd1hODQLGWq/MuvXhxqPsAUbPbUNb9gPO5s9OQdxi4DpPJBVcXTy+1rWquMv955PCbtrKxRS8jz6q83nMOCWroIzgyvecVqCPUjF6tAIxXULsa6SqdjKjA5nnHzU/kE38B70Afk28s0DRWdcYIyKdVAu5LAQl3ojpQ5SqDEgcA1rwwNlY6otuoPSU5FAPdEMRcdUL7ZrMYFI6/XCos7WIcwefVWp5lY7eMjlJC27tbqPE+GClkRoq/VE/gaeZCCCME+1Ks6eB1/67Yw4zy5Zc/eDAqdSjC9MfFF9SZWviypDSPf+VK8acFi9x7dIyyBHCioeocXOuI2IP5JfDy1wUPk4jLyDhVLMfGHpKDcvPU4eID4qeavS0WB3Nqzs7GZaMsGeMdYAvpa0B7vJjd60VeowkDbEv1s/sCGppj1goV1gChwOWXvLfaKq4gFKpUP8YxNYBmjeF3AmfRo/tgGrEEln7eLMgxznXkXzwAfHhYd43ga0zIkgPXiIHUARJ+b
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZmlvYyt6NzlzclhNTFp4eEd3Rm40K3V2Rk9hR3JQaEtvaWdaM3FDb2tZNUFW?=
 =?utf-8?B?SFdDR2pKeVM0UHlBTnFoRnc1WElMZHRoVHRpcUNzZ1ZuSE1GTDhSSDZkeFJj?=
 =?utf-8?B?Y3h5VmFyei95MCs4NE41bk1uZUlKTkYrazVaVkFlS1RiNVVhTUhZVndlN095?=
 =?utf-8?B?L0ZLSm1DNFBOV2NVRUs0d1V4TlZZZUtxWEExSUpkSEZ4enJHeUVhQXA0MjhQ?=
 =?utf-8?B?U0wzRkcvRDVkWkQ3SG9JTmkzdThGekR3QTBxZmhSNWRraFBKVk9aOGlFWGJT?=
 =?utf-8?B?NldabnNIUlJ4QjNYTUkwaGU2MnhoT0trbHhFU1ptRTZPd0ZjQW01SDREV2ZO?=
 =?utf-8?B?SGVOWXZCUG0yKzh1bnRSeVF4SzNrWWVzamNwYUNUa2FaUWZUSUYzdjIrTXE5?=
 =?utf-8?B?cEtnc013S09NYVZoK1crM1hCdXRkeHhGM3grNDZNeHVHL1ZGclJaNGhVNGdD?=
 =?utf-8?B?eEZVUkN6c2JHQldxSndtNzY4Y0hvaU5Yd01MelU0c2x4S3ZSNEx6VW1zMmJn?=
 =?utf-8?B?UzdTT3FaMUs3bGZwU3VPMndZQnJwWWRKS2FVWnhabHh0YzBpZzJwM0E3K1hJ?=
 =?utf-8?B?Ri9KczM4T1ZjSE9udldYTGIrVWluWXlzR0pFQUoybWJXWXpnMzRNQ251Zlo4?=
 =?utf-8?B?dENUcTFtVmlDWDhTQTcyT1lHZEtySjRlbG1wMGloaWp3WS9kOVV3VVcvRyt4?=
 =?utf-8?B?UFFzTEE2ODFEMk9FcnZwaGZyS2wzdHQ4ajlvTjE2VkNiV3pNbkVsWDRnWWE0?=
 =?utf-8?B?SFhBV3M5VEhOTUpBcTNMTlNCbDl0bkQwaFN2YzNpUERQOU8rRjM1ZlhoZ0xx?=
 =?utf-8?B?TitkeFhtOVAzNDlpSHZIZ213cTJxWEU5RWFrSk1OWDNEb3lxeGtZTklvb1Rz?=
 =?utf-8?B?dmc5UkNETkhNbVhiY0YrQm5idTVRV0JHQitDem1wQXNCRU04Zmx5eUQ0THZO?=
 =?utf-8?B?dmdwaHpiTnh5dzR1NkppeW9tTWluNnVXc2MyeFM1aCtNbkJNRzVUYnZSVk5I?=
 =?utf-8?B?NkZwekN5SG12QzY4bjB5dlV1akgyWGVSUC9BR1pvSHRycGlzekRBK0NrVDQ3?=
 =?utf-8?B?UHA0dFI4NTlxQk5LR29uankxVG40djVZcUp6SEJWRDg1QVFDMCszcTlMS0k5?=
 =?utf-8?B?OGdmSFJhcmE2T0Z2NHYwdEROTkpwQlcvQVY3cFJlb3RVd0crcDRjaklYS2JH?=
 =?utf-8?B?ZG5MZ1IvM3A2bFl4dXd0Sm9PVk1rcmdTbWgxeVZubHlBN3h0M3YzclNhNzJa?=
 =?utf-8?B?R21GSTI3WVZuRVd4M0Y1OEtEQUcwUWxkTWVDMm40VzNLcnUwaXRnM01UMjcy?=
 =?utf-8?B?cU1mVnFRYmtQdHRkbDVuWmZTN1Z2dGdOTVdNalN0VUx6TTFwc0ZQT2Fabzk0?=
 =?utf-8?B?VHpaMnRhK1JUejZGclpRUnV6QWduWHJYL3hPcWt1QzNnMGExODMzOVJ3d0Rq?=
 =?utf-8?B?endFTVlrVG50aVRqckpKbC85QkE4OUFLUVVwSGtZeDR0d2pCbjJJT21XRHBy?=
 =?utf-8?B?ckQvbExHV1J1d3J2Y051ZXBKRlh2c3FtN0lmSlFnUkN4K3Z5elBYVHg3MVkv?=
 =?utf-8?B?STR3QWhKSkFsTUlYZlZTRlVOYTBwaUthVUp3ZDdHR0NhMkpaSy9BWStyVVdr?=
 =?utf-8?B?elZzc2Q3UWdETmhic2xKbkpCcjQ1ejQxVGVIMXcrdk9LWTVnd3lCaHE2cWp5?=
 =?utf-8?B?VEVKWGY1dTRiOFdjWDBRTmRZekUwMkl2VTBDa09XOWJHeGV1SjE3MEhCWEVt?=
 =?utf-8?B?ZEJYRlhPQW1SU1NicXhYdWp5YXlpeFhFaTZ2OXowc2Z4bEVzdXJVa1FkYyti?=
 =?utf-8?B?UHpydjBaQ0FyUFF6L1JmdWJ6QlJ1eE5YZEpEdlBoNjBrbTRjL1Z5RGxxZlZu?=
 =?utf-8?Q?fDIwAIyfR+9Y6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a2acbd-d823-4d7c-631e-08d8e4aee733
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bzdoZcAkFqCu0l3MlG4z3UY9FTGh8g1Pdpf/0WdkILIM4KXHRd+a1oojGGVxFTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6927
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Little update on that topic: I was looking into the cifs.ko SMB1 flock
code and it turns out advisory locks were already in the SMB1 Unix
extensions.

After a quick grep in samba I found smb_set_posix_lock() in
s3/smbd/trans2.c so presumably some of the logic in the server is
already there.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


