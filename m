Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBF822B112
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 16:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=xwjSkCetvW2mMnsk4D/uqCG7Co/boE8ySiDyDw6eM2U=; b=u/fntGGtOX9sUEOxq0BVSpC8iR
	zVpFxx9dQLN/PS3fMcT7yHZCKGBt6zHxMgrUSrGdT10rskmkOdgbdX5v6+++/aTTxwWZNF0K0wp8W
	0K915cCfZaaprf0PB8/OeS4SZv5LeWupm+BPYu0M6U+HibGil3BxoXsZSw4oc/YcLDRtYJVdaWbxP
	igVb44csgrKi7X4mXltbXxRqD4DJ06I8a2576l0Z+NCUcWGAfJA6n8lNDX4bEEgd8A1AlgW+ESFso
	KhLk6fa7Ts0id7SJmZ+AaoSmWmedMdbdAUq8ne6pQMA+dDSe7Cq9xGxkXhN55kIaravuHgZrZCT+w
	R+XmOOWg==;
Received: from localhost ([::1]:25206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jybx8-009PDO-Gq; Thu, 23 Jul 2020 14:12:06 +0000
Received: from mail.pardus.org.tr ([193.140.98.156]:32872) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jybx1-009PDH-Qp
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 14:12:03 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id B44031F7932
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 16:52:49 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Hf5dP4jmpScC for <samba-technical@lists.samba.org>;
 Thu, 23 Jul 2020 16:52:49 +0300 (+03)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id 300601F8730
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 16:52:49 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sm461fdkxWNu for <samba-technical@lists.samba.org>;
 Thu, 23 Jul 2020 16:52:49 +0300 (+03)
Received: from [161.9.194.136] (unknown [161.9.194.136])
 by mail.pardus.org.tr (Postfix) with ESMTPSA id 03D2A1F7932
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 16:52:48 +0300 (+03)
To: samba-technical@lists.samba.org
Subject: Samba 4.12.5 Windows AD 2012R2 integration
Message-ID: <678caa77-97af-6c71-b4cd-258160ae78b0@pardus.org.tr>
Date: Thu, 23 Jul 2020 16:52:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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
From: =?utf-8?q?Izzet_Ayd=C4=B1n_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Izzet_Ayd=c4=b1n?= <izzet.aydin@pardus.org.tr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everybody,

I'm trying to add my samba server as an additional domain controller to=20
an existing Windows Server 2012R2 AD server.

However, even if i use samba 4.12.5 version i get following error:

#samba-tool domain join domain.fqdn DC -U "DOMAIN\admin"

INFO 2020-07-23 15:10:25,275 pid:2804=20
/usr/lib/python3/dist-packages/samba/join.py #107: Finding a writeable=20
DC for domain 'domain.fqdn'
INFO 2020-07-23 15:10:25,284 pid:2804=20
/usr/lib/python3/dist-packages/samba/join.py #109: Found DC dc1.domain.fq=
dn
Password for [DOMAIN\admin]:
INFO 2020-07-23 15:10:34,754 pid:2804=20
/usr/lib/python3/dist-packages/samba/join.py #1542: workgroup is DOMAIN
INFO 2020-07-23 15:10:34,754 pid:2804=20
/usr/lib/python3/dist-packages/samba/join.py #1545: realm is domain.fqdn
Adding CN=3Dsamba,OU=3DDomain Controllers,DC=3Ddomain,DC=3Dfqdn
Adding=20
CN=3Dsamba,CN=3DServers,CN=3Ddomain,CN=3DSites,CN=3DConfiguration,DC=3Ddo=
main,DC=3Dfqdn
Adding CN=3DNTDS=20
Settings,CN=3Dsamba,CN=3DServers,CN=3Ddomain,CN=3DSites,CN=3DConfiguratio=
n,DC=3Ddomain,DC=3Dfqdn
DsAddEntry failed with status WERR_ACCESS_DENIED info (8567,=20
'WERR_DS_INCOMPATIBLE_VERSION')
Join failed - cleaning up
Adding CN=3Dsamba,OU=3DDomain Controllers,DC=3Ddomain,DC=3Dfqdn
Adding=20
CN=3Dsamba,CN=3DServers,CN=3Ddomain,CN=3DSites,CN=3DConfiguration,DC=3Ddo=
main,DC=3Dfqdn
ERROR(runtime): uncaught exception - DsAddEntry failed
 =C2=A0 File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", l=
ine=20
186, in _run
 =C2=A0=C2=A0=C2=A0 return self.run(*args, **kwargs)
 =C2=A0 File "/usr/lib/python3/dist-packages/samba/netcmd/domain.py", lin=
e=20
664, in run
 =C2=A0=C2=A0=C2=A0 join_DC(logger=3Dlogger, server=3Dserver, creds=3Dcre=
ds, lp=3Dlp,=20
domain=3Ddomain,
 =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 1558, i=
n=20
join_DC
 =C2=A0=C2=A0=C2=A0 ctx.do_join()
 =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 1446, i=
n=20
do_join
 =C2=A0=C2=A0=C2=A0 ctx.join_add_objects()
 =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 682, in=
=20
join_add_objects
 =C2=A0=C2=A0=C2=A0 ctx.join_add_ntdsdsa()
 =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 607, in=
=20
join_add_ntdsdsa
 =C2=A0=C2=A0=C2=A0 ctx.DsAddEntry([rec])
 =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 548, in=
=20
DsAddEntry
 =C2=A0=C2=A0=C2=A0 raise RuntimeError("DsAddEntry failed")

Windows 2012r2 schema version is 69.

Where should i check to resolve this issue ?

Thanks in advance.


