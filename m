Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DD422B176
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 16:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=jlM+ymBYt9iTQa2sSHg68Z9d7KvN+w0+GKpOl2G3b00=; b=zbwvUaRKuvriS1V/FO8SGC+nAk
	Qdnsu8sGj9guIj7rY5/q/dHfAm3XF20LWR++FRPOBR8/woZdFtZemlBnu2k/nUUuprLwWQYl5EQcs
	oJ1hEY0Vfs433ZLLcZO+wyOoZHr9cdkVYch3liLEeIidJjdiBF71uDHWSvQrJybI+zASyPMmpwyH+
	iYxyRIiIbw6tyhh/AQCal2gIx16BW4C3VwIXiKSftblkmgqChtM9eLr9mFkYDtHef6T5vRj2+tzI4
	QESK9QLmNhrB8au0++FJ0IzGHNY7Aji0CLDCT0gBs8nSrHtweO2TTKQPq+0y2sxmWcdqoKk9SvZ5f
	mPzlc4JQ==;
Received: from localhost ([::1]:25968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jycJo-009PLo-Om; Thu, 23 Jul 2020 14:35:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16556) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jycJi-009PLh-3d
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 14:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=jlM+ymBYt9iTQa2sSHg68Z9d7KvN+w0+GKpOl2G3b00=; b=MG+7efl06M9ehuEE97MAta1yaO
 SYl91jvpIBwC8mjRCbsxTdpn3ZJhSGK3d/1DQYTzsmEN3zRP8YHldf2cVSoT5X6yplEe5Stz1zaXv
 mlcIfFG1ssUKI74Kh246pCRLHWw+YBNnrGBOtNgQsn7ih7ZFe2RsQ10Q9HyKbWbDIkoy1a1nvks34
 ZY9SVDDGdoz8pbvB8zDqmBC+j9PggzGjiqOxUWiiB92/pOnUIz0oLN7MU5UIUtRNFRBd7wcTeaydh
 vbTzq7EQYvrD6SChhH/1c41YTE3o4cTTuM+k53K09uxa/CW5L49ISN61Xxv9lep+f7vRKwb1Q4t+a
 BuN0x6Cwh7zh7voJx0qVAzEj5Cmf9WcttZLe97W6+517ag7Zos8eXkwZZcjhmVitnWddLWK/sEmv+
 4Ak4qgZOQ5RYExpWEwn85Z2izthCD2aoC3nu16ZxTNEowmYgzALLaFSBvKwTOQgDhIH2pyA3dIkgf
 qLsQFy574e55IZnwnbhfS+YQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jycJf-0005f0-IQ
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 14:35:24 +0000
Subject: Re: Samba 4.12.5 Windows AD 2012R2 integration
To: samba-technical@lists.samba.org
References: <678caa77-97af-6c71-b4cd-258160ae78b0@pardus.org.tr>
Message-ID: <ddd796c2-3bee-67d3-e698-47d43d5b8d51@samba.org>
Date: Thu, 23 Jul 2020 15:35:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <678caa77-97af-6c71-b4cd-258160ae78b0@pardus.org.tr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 23/07/2020 14:52, Izzet Aydın via samba-technical wrote:
> Hello everybody,
>
> I'm trying to add my samba server as an additional domain controller 
> to an existing Windows Server 2012R2 AD server.
>
> However, even if i use samba 4.12.5 version i get following error:
>
> #samba-tool domain join domain.fqdn DC -U "DOMAIN\admin"
>
> INFO 2020-07-23 15:10:25,275 pid:2804 
> /usr/lib/python3/dist-packages/samba/join.py #107: Finding a writeable 
> DC for domain 'domain.fqdn'
> INFO 2020-07-23 15:10:25,284 pid:2804 
> /usr/lib/python3/dist-packages/samba/join.py #109: Found DC 
> dc1.domain.fqdn
> Password for [DOMAIN\admin]:
> INFO 2020-07-23 15:10:34,754 pid:2804 
> /usr/lib/python3/dist-packages/samba/join.py #1542: workgroup is DOMAIN
> INFO 2020-07-23 15:10:34,754 pid:2804 
> /usr/lib/python3/dist-packages/samba/join.py #1545: realm is domain.fqdn
> Adding CN=samba,OU=Domain Controllers,DC=domain,DC=fqdn
> Adding 
> CN=samba,CN=Servers,CN=domain,CN=Sites,CN=Configuration,DC=domain,DC=fqdn
> Adding CN=NTDS 
> Settings,CN=samba,CN=Servers,CN=domain,CN=Sites,CN=Configuration,DC=domain,DC=fqdn
> DsAddEntry failed with status WERR_ACCESS_DENIED info (8567, 
> 'WERR_DS_INCOMPATIBLE_VERSION')
> Join failed - cleaning up
> Adding CN=samba,OU=Domain Controllers,DC=domain,DC=fqdn
> Adding 
> CN=samba,CN=Servers,CN=domain,CN=Sites,CN=Configuration,DC=domain,DC=fqdn
> ERROR(runtime): uncaught exception - DsAddEntry failed
>   File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line 
> 186, in _run
>     return self.run(*args, **kwargs)
>   File "/usr/lib/python3/dist-packages/samba/netcmd/domain.py", line 
> 664, in run
>     join_DC(logger=logger, server=server, creds=creds, lp=lp, 
> domain=domain,
>   File "/usr/lib/python3/dist-packages/samba/join.py", line 1558, in 
> join_DC
>     ctx.do_join()
>   File "/usr/lib/python3/dist-packages/samba/join.py", line 1446, in 
> do_join
>     ctx.join_add_objects()
>   File "/usr/lib/python3/dist-packages/samba/join.py", line 682, in 
> join_add_objects
>     ctx.join_add_ntdsdsa()
>   File "/usr/lib/python3/dist-packages/samba/join.py", line 607, in 
> join_add_ntdsdsa
>     ctx.DsAddEntry([rec])
>   File "/usr/lib/python3/dist-packages/samba/join.py", line 548, in 
> DsAddEntry
>     raise RuntimeError("DsAddEntry failed")
>
> Windows 2012r2 schema version is 69.
>
> Where should i check to resolve this issue ?
>
> Thanks in advance.
>
>
What is the function level of the existing AD, if it is 2012R2, then you 
could try lowering it to 2008R2

Rowland



