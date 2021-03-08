Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA39C330D3D
	for <lists+samba-technical@lfdr.de>; Mon,  8 Mar 2021 13:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cBQoSFK3Iw49+JMmsX3eKbeije319M2h4dI7j5gBgnU=; b=wiu2fOnXgVFp1wB/NDFGq2hTge
	lM5vnfIN3rb9me56jikJPLtFKvulm7tqH/wVwUBF0s35U2Bpckl5CevCKDrVcBeVElAKY/z63GWzp
	8HohQOSudgvIIx61K/tGDMiD+UKKSGbiKwIMNoYNrP6FHj9PnhvttsCevHJ0ljuqJ/+MHUOCbTtlH
	w3TUdSWh4H2NL7CaanZXbHU8AaPm7dXCN35CSMYCsR5tQm1ujwefvD9QD6h9TcQp1Jzlwuj030aoR
	4xS0R3IugXZr3xAt1iB/GDk6FP3RITVDFyKkF3JbPoea3qvxY0Cpw2MagdFnLREd19v3PnpjsgppC
	yiG16RxQ==;
Received: from ip6-localhost ([::1]:38436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJEsh-004UpB-9V; Mon, 08 Mar 2021 12:21:03 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:48068) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lJEsc-004Up4-GM
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 12:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1615206055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBQoSFK3Iw49+JMmsX3eKbeije319M2h4dI7j5gBgnU=;
 b=YwrLzpTZfbyUleVMqPvNF6Tltg6bi3XIzB9EvpCm/hWd4HukHErCjOyWDLmYkqQgXCxcCb
 sVzcTwXFZo82bff4HboKhsFqc3/RQbDjAh+3mxXFIPtmzCeF/jUmtHqel2+JlRh06xzkl7
 PaHVyX56gpETf0FA8N14fO2+DhzAjdE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1615206055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBQoSFK3Iw49+JMmsX3eKbeije319M2h4dI7j5gBgnU=;
 b=YwrLzpTZfbyUleVMqPvNF6Tltg6bi3XIzB9EvpCm/hWd4HukHErCjOyWDLmYkqQgXCxcCb
 sVzcTwXFZo82bff4HboKhsFqc3/RQbDjAh+3mxXFIPtmzCeF/jUmtHqel2+JlRh06xzkl7
 PaHVyX56gpETf0FA8N14fO2+DhzAjdE=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-Gpz_E2PEN2ezD-5D3GdaEA-1; Mon, 08 Mar 2021 13:20:54 +0100
X-MC-Unique: Gpz_E2PEN2ezD-5D3GdaEA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iluz0uaisXdHwvtpF5szt/8nS2y9ik/IbHM4yQTCQwwG0JsT7emcbn4Q2diRRutFUxbb+Ivc/M/eyFrp0y6L6hPiAZYdS7v0v1lEsaFbNEbGXAOGFwGG2nuOn2SK3skpil/60z5LCjf/r/0vR8t8p2DyJNLxbyTYc0H1pYF1Z6ami/oiE6vGw2q7OW6mC+aWfRj+Iq5bEqBcPTWfQ9AUuFa1sAoWzzKOG6svR0VXZ0+RPfE25Ee0TZbpCzuYJosKwNn9S9iz3qHJbrFLFXZeGSfMi6G+Hai7aqwTNM2iHgYIri7ykic75dmeHkQr49Ny/Bf80of1P5w+gAnImxrRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBQoSFK3Iw49+JMmsX3eKbeije319M2h4dI7j5gBgnU=;
 b=ZmnDgwFUaz7kS0cSg8L1rlCOVdFV0JW2S/t2GskzGxlZSRKKiKVdNdM5Z0vaCptbmUovkpTYi7Ad6A9NCRcROsoFC9UikdgJQDVZ7x7fquPR0r13d3Rkh6ZtjjkURdXv5ARNTsqEDekshSWjH6u1AcRDn7rruoFpdykI2JS08N34y1AGwkJeH09e/ROQaGmCGVlXXwPKwLkdeekZEmJhM7IRuag+MHtiX8oGSCAOGEIqz59wdm0A+HjSyWPm1+0CziDyLBtOvfCsuYLnm7WDclaXJk1Qges6EoeyOQIr3TWG9JfEZSOyCH54Nl1oxbiZ+w/ovSxYZ/+65R1KVnXg0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 12:20:52 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%4]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 12:20:52 +0000
To: Shyam Prasad N <nspmangalore@gmail.com>, Vincent Whitchurch
 <vincent.whitchurch@axis.com>
