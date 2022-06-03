Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E053CA3D
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 14:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3hltoZcHp1RE1noKwatDIso7gRLHsMRO0XoJoceowOU=; b=u4+dOYA5Qa0fr1D4Jsc68Nk88E
	26FnIq6l3XLX4SOHT+grILwEAInrThIQJqmYvcA00otwSyiN42bfVQXHcdkgznbgH1nrnHalgC5em
	H4adiLxHKVFdI7bFxt/o2fd7FkrB6a4sD3psj1F7ql0nd6rbDaQezS6uVgfNHtK1Z4KHqndUMuIvm
	nujXkCLUo550gmCA9+obkG8Pje6OzIM7qRhYTtPkoBVNAP/n2Q/Nc0Vc+yx6chKRivyXpCf8SWKDo
	tZrxIokK+bRNNeH4NHE2lgE0psBdqKnO2ekOMwYgwTtbEG9TZdSYWWsEeqxF+VNQotGX95LWJ6YfG
	1caO0qeQ==;
Received: from ip6-localhost ([::1]:49570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx6nb-006tbH-KJ; Fri, 03 Jun 2022 12:53:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx6nX-006tb8-E9
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 12:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=3hltoZcHp1RE1noKwatDIso7gRLHsMRO0XoJoceowOU=; b=oBI5V7WJt4ZULmdr0PND3xlatE
 lfPQepcI7YRlEnwlgY+qp5Kfgr2vgNRLVz/vUN6ndqpRUNbDciieOQ5uc/c4TzyT+bH0uZ52Bjyq+
 JrdirbgLcH8zRVGjjK5sQ41VWYqacWphiSfHMEpQTOdD4JONmvY6800qeMy25NIRRzi038RLcg3Am
 lE6b+JbH80SWz/KfW/tRRmY09bedeR1cnpPsAwQq4obtALF0y83dpwChTANh3Vyh4UQTzIwNYl72y
 EcE2WaXl5DRNB2kVER/orkElqLGkjATNaUuyaXSdIoN9Nqe1QuIQY7oldN1WzMqwxVU20/YBgGkFT
 kBPl9DQf93oeOz8AV2ifJpBEz+Ik/BM0QR1QhwMMimczRgyhpDgfJisv5yjYhE0mG0iL2UHz3Z8ni
 r9g6oKE9IwdsxTP9OedS0eoYaE8LvX+fps5XJSnyxgrD1KXL1LGP3RvS1yEYYuEaZ+tQs5H8o4Igb
 iZkVjr6ZPgp/DTm4NXW+m67F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__ECDSA_SHA256__AES_256_GCM:256) (Exim)
 id 1nx6nW-003qAe-JD
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 12:53:02 +0000
To: "'samba-technical'" <samba-technical@lists.samba.org>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
 <4170ad2340f7a3f2bc40c4f6c77ba5420a0c1cc8.camel@samba.org>
 <b1e1aadfb2a9441afd8f58e096cfbccb8bd54d1d.camel@samba.org>
 <4ce02f11ab5012b67f3667df5eb73489e1dcd334.camel@samba.org>
 <27dd54d1ec4f7f0b6138d1d9e63b8b040f6eec6f.camel@samba.org>
 <57265464931453d4b8eb5099f30296ef442d07d8.camel@samba.org>
