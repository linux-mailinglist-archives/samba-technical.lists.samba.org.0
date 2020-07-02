Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8C6212DF6
	for <lists+samba-technical@lfdr.de>; Thu,  2 Jul 2020 22:41:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ADzGNP65/ZxWLEQlstdUf9GscIiUzuleEUZp95C2zR0=; b=pXiFOmd8d0dgh+DaiAxae8cGKF
	kN2txp+P0LfdG5y8TQBcfQOQHLyh7QuATOhsPeM96UAZfOGjAYFktDtgSiFE+8gcn64wPCq3WEN6x
	dX4/xDCaCcmPVvc1QHWb9GKUQFcwlnH7tn3Hn6/Anr+Qk6Ry2i64YmiLLVvgTu2Fd3/Dg4a2qCrA1
	F0Sjg1LyOMC3hrpckCAYCSOUp66xBmyZ6uBJ1V0ARtmoHcavRaGB9DMNNfh/9HYseHjsdDLwctLon
	GvBzqRW/aPKudEdtV1mCfbsXXYiLv9y2qXGF2RU60WIm4zsRufrPWIU+5JphPE1jjsFskXCalEppR
	e9xUDxCw==;
Received: from localhost ([::1]:37266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jr61H-005BBm-RY; Thu, 02 Jul 2020 20:41:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28036) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr60o-005BBM-0G; Thu, 02 Jul 2020 20:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ADzGNP65/ZxWLEQlstdUf9GscIiUzuleEUZp95C2zR0=; b=mD7i63vA3TkqjTUjM9ckCbY22U
 vxQJeasietLXDTA4CA9TlaNyUHqrbRR9Gzpu60OzG1vOP+1YaHreKriQSR0Xj6bDyBWR51aPw+fas
 3Q1zz2vuFSWskVIBmjKILJtCU2v3tbHyvmqybEeCaRCuYfEwd6V+MJv344/tPz4qyMF/5XqHGRXfJ
 ipiaNwMAYeevLcPStnBM9s5AxvcF5/Y8ILrC1M7Vwu+l95M4gJLgkGfJc7b19d4PVStSYwg0BGWzI
 ojbHmj4Dnh7fbraWFwTuDgSqowQj4fwuONayUcRqIfkORpb1xB5ZmdSXofGfqFz9Be2PmxkuDVxjV
 zr2RRAA1iVB8ZxvMIcXzBDF7McTnqBc/V7XAF3VDBfnoWmg0A3vkMDI/wLeLB8SXnnFeLQst/E47e
 zlxH1mJ8jn0xEhA/+GDNavl4iX4khQ9gVmEIDlq7Ijf+OkVyteDErmClx+mE1NJhgog+8rGRnEYRM
 PTTnrGArZ3CRaBvnOTLXjQ0b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr60g-0002gh-JY; Thu, 02 Jul 2020 20:40:43 +0000
Message-ID: <f61b36de9300027d02d678daf576e5a998ac651d.camel@samba.org>
Subject: Samba 4.12.4, 4.11.11 and 4.10.17: File server not impacted (was:
 Re: Heads-up: Security Releases ahead!)
To: samba@lists.samba.org, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Fri, 03 Jul 2020 08:40:37 +1200
In-Reply-To: <bf6f2a89ad649de64d8ffd4e8ca97aab71eee68b.camel@samba.org>
References: <bf6f2a89ad649de64d8ffd4e8ca97aab71eee68b.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-06-26 at 07:58 +1200, Andrew Bartlett via samba-technical
wrote:
> Hi,
> 
> This is a heads-up that there will be Samba security updates on
> Thursday, July 2 2020. Please make sure that your Samba
> servers will be updated soon after the release!
> 
> Impacted components:
>  - AD DC (CVSS 7.5, Medium)
>  - File server (CVSS 7.5, Medium)

I wish to apologise to any file server users who got a scare from this.

Subsequent analysis showed that nmbd, as used in the file server, is
not impacted by these issues.  

The incorrectly assessed issue was:

CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
excessive CPU 

Thanks to all Samba users for your understanding.

AD DC users should of course patch with urgency, even if only for
reliability.  While CVE-2020-10745 came from fuzzing, all the other
issues came via user reports of real-world network traffic. 

We thank those users and encourage all Samba users who can crash Samba 
to report those issues confidentially, see
https://wiki.samba.org/index.php/Samba_Security_Process#Reporting_Security_Defects_in_Samba

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