Subject: Re: [PATCH] CIFS: Prevent error log on spurious oplock break
In-Reply-To: <CANT5p=rB2=DvjtpmVy803emWpuzsy-C2+d4wqQ5g_9fJ8+a5Cw@mail.gmail.com>
References: <20210305094107.13743-1-vincent.whitchurch@axis.com>
 <CANT5p=rB2=DvjtpmVy803emWpuzsy-C2+d4wqQ5g_9fJ8+a5Cw@mail.gmail.com>
Date: Mon, 08 Mar 2021 13:20:51 +0100
Message-ID: <871rcpx2e4.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:70b:4a04:48fe:21ee:1b19:31ad]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:70b:4a04:48fe:21ee:1b19:31ad) by
 GV0P278CA0013.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:26::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 12:20:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 104a8006-467e-48eb-3dab-08d8e22c9db3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3359:
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: G/ZbvVVKZ3aU7/zH/ZZomReNfi5dvBn6gJ2O6fXrpxhSYKD2wa2+H5X6iVz3Ilraf6809tOET8JzBvUjdOrOLryoJoLlzI/BblIoFZU9RIBaghr9QIJwLwcqhRZ0G2hjvPGUtqey/mfJ7b1debmj7EGZSLJnPQxOcbMeCpRDgUbL3rv8AhCLJK13FNjXRd6jnaxSgqjOKguARUntFBPN5TYAd9DCp6CYSDnCzhSBWlYPMBJrCzuzfsuN8MXDM3gnOh9gwR2JQHV7zau7Ggg576F92l9tOTbfelvx2zuVx02rqlP4X19dx1d5Jt4qvP9Ia/KmlyR0Qj7rvEr0Cz+GbD8YdHQkED/LqmtbkTWcSYWZ+Zx+xUGrdWUYeOdVn1J9fZSaXb26jJkqkV8LZUMmkngRMq/c7VFZxJql8qFJYzLEHTzJmAXIk1L30NjseCbiKiB5U9y6j0iG5ca37W/vj0pxaL9j3AITPJw4MX5AWBYeeD4GDLDcGUSYgyXbqoGoRrGLW/V9NKx/pF/21E7ehg==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RG9QcTJhTG4xcWJLQ09RNGlZaHYwR1JPUGF6NFpzRVIrYlpVU3hwZWNGSmlZ?=
 =?utf-8?B?RXJaSnJNMjh1cDJpQXNjdmVuRFZ6ZkNhNGJCU3pJQlBmdklQNWNVcGJVVDEx?=
 =?utf-8?B?Ujd4SjluVU1BSlVic05ueFdIZCtOTVduSGFzQ3FRUVhSQ3NWenI5L1RlTy8z?=
 =?utf-8?B?bUVnOXFOVTZhWU91VmVHZmdwRDdVdEcvWjJJYWlOTDJWenh1bWNXUTg3Y1lu?=
 =?utf-8?B?SmEvcGJYR3NWbjhiQXI0M2hUZGRMN0dLUWwyaDlFRTA4c2VqeU9FSUhvL3lN?=
 =?utf-8?B?SFNaUW9UMGJrTjBlZUhlTXV6MTdFV052dnlvNnJJT0tDdnlZbHFjODNSVHZh?=
 =?utf-8?B?eWtVMU9vQy9hOERybFZ0NTg0NW9PWFFGRnhoVkhjSTRNRVViQklEWFF2ZlFX?=
 =?utf-8?B?SkEwSk1GUW9teEg3WWswOWxlUXNrV2hRVHFDTGdDZVNiS2twRFovSURUejl5?=
 =?utf-8?B?N0Znck94WFlvYmkwMWtBVWNJR0V4Uy9uNkc2UnJVWXV2aThLYU02ZWE2MGVr?=
 =?utf-8?B?cjR3c29pN3lrL0dsTEJuZXMyaU1hb3JSSi9KeGFKV3BNY1ZmNkVoWTJWUTBE?=
 =?utf-8?B?ejRYMzNudFJEV3BwOXB1MlRpUjZqc04vK1JmTkFJdE1aeEx2dDVSaTkrOUxC?=
 =?utf-8?B?NDE0aDJEV0plZC8yaDZnOTZCUSs2TTZKU0pzMTFjb1MvTnM2UllGTkM0Tk1I?=
 =?utf-8?B?SnZBUXY4L2F2UjVmMXVxR1dIL0JYTzV2eGNKT1RSRC9OanI0Q08wdVlhM0I2?=
 =?utf-8?B?Vk0zSzJMQS9PYXFCenpSUUcvQjlUWkNjVUxrOTh0SzBuWFErTjFYcE9TWmxO?=
 =?utf-8?B?cHYwME1wUXkxQS9KN0RyK0hoRnJvZ1g2QTVXTFI4K2V5MXEwSnpja2M1SnFN?=
 =?utf-8?B?ZHVTSXRXZFRaUm1pTzZUUG5NYnhtZDJTOUszUFBkOHV2bTdxaXFCMzgzanhx?=
 =?utf-8?B?NzZwU0RPaUFzcS94cjhWSHQrRVVaQUZUa2g5WWpoRHVZUkZybkFoS1RQN2hE?=
 =?utf-8?B?ejg1cmFVRkRxdUp3SVhDUFlJU0ZzU3drNjNzeVpZYXdIV3pWZnc4ZCtBejlX?=
 =?utf-8?B?OEE4RlU3aXRsYkdZQmgyd05Eb1M4TmFSU0h0Nis3Yi8zK05uTEN1MzhsMllr?=
 =?utf-8?B?Y1NYMjROZ3p1dDl4YWZ2bE55VWp0eG5BMnFHaEFiUDA2Z0dPM2JEV0NQMmRi?=
 =?utf-8?B?ZDNuMXV0Qm9OT1RLUmJvNGUrS2VldnhNZVNlaHRDT05IWnpuVHlkSU9rQTZv?=
 =?utf-8?B?Wi85RFlsSzhuMmI4bEpKbm1oZUxHVHFjS0VJcGY2RHlCdnEyNko4MEtISDBS?=
 =?utf-8?B?V0ExYmUrNUVaclhsZnVyRi9LRmszSVc2MTJOVFE1K01rbDRqbVczK0REUnVQ?=
 =?utf-8?B?Mi9WUW5DMTNUNmJJb2NFc041TTVCRzQrdG9Wc2dQSlo2OUU1ZzN0SlVLMDRz?=
 =?utf-8?B?L09TRkFFRDlCcndtYnNWVzNoaWhQc05sWEl1RGJXTVNlcjdZTUUxdGpIeUx5?=
 =?utf-8?B?bk9BYk96VnNGNUtkQ1A5MjJIczd2dVorQThDSTFsbzI5bU80NHg4V1k1eUtM?=
 =?utf-8?B?cCs5ekZlaUNnaFZkazdaZjZ0NFFmTktmQkQvNlMvQmlCUnpFZzBtckl6YlZE?=
 =?utf-8?B?b2hBSGhXZmZEbEdlbjkxV1NPakUveXdYVjQ5SnNPMmJ3UXRXOXJRS0tsdC90?=
 =?utf-8?B?MUVuOFl4OTdxTnA4NTVMYzZmYUZXYVhmeVdQcWRjdUpvQ1pEdTI3anJkeHVy?=
 =?utf-8?B?SGRHbHoxQzVsWmhTQUptZlVBTGpZTFhyS3N2bW1aeUpEdEpRMlN3VHdhZ2Vs?=
 =?utf-8?B?dS9qN2loRWtwcWp5OEZkK0lXMDN5aVdyaTh2UUplNmppakJrNXhiVHhGblVB?=
 =?utf-8?Q?NxLwVE4+ym9y6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104a8006-467e-48eb-3dab-08d8e22c9db3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnM1FWHoZOr8NSBExFNR+O/u4vtEJ1eLA60VHtrwonFlWn9cr+fDTn72ullOfhTi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3359
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 kernel@axis.com, Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shyam Prasad N <nspmangalore@gmail.com> writes:
> So I don't think we should be changing the logic here.

I would tend to agree.

> If SMB v1 had a different behaviour, we should check if that is as per
> the protocol documentation. If not, change it.

I think the main difference is that SMBv1 doesn't have the concept of
lease keys. I think lease keys were added to handle cases like this:

case a)

client: >> send create+lease (key=3DXYZ). I don't know the file fid yet

server: local open & concurent open (create response not sent yet!)

server: << send oplockbreak key=3DXYZ
client: dont know the fid, but i can match the lease key with a request
        I made, so it's valid

server: << send create response (fid=3D123)
client: I know the fid now

case b)

client: >> send create+lease (key=3DXYZ)
server: << open file, send create response (fid=3D123)

client: >> close file, release file ressources, send close fid=3D123
server: before receiving close, concurrent open happens
server: << send oplock break (key=3DXYZ)
server: << send close
client: depending on the order the response are processed, I might not
        process oplock because i don't know this file! I already closed
        it. But I know this lease key

Without client-generated lease keys you cannot match things you don't
have an FID for (because you haven't received it yet, or because it was
closed). And FIDs can be reused and point to different files.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


