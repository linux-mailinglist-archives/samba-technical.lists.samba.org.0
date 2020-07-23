Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198922B526
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 19:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PH/6ugAhAQ+YieQ682wiu5WGBJF3oF0bRZLLA1gpwqw=; b=XtztsOa9WC3XjQbbGuOL6SSdcB
	J5hf7ZuXZgGavN8Rlmz+2XrTbAP0S7H93Huhb4k5hHrmmRG33idvSHmxcDZTRhnesBSHXK+vugxm/
	NpXbH7QOVwzvrCjDTjXrWjEl7v2htRYNqrA+0x8Tt1W3NNhNipbBybskiM6QyNBaXkVskIsuV+iMI
	CIJGB5WgUrd9v41NUSjXftlNQICVHdT9+N8M1Zxnikz2fFu8RKvDmrfVpAjUJYm1wKCMxQ2G9417u
	fo3s4wqQS7jQfYq0o+AbWAgAZswcX+6QeFJgmJH0AhBSJZ09eXbejjI+h5+/NVvzFGphNBQGQzIeE
	7FuHs5uA==;
Received: from localhost ([::1]:60240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jyfJq-009U5H-Rf; Thu, 23 Jul 2020 17:47:46 +0000
Received: from mail.pardus.org.tr ([193.140.98.156]:40468) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jyfJk-009U59-89
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 17:47:43 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id 41C731F7932
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 20:47:37 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id D9r_olvtHdqA for <samba-technical@lists.samba.org>;
 Thu, 23 Jul 2020 20:47:36 +0300 (+03)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id B07501F8730
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 20:47:36 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kmlJtTKPbHET for <samba-technical@lists.samba.org>;
 Thu, 23 Jul 2020 20:47:36 +0300 (+03)
Received: from [161.9.194.136] (unknown [161.9.194.136])
 by mail.pardus.org.tr (Postfix) with ESMTPSA id 854A91F7932
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 20:47:36 +0300 (+03)
Subject: Re: Samba 4.12.5 Windows AD 2012R2 integration
To: samba-technical@lists.samba.org
References: <678caa77-97af-6c71-b4cd-258160ae78b0@pardus.org.tr>
Message-ID: <dbf1b31f-1b53-0dfa-9975-a077753280f1@pardus.org.tr>
Date: Thu, 23 Jul 2020 20:47:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <678caa77-97af-6c71-b4cd-258160ae78b0@pardus.org.tr>
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

We are neither owner, nor admin of the Windows AD.

Is lowering level, the only way to overcome this issue ?

Thanks

23.07.2020 16:52 tarihinde Izzet Ayd=C4=B1n yazd=C4=B1:
> Hello everybody,
>
> I'm trying to add my samba server as an additional domain controller=20
> to an existing Windows Server 2012R2 AD server.
>
> However, even if i use samba 4.12.5 version i get following error:
>
> #samba-tool domain join domain.fqdn DC -U "DOMAIN\admin"
>
> INFO 2020-07-23 15:10:25,275 pid:2804=20
> /usr/lib/python3/dist-packages/samba/join.py #107: Finding a writeable=20
> DC for domain 'domain.fqdn'
> INFO 2020-07-23 15:10:25,284 pid:2804=20
> /usr/lib/python3/dist-packages/samba/join.py #109: Found DC=20
> dc1.domain.fqdn
> Password for [DOMAIN\admin]:
> INFO 2020-07-23 15:10:34,754 pid:2804=20
> /usr/lib/python3/dist-packages/samba/join.py #1542: workgroup is DOMAIN
> INFO 2020-07-23 15:10:34,754 pid:2804=20
> /usr/lib/python3/dist-packages/samba/join.py #1545: realm is domain.fqd=
n
> Adding CN=3Dsamba,OU=3DDomain Controllers,DC=3Ddomain,DC=3Dfqdn
> Adding=20
> CN=3Dsamba,CN=3DServers,CN=3Ddomain,CN=3DSites,CN=3DConfiguration,DC=3D=
domain,DC=3Dfqdn
> Adding CN=3DNTDS=20
> Settings,CN=3Dsamba,CN=3DServers,CN=3Ddomain,CN=3DSites,CN=3DConfigurat=
ion,DC=3Ddomain,DC=3Dfqdn
> DsAddEntry failed with status WERR_ACCESS_DENIED info (8567,=20
> 'WERR_DS_INCOMPATIBLE_VERSION')
> Join failed - cleaning up
> Adding CN=3Dsamba,OU=3DDomain Controllers,DC=3Ddomain,DC=3Dfqdn
> Adding=20
> CN=3Dsamba,CN=3DServers,CN=3Ddomain,CN=3DSites,CN=3DConfiguration,DC=3D=
domain,DC=3Dfqdn
> ERROR(runtime): uncaught exception - DsAddEntry failed
> =C2=A0 File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", =
line=20
> 186, in _run
> =C2=A0=C2=A0=C2=A0 return self.run(*args, **kwargs)
> =C2=A0 File "/usr/lib/python3/dist-packages/samba/netcmd/domain.py", li=
ne=20
> 664, in run
> =C2=A0=C2=A0=C2=A0 join_DC(logger=3Dlogger, server=3Dserver, creds=3Dcr=
eds, lp=3Dlp,=20
> domain=3Ddomain,
> =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 1558, =
in=20
> join_DC
> =C2=A0=C2=A0=C2=A0 ctx.do_join()
> =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 1446, =
in=20
> do_join
> =C2=A0=C2=A0=C2=A0 ctx.join_add_objects()
> =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 682, i=
n=20
> join_add_objects
> =C2=A0=C2=A0=C2=A0 ctx.join_add_ntdsdsa()
> =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 607, i=
n=20
> join_add_ntdsdsa
> =C2=A0=C2=A0=C2=A0 ctx.DsAddEntry([rec])
> =C2=A0 File "/usr/lib/python3/dist-packages/samba/join.py", line 548, i=
n=20
> DsAddEntry
> =C2=A0=C2=A0=C2=A0 raise RuntimeError("DsAddEntry failed")
>
> Windows 2012r2 schema version is 69.
>
> Where should i check to resolve this issue ?
>
> Thanks in advance.
>

