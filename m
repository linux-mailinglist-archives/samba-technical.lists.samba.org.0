Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B02778C0
	for <lists+samba-technical@lfdr.de>; Thu, 24 Sep 2020 20:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xbvlZnUHKedbIwth+G62+BBH2+nWduMO/26k574QX+g=; b=gmHUf2HRwbVo43SjhchQNn2BvP
	wnz3l+Z/YGTcxlpLvwfV1g7mtkYfgRCZlrZx6LFQ/cci4i9aozoK8Y93LrQtQt5Wuh5M62QUmhUoT
	vPgKce4HFmwQsdlRr0rESeUvCmfMc3KHswsdhMzQIyX/eDcefoAdTSl9D6tK16znoZK+eIk9TgrJD
	ZC/sLy18Udl+ljcVM4QftI0m47+gcVbe6x/4c0rh0/SkVYCZ20IwRZeip3COWyU1IIpYu323csF0g
	jih8cGMxuF4UmNFh9RPsrWQFReRh0NFxXCxm0v9IjCIfIrmuMIjgaQ4gj7bwIOVo4j0lPRGkYT8Lc
	CRZSNy4w==;
Received: from ip6-localhost ([::1]:19728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kLWOX-0079qn-9H; Thu, 24 Sep 2020 18:55:05 +0000
Received: from mail-bn8nam11on2072.outbound.protection.outlook.com
 ([40.107.236.72]:50912 helo=NAM11-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kLWOP-0079qd-MV
 for samba-technical@lists.samba.org; Thu, 24 Sep 2020 18:55:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXS9pQMfWH2OUzfU3z86JoOndge7TGjfE23LPxBp9RoYL5qEJIX+SEBYUcyQmUl5qks8NpJfmKThvNKpogPtLVQx+dZEOIsB1nUmlPXnKAPqeEE9XOryPszfcExy/gLsOYRGAvWzU5qpwWClVNTSIJBM4H0ch1X8ED+T4PQSUOvQqy2g0yX62hr2Q1qZpBu0k0J94Tp/8Ti5l6htWA20WliiC/Y1rsE7D44lCXTVAMu5TjHaAagbtG9SoYrn6GSR69qtjT0U0DSoKMUdn6YfYk2XnSSJeDYUFbmNMTO+QxPlpuMO/ORPY+NUY555OZY6ol1r6MwUM1jA3Wv3jdriyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbvlZnUHKedbIwth+G62+BBH2+nWduMO/26k574QX+g=;
 b=CYh9baiD3CPfZmO6EUOd1fiInY1gq9UyLeABFmp6TvkyUruN3xpoSde+Q/P7Tgp0wd9CzXpoq24fTNlvUDPxWtWkFpxEnsxkTWpLToRv1hinHS2zI64a2IeYQgfe0gia15GqNwvIe67EKnVQ4H8gw0zMvxJfOBHESCeYXuNEuPaVS3yrzx5kIgA1aZvIjhBKkKjNA7eymzTN86rXSHB/dmYMUvazpowbCqizc3VrJodKp18CrZh6HXyb3Gsq2VsRwnuLIJLPYbMG6ljyKZMOLK+4NhIPuTXuUqSrp9IqxMQZ2ZKUZahQkOIyut+PeG+wDM3M2LGMlA8lvs42aCLEVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nasuni.com; dmarc=pass action=none header.from=nasuni.com;
 dkim=pass header.d=nasuni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nasuni.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbvlZnUHKedbIwth+G62+BBH2+nWduMO/26k574QX+g=;
 b=D8BqtVGcWeAGpCacYvpzV91Dgs2TU/fA/8CIeMbNq7enCkR5fciFM+rFObGHxIw72aU7fk1eZfVSeKzPNUhS+tUQWp7WRTCP1FKguoM2iz5D889Jf/5uHk2HlLEb0z3pW/eUoUQ+91YHmJnDqq3Uoz32I0hQB0KwUzBEG6pG2xaK69nO2Ot8MeQHX5JA/y5MzSuBxgKlYZQBhiBWYsYQe4i8+6Hxz5sZ2uO+Su4o+x1oVG3VndsH0lFVQLpzP4MjHpwbGAMXFNotLEZc7DOqQvensbIMTypwlTto3GiVcE7votsOCHFFgq4jBvt6vRhh2CU0yfNh0GMnudhhLZo5uA==
Received: from BN7PR07MB4402.namprd07.prod.outlook.com (2603:10b6:406:b0::10)
 by BN7PR07MB5268.namprd07.prod.outlook.com (2603:10b6:408:31::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 18:54:39 +0000
Received: from BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::bdbc:1760:659e:4f1d]) by BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::bdbc:1760:659e:4f1d%6]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 18:54:39 +0000
To: Jeremy Allison <jra@samba.org>
Subject: RE: [EXTERNAL] Re: Need tips on debugging assert_no_pending_aio()
 cores