In-Reply-To: <57265464931453d4b8eb5099f30296ef442d07d8.camel@samba.org>
Subject: RE: Reintroduce netgroups support?
Date: Fri, 3 Jun 2022 14:53:02 +0200
Message-ID: <000201d87748$dc7140f0$9553c2d0$@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: nl
Thread-Index: AQHYdzD9UL5KuIWyJ0yxsYEACRwyrK09dd+AgAAIiICAAAXHAIAACrkAgAAJAICAAAko0A==
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "L. van Belle" <belle@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> -----Oorspronkelijk bericht-----
> Van: samba-technical <samba-technical-bounces@lists.samba.org> Namens
> Rowland Penny via samba-technical
> Verzonden: vrijdag 3 juni 2022 14:12
> Aan: samba-technical <samba-technical@lists.samba.org>
> CC: Rowland Penny <rpenny@samba.org>
> Onderwerp: Re: Reintroduce netgroups support?
> 
> On Fri, 2022-06-03 at 13:39 +0200, Samuel Cabrero wrote:
> > On Fri, 2022-06-03 at 12:01 +0100, Rowland Penny via samba-technical
> > wrote:
> > > On Fri, 2022-06-03 at 12:40 +0200, Samuel Cabrero wrote:
> > > > On Fri, 2022-06-03 at 11:10 +0100, Rowland Penny via samba-
> > > > technical
> > > > wrote:
> > > > > On Fri, 2022-06-03 at 12:00 +0200, Samuel Cabrero via samba-
> > > > > technical
> > > > > wrote:
> > > > > > Hi,
> > > > > >
> > > > > > I have received some complains after we dropped netgroups
> > > > > > support in Samba 4.15.0. Our release notes only mention we
> > > > > > dropped NIS but netgroups went with it.
> > > > >
> > > > > Well, netgroups are part of NIS
> > > >
> > > > Nowadays you can store netgroups in LDAP.
> > > >
> > > > https://ldapwiki.com/wiki/Netgroup
> > > >
> > > > https://www.linux.com/news/sysadmin-sysadmin-netgroups-are-not-
> jus
> > > > t-nis-anymore/
> > >
> > > But using Samba with ldap basically requires SMBv1 and Samba is
> > > trying to remove this.
> > >
> > > > > > Some people still use netgroups without NIS, stored in LDAP
> > > > > > and made available to the system through nss_sss, but it is
> > > > > > also possible to use /etc/netgroups.
> > > > >
> > > > > Why and how are they using a part of NIS without NIS ?
> > > >
> > > > The netgroups are stored in LDAP and used in the 'valid users'
> > > > share
> > > > option.
> > >
> > > But, you really shouldn't use 'valid users' with AD, you should use
> > > ACL's
> > >
> > > > > > I had a look to the removed code and I think it is possible to
> > > > > > reintroduce netgroups support independently from NIS, using
> > > > > > the
> > > > > > getdomainname() function from glibc instead of
> > > > > > yp_get_default_domain()
> > > > > > from libnsl.
> > > > > >
> > > > > > Should we bring back netgroups support?
> > > > >
> > > > > I do not see the point, AD groups can do the same thing.
> > > >
> > > > AD is not involved here, this is a pure file server use case.
> > >
> > > Then it definitely shouldn't be brought back, once SMBv1 is removed,
> > > then standard ldap will very probably not be involved, just AD and
> > > netgroups will not be required,
> > >
> > > Why not get sssd to work with Windows AD groups ?
> > >
> > > Rowland
> > >
> >
> > Rowland, lets remove LDAP, AD and SSSD from the equation completely.
> > Consider this pure file server deployment:
> >
> > 1. Set NIS domain name
> >
> > $> nisdomainname
> > foonisdom
> >
> >
> > 2. Add couple of users
> >
> > /etc/passwd:
> > user1:x:1001:1001::/home/user1:/bin/bash
> > user2:x:1002:1002::/home/user2:/bin/bash
> >
> > $> pdbedit -L
> > user1:1001:
> > user2:1002:
> >
> >
> > 3. Setup /etc/nsswitch.conf
> >
> > passwd:         compat
> > group:          compat
> > netgroup:       files nis
> >
> >
> > 4. Add a netgroup
> >
> > $> cat /etc/netgroup
> > netgrp1 (,user1,foonisdom) (,user2,barnisdom)
> >
> >
> > 5. Minimal smb.conf
> >
> > [global]
> >         workgroup = WORKGROUP
> >         security = user
> >
> > [share]
> >         path = /srv/share
> >         valid users = @netgrp1
> >
> >
> > 6. Test, samba < 4.15.0
> >
> > $> smbclient //localhost/share -Uuser1%<pwd> -c 'quit'
> > $> echo $?
> > 0
> >
> > $> smbclient //localhost/share -Uuser2%<pwd> -c 'quit'
> > tree connect failed: NT_STATUS_ACCESS_DENIED
> >
> >
> > 7. Test, samba >= 4.15.0
> >
> > $ smbclient //localhost/share -Uuser1%<pwd> -c 'quit'
> > tree connect failed: NT_STATUS_ACCESS_DENIED
> >
> > $ smbclient //localhost/share -Uuser2%<pwd> -c 'quit'
> > tree connect failed: NT_STATUS_ACCESS_DENIED

I also would say, stop using/abusing localhost. 
localhost != hostname 
hostname != hostname.fq.dn 
REALM != dnsdomain 
REALM = YOU.REALM.TLD 
And make sure hostname -s /-f /-d always give back you first and primay
hostname/dnsdomain
Kerberos needs a correct SPN/hostname.fq.dn 

So bases on these things above, I suggest try with : 

smbclient //hostname.fq.dn /share -Uuser2@REALM.TLD%<pwd> -c 'quit' 
and
smbclient //hostname.fq.dn /share -UADDOM/user2%<pwd> -c 'quit'
and
smbclient //hostname.fq.dn /share -UADDOM/user2@REALM.TLD%<pwd> -c 'quit'

Basicly all 3 should work, but depends on client server and samba versions
and your settings. 

I hope that this at least helps a bit. 

Greetz, 

Louis





