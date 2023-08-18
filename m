Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1757813D8
	for <lists+samba-technical@lfdr.de>; Fri, 18 Aug 2023 21:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=215IqiKHM/5U0F/FVTo5wQDDYfN4K+fDZ8ZBSs80Jvg=; b=dKFqagAKxW61DJAuVwOIWC2ihU
	/ptv1BhqML7EZGe8ZYGwtRSf8L9E255A9eLVaTgZkW/ywFjciOkw7Qw05R3WcfZuHE1MSxc2hsmZ4
	GME3kOUtwJCrNS2Auhc3+MDQtzCyNt39PRCr/pI0l4Fm5zYg008BVGtwVKV4OZVb9pEDL50jvbpH4
	heL3sbZfOTkES9jigv8//bCQjK8xPgiNPSwRPXLpa4IbPRCBXjNME4oqAwz6B4y8AvJKETm9eGh6h
	vfLd1hPnj6KMS7OkdDxy4coIIBlt5rZm4STYifimcPAMqhzXoyI+LrtRGXzhagf2hkkjLa/oArITT
	DaId51aA==;
Received: from ip6-localhost ([::1]:62338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qX5RN-00DAl4-F9; Fri, 18 Aug 2023 19:47:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16380) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qX5RG-00DAkv-6S
 for samba-technical@lists.samba.org; Fri, 18 Aug 2023 19:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=x/NeP5AeZTp79QRVdbjzTEGSYZZG4/WLWuM1G5KE/1o=; b=kfFZ6y09wHD0lVynIpixGBEGQS
 Cb+OUcQ620P1yqPMByVLIFebEuwTo2yx0OH42Vki1CIYhyYBl3t7dDXxwoKpcVDemgRsym4Jcehx9
 TWhlVDPXmAnViur/bkZ/fAEB0CW+knciomY1W0mbDbtrX9OWeQhUO0YVStUM+2ieXcDGDuoQSacg0
 q7XSP4ecn3iNVzOOJO3Ozy2aEEcobtFW8PaQ6hZHNSAsjtLyj4RQSkIeAn6kPuOWudRdXHx3su402
 M1HfacNJcyEKPrQUftAkfZxawSkLSGnS80Vrq0TgdGGJwG0AYGgnJR3VdT+Tk0/bhtc9obbAU2Z26
 /RnhK3112kgtxb/K+zUsYdA1nMmlRxVX3/Nx9rGSNToejy37CXPCmwZNlNdgSajr468xGZ4znpmBF
 W37HME74/eRXVBYEgoYrTeRgBo+in+LTviM0eM9zL35pEOOm0FTdY9GonyRV1ef/eCAdlhFJttH1I
 Bm+yrYLERs5fJlsUGDcWfMxu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qX5RE-008n3D-27; Fri, 18 Aug 2023 19:47:17 +0000
Message-ID: <5634843935b5cc2cbb01b466a2794c531d3494b6.camel@samba.org>
Subject: Re: Loading users into a Samba AD DC using LDIF?
To: Richard Sharpe <realrichardsharpe@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 19 Aug 2023 07:47:11 +1200
In-Reply-To: <CACyXjPwRaW=Nn6XOeMbpNj5YeLHhVnxiLeu42huE2JnSKeEKmA@mail.gmail.com>
References: <CACyXjPwRaW=Nn6XOeMbpNj5YeLHhVnxiLeu42huE2JnSKeEKmA@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Fri, 2023-08-18 at 08:59 -0700, Richard Sharpe via samba-technical
wrote:
> Hi Folks,
> In testing user creation with samba-tool, I found it takes around
> tenminutes to create 10,000 users. This was with a VM but with
> realhardware we might only expect a small factor of improvement.
> Is there a way to use LDIF to load large numbers of users and
> groupsinto Samba as an AD controller?
> Of course, that might not be faster, but I am hoping.

Yes, to to avoiding the python startup overhead and being a single
transaction (matters less on SSD, the fsync() was a real cost 'back in
the day').  
The minimum attributes in AD are smaller than you might expect:
from an example in testprogs/blackbox/dbcheck-links.sh
dn: CN=missingsidu1,CN=users,DC=release-4-5-0-
pre1,DC=samba,DC=corpobjectclass: usersamaccountname: missingsidu1
Setting passwords is more of a pain, by default unicodePwd takes the
password as UTF-16-encoded("password") with the " chars really being in
the string set!
Or you can enable userPassword support, and just set "userPassword:
password" just like any other attribute.
samba-tool forest directory_service dsheuristics 000000001
eg:(tested against a ad_dc testenv)
bin/samba-tool forest directory_service dsheuristics 000000001 -s
st/ad_dc/etc/smb.conf
bin/ldbadd -H st/ad_dc/private/sam.ldbCan't load
/usr/local/samba/etc/smb.conf - run testparm to debug itdn:
CN=missingsidu1,CN=users,DC=addom,dc=samba,dc=example,dc=com           
      objectclass: usersamaccountname: missingsidu1userPassword: 
p@ssw0rd
Added 1 records successfully
I hope this helps!
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
