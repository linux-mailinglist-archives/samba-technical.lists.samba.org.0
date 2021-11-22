Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE645942B
	for <lists+samba-technical@lfdr.de>; Mon, 22 Nov 2021 18:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=G1U7Y2DEpWXAPMj+3X6PAHBJte0VDz6oH1RoB/HgIFE=; b=r34ZyaGbbBsGVHSxldkgK6TerG
	0UicKioXLNR2jBr4KxGDuMASNA8o1twykHjDOrM7waqk65FiIWPeCB63k30a6ROpPbYgMqo/B/e70
	ibEyASni0zdTmD240tsyfM8Oku5tJ+ZGYetgjMLDFzP/ZFskV3bjZLtyPOAWESuhxormdO1ZZGmfw
	ktSe5Dl3cnEY7PLOy0vmOTf/U3023RzRoGTZZHmmhA+phPa0AdVJzcopo9hHhPDGnDPAWMuPYhHjg
	GPgWqELWtZcwuyHbNVGSvAulKsPH7A7R8Q3CGT1rgQquKeCd3HquTwsVqW9YZO+wwjH795iMwYfQo
	WfMBC/+w==;
Received: from ip6-localhost ([::1]:36852 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mpDMQ-003ldu-R6; Mon, 22 Nov 2021 17:44:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58454) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mpDMG-003ldg-GV; Mon, 22 Nov 2021 17:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=G1U7Y2DEpWXAPMj+3X6PAHBJte0VDz6oH1RoB/HgIFE=; b=Hnn5eLVUdXpGKT31wTNAuQh5uD
 C33gXLaIHEV+qL+asJeunQgZJ5P4fsqBbvGmszuJbpXTyQ1MeT1TFlGvmxY9sRKHrhRLyNg8MJJcX
 AtjexTUjPacMiQjNbtKV4XTFdffmn6mkCeEeP0RlKick2irYv8z/FeUR03DIHJA5vhK3IKj4GGv88
 VNsIa5Lil1q8DOOhDTjOaLTS9cVrCBUjiUoluMx4fuyBSwropiCpvZNksbkIT10q7Z9ROZOA6bE/M
 ZlI4Dr2QZO9JXvTDfctWb0JBVYD+r3z6aceQSsbTDkc1jyGj9J+o8fLA/KT4I7SwNzuYXxQiVkL0o
 SQPOhQz/lR+AaO/5zMhhpj0Db1WYyhmlHHdDPMNnWOZP5JkWyUZVCq8E5br06fMc2/1jM3YddT5d+
 +3ZfDjxB1d2cZNc66z+Caj6sCK4DL2lvLpoBAAg7pyuAQyyr4dY8Lz0aUGsuRhAYbX2OTuJEPKvq/
 TujiRB6IG7ZA8bp/vEmsTsAh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mpDME-008PoI-Sm; Mon, 22 Nov 2021 17:43:59 +0000
Message-ID: <409e2ab4b21677c183a10cf109d10ce7a2a882ea.camel@samba.org>
Subject: Re: Partial mitigations for the Nov Samba CVEs
To: Salvatore Bonaccorso <carnil@debian.org>
Date: Tue, 23 Nov 2021 06:43:50 +1300
In-Reply-To: <YZuiw+V9vrzrI8UL@eldamar.lan>
References: <c8187137526a42e9c370415ddcfa5aa1df2a6af3.camel@samba.org>
 <YZuiw+V9vrzrI8UL@eldamar.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: "sathieu@debian.org" <sathieu@debian.org>, seb@debian.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org,
 Debian Samba Maintainers <pkg-samba-maint@lists.alioth.debian.org>,
 jmm@debian.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-11-22 at 15:01 +0100, Salvatore Bonaccorso wrote:
> 
> Thank you helping identifying the bare minimum to pick. I'm working
> on
> 
> this for Debian (for buster) and based on the above I have test
> 
> packages at:
> 
> 
> 
> https://people.debian.org/~carnil/tmp/samba/2021-11-09/
> 

Great, thanks for picking this up.

> 
> (they are not signed! So anyone reading this, they should not be
> 
> considered production ready)
> 
> 
> 
> What is missing from here with that: The above referenced update
> would
> 
> still require admins of the setups described in
> 
> https://www.samba.org/samba/security/CVE-2020-25717.html to apply the
> 
> 'username map' and 'username map script'. So a followup in the form
> of
> 
> https://bugzilla.samba.org/show_bug.cgi?id=14901 as well for 4.9
> would
> 
> be good to have (help on that part as well much appreciated if
> 
> possible).
> 
> 
> 
> I see there are patches for 4.10, so I will try to take your patches
> 
> for 4.9.

The trick there would be to take the C parts, as the new testsuite is
Python 3.6 only anyway.  The C code hasn't changed much, I hope it will
drop in OK.

The same would apply for almost all the patches really, I'm not
expecting big dramas to take the tested C patches from 4.10 to 4.9 but
the more that is changed the riskier it becomes, and I don't 'do'
untested patches :-)

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


