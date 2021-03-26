Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9134834AB3A
	for <lists+samba-technical@lfdr.de>; Fri, 26 Mar 2021 16:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Db1wDrp2ncBMVyOR5Grn8Ch4/nMNtGx8xQfqfyYuyyY=; b=508MoWAzv9ScKELhcoFW9tPb7k
	WYxohIYQB/UUc10vJtzx5D6UZHX1CdlUtp4R8wrgAiqvAb60UAbtSTdU6tcIZizwyxEM9Ag412fYL
	dNkPyO5kp4MP71CqNT6Ke6q+OWRqowcFt5b4Z6O54OuiX5jPUogw/vjuxAE3asUulHP0G4oDXUVU/
	1VoJ6g3J1oas6tUJNQiDqgXB/+j9QF/ivomz9Cd91YUt2WACtyIGTzAJaQNx6zKkE4r3FgUj/h9em
	3LqW2kjSXq4NVffFqyPiM77aHqpcAUz1CU9tPyzcGMxaNcf9R1J2X1RCaRqP/WPMsqujvFZr2UeIm
	pkSAZ1gw==;
Received: from ip6-localhost ([::1]:26346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPoAx-006rhc-2x; Fri, 26 Mar 2021 15:15:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32968) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPoAs-006rhS-Pk
 for samba-technical@lists.samba.org; Fri, 26 Mar 2021 15:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Db1wDrp2ncBMVyOR5Grn8Ch4/nMNtGx8xQfqfyYuyyY=; b=NsqslPmeP5os1xFkLlBr5dYryi
 uRwQ2hFDR/wrTAcjPfpU6c9mNS8qac7esMb/nZbCTMgux70Ny15to3q65t3dOjFYIrD1NmyGhcb3g
 +qI7LcbcCL5T+tFjvAZWTQcUFLQsQPd9vqnOWg4DIC0ayaBHpgHJI5684A7ILjDMW5AdNcfTbC9Sy
 JO06ID/SzQMbLDSZWohxPorSa5IzVxVt+jzD+GkamqLCBOHmnK0erPthNS3kDbzsd0ugozh8jbnHE
 Q8wTKK9U7zMbZJ+2TD/K3mRS8AeObeWZBaIlHDv92O0mEOA1eAkCKBJn94/bNGihvjSBv7+PuHesZ
 td5TDcPyQjNF3DmOVkRAKdHLc7frndx2gz3uc74iqQp0ECyTIO42Tjw3G8J0eeWGFUbpbA/D1WZvG
 F70zEpqJTuCqytPVwuUaCFdtodpzHDkhznLJFl2hyFDb+I9BEX/nSqocnt4eIxofK5RmhssAMSzSX
 Md9oE19u8bdhckVbOC6Bp10Z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPoAr-0003Ou-EB; Fri, 26 Mar 2021 15:14:58 +0000
Message-ID: <d860bf247e5e66dc67ce3f32834c980b23af9992.camel@samba.org>
Subject: Re: vfs_full_audit annoyances on major version upgrades
To: Andrew Walker <awalker@ixsystems.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 27 Mar 2021 04:14:53 +1300
In-Reply-To: <CAB5c7xpuL7-_AqJX1szNA9QBjHtOTGmPODoOgr2bvu2EUqVoTg@mail.gmail.com>
References: <CAB5c7xpuL7-_AqJX1szNA9QBjHtOTGmPODoOgr2bvu2EUqVoTg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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

On Fri, 2021-03-26 at 08:38 -0400, Andrew Walker via samba-technical
wrote:
> I've noticed that several users (including one in the samba lists just now)
> got bitten by vfs_full_audit on major version upgrades. Due to VFS
> modernization, user's full_audit:success / failure configuration strings
> may be invalid post-upgrade. A concrete example is "full_audit:success =
> unlink". What makes this particularly painful is that full_audit will
> default to logging _everything_ if it encounters an unrecognized parameter.
> 
> What do you think of doing something like the following:
> https://github.com/truenas/ports/blob/truenas/12.0-stable/net/samba/files/patch-source3__modules__vfs_full_audit.c
> 
> Basically:
> 1) expand table for vfs_op_names to include an "old" name to use for
> lookups as well (so that "unlink" logs "unlinkat")
> 2) fail Tree Connect with a concrete error message printed at DBG_ERR if
> logging parameters are invalid.

There certainly is a good case to be made that the difference between
rename and renameat is not important for the audit logs, so shouldn't
be exposed to the user.

I've not looked at the code, but other than the name is there any
difference in what is output?  If not, then an alias makes a lot of
sense.

I also agree that failing to start up is a much better option than
abandoning the logging filter.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