Thread-Topic: [EXTERNAL] Re: Need tips on debugging assert_no_pending_aio()
 cores
Thread-Index: AdaSaJtzgtwusV9cS9a5sMXEkASw0QAI9VgAAAVjMMA=
Date: Thu, 24 Sep 2020 18:54:38 +0000
Message-ID: <BN7PR07MB44024662698A1214F98D4570CF390@BN7PR07MB4402.namprd07.prod.outlook.com>
References: <BN7PR07MB4402C07BF8C5EB753481AD53CF390@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200924160454.GA1395554@jeremy-acer>
In-Reply-To: <20200924160454.GA1395554@jeremy-acer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=nasuni.com;
x-originating-ip: [99.10.94.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ecf1209-0b31-4bc0-3af4-08d860bb4a08
x-ms-traffictypediagnostic: BN7PR07MB5268:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YQWrgEX39IBVC5uqlqDli0AvJTOjI0lwnP1RikkzgGQw3QPijywFJWdZwf1redluT4s2a6Q7q8JHXOyc5OS69n5Xeu9epmNRNpEajXX77+YJe1x0atVKbP2sqphIrD0/7TfRVhKyO9gICijKoMXpoTaihLLXWhHOy1ZtfHWgIEhaFzSdi2QiAyO2LCtnBi+u0opVrtW4bAHG6xLAreoL05hLTiN/LOJjohg/z5JX/tUqN294bjmyRhfDtz0HchN9xxQYwcoIq+Lv/12IQMrv2qYdZIrwEWS51NciXWXhofKeDpBU4aG+wH/uvoK+ggkQ7Hdtbxe/W144Gi6FksQ/JNenZrHje0pESLNCiaGaGXX1p+d4M/biLpZqrTiRlpCoI6T5IW06W/NEHUh1kszayg==
x-ms-exchange-antispam-messagedata: jo/LT4Yxxfc0JfS6WhstxB5sBhnFj8wr0nU2tyVta4hzh4wIqPaw0kU3cyDDF5F5/JAMUumYJofnev5dTx8/wMKegvr9Kel6fhkVWfCeR+CtqfK55hv45zkaBA//trYEpMjiEKIK/J1GC98Fb24O9hABgxDW3OX4c6PUIuFf9aRsGmd8YZKbzba0Q5q8/fBX2KUUZUkgNL3rZlVb6if3nipKrzQ2tr2P3vIUtYS5Du1v2/w7vD25MlrrZbs6bbpKMEgtET1PF51Y5eyH31jgpOYnhdjwwJanjRvOLWebJcIDySzzYW/QiOqdvTX++E+RyU35bZnZFaApWDBsUcACYQ7Yv8H+5w+9wOWFB8KCSKawIInbG/l3SmQptxzETnL/bliA8dRPEDzvMUPXCgi0qgqIadZj28HcQOIrrqAl2NXjogRk9zjFNrvr3z2EgvCS5ShKXSXU5EPuR1iRiTaJTjiTapBmyVrFsgoVoRmlD+qCCjq/fJEP5+9UEbQMdBFAMkXPMeZTm9TqrDnSCduWVBgYbMOBXGjtAKCl+otHWIhlH7OyABCkaKpqWnPBgbObqfJ6iBNtkyu0OZXq/QPnjqn6cXJw8DL74GmQc44kqjKdnjG5sy/sZmKQ4PLEwKTlsd0h2Lblx4icJ0477n2WxA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nasuni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR07MB4402.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecf1209-0b31-4bc0-3af4-08d860bb4a08
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 146173a2-cdda-476f-b6d5-a48c6e6dd0c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQ3M4D+cAlqjHGSpuDnPg5SNvBOd/sa+tYAg2rNIpIYy1WBXtEoum+ZgjLIMgB4OBmLFAwxCG2Hbh3jElZSs0nsCf+NBvvBcAqV+BBw+eRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB5268
X-Warn: EHLO/HELO not verified: Remote host 40.107.236.72
 (mail-bn8nam11on2072.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-BN8-obe.outbound.protection.outlook.com
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
From: Ashok Ramakrishnan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Jeremy for the tip. We are able to reproduce the issue after a few h=
ours of IO. I re-read the comments and the code and have one follow up ques=
tion.

Is it possible for talloc_realloc() in aio_add_req_to_fsp() and aio_del_req=
_from_fsp() to race? Since the array is being mem copied when the size is i=
ncremented 10 at a time...

I am adding some instrumentation to the code to see if we are running into =
this situation here. But, we seem to end up with a case where fsp->num_aio_=
requests =3D 1, while the fsp->aio_requests has been freed (because all the=
 outstanding aio requests have been destroyed).


-----Original Message-----
From: Jeremy Allison <jra@samba.org>
Sent: Thursday, September 24, 2020 12:05 PM
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Cc: samba-technical@lists.samba.org
Subject: [EXTERNAL] Re: Need tips on debugging assert_no_pending_aio() core=
s

On Thu, Sep 24, 2020 at 02:44:53PM +0000, Ashok Ramakrishnan via samba-tech=
nical wrote:
> Hi:
> We use Samba on top of our user space (fuse) file system. We just recentl=
y updated to samba 4.12.6 (still in pre-release testing internally) and we =
are running into these smbd cores after very heavy IO load. On looking at t=
he core, I see that there seems to be a race (or a mismatch) between the nu=
m_aio_requests accounting and the actual requests linked to the fsp structu=
re (fsp->aio_requests)... Since we are on 4.12.6, we already have the fixes=
 for https://bugzilla.samba.org/show_bug.cgi?id=3D14301. My question is, ho=
w do I debug this issue further? Is it just code inspection, adding additio=
nal debug logging? Or is there a better way?
>
> Also, I could use some help understanding this code block in aio_del_req_=
from_fsp()
>         if (i =3D=3D fsp->num_aio_requests) {
>                 DEBUG(1, ("req %p not found in fsp %p\n", req, fsp));
>                 return 0;
>         }
> Why is it OK to not find an aio request attached to the fsp while destruc=
ting it? Is there a valid use case where this is expected to happen? I am n=
ot sure we are running into the above code block, plan to set log level 1 t=
o see if that is the case.. Just noticed this during code inspection and tr=
ying to understand the logic there.

That's the destructor for the lnk struct, created as a talloc child of the =
outstanding tevent_req.

The fsp->aio_requests[index] can be deleted in a SHUTDOWN_CLOSE independent=
ly of the lnk struct, so the lnk struct needs to allow the associated fsp->=
aio_requests[] value to have been freed.

Check the code and comment in:

source3/smbd/close.c:assert_no_pending_aio()

for details.

I wrote much of this logic, so I can
help you track this down if you can reproduce it.
This e-mail message and all attachments transmitted with it may contain pri=
vileged and/or confidential information intended solely for the use of the =
addressee(s). If the reader of this message is not the intended recipient, =
you are hereby notified that any reading, dissemination, distribution, copy=
ing, forwarding or other use of this message or its attachments is strictly=
 prohibited. If you have received this message in error, please notify the =
sender immediately and delete this message, all attachments and all copies =
and backups thereof.

