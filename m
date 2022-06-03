Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B08153C900
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 13:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=iD39naQ+R+qyfTtX3W5w9xh6McP94+6Sl++F9nl7nSs=; b=k+9LyxiLPKMS78wLqJfPN3xjQa
	B+aYHpp8SHJx3si6Ucjr2EmbuRzBcmWw92Hd0C7fWy7AoLzjw6lBl5UUkbRJBTHcVuDyivPtAkrz4
	gFYDmUg5RzuO7EzWyqiNqi3aNe66PxwW4fF1bxpTkEq4TaDl8SMnRyN40WkEeMz5GMUvmKYox+yno
	JpFAzozOlR2bDL6qjVRSB/8+4gboJrFl5DJXWjetMVvWNLHAXWSZJ/aEza1VWkJpct3F66aLjoyXB
	Ss9Z/kDOsIVRjXG2A/Y/agZIjeWD9I/IDmkUJjV5rUh63CG2Zt9Q46vriiHXapG62DS0x/sJ9IoXz
	oYJ99G3A==;
Received: from ip6-localhost ([::1]:41530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx53n-006q9W-1v; Fri, 03 Jun 2022 11:01:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61994) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx53i-006q9M-Og
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 11:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=iD39naQ+R+qyfTtX3W5w9xh6McP94+6Sl++F9nl7nSs=; b=s8jY+9QIEIcv3BHTHBD/2jhkSY
 XwdL4PAhf6bEozAlz46Yh/f4E8kxe42vOBdXkvWHE3HcOmUsU+ueX4zgs58Lf8e0Z3Z8/mFkHDwHE
 B1+HZc03wDcJEpXnrdm4cqR27j1F8dcDq6YD8JbFWaw8lTuHCJXBTkgU/iripdoGqvfln+1Pvs6gz
 Z5X1x5docFQIqYsiQvxkPZYPWKSUegKsbcJyZopUldyIDhRuae6u2Ndjx3VmuBDdsYg8zt84Fm1q0
 5Q7U9T6ar6ggCwa5ntzVS8H3+0SDCHoSvUYnXZ4Tch6mQOAY0+auczEdFDThR5I4E2xbhLlqxgRxE
 uXjcIYzsovwBVbURHbXEQeuHRcs70MEJk4L7CFU3pc4e5nPE72Wwp1rPKcel6QrA1p/ddU09dPeMw
 ZcNyaIGGTs5SgdmH7E8o+gNESTZXh7CSe7Iw00qVl9aFfzA4+ZCOwyGtcZcNGgeAD4G4L0GQU+Q+t
 DwB5KDEmgQPye6AEwYXlYIeI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nx53d-003pNb-5c
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 11:01:33 +0000
Message-ID: <4ce02f11ab5012b67f3667df5eb73489e1dcd334.camel@samba.org>
Subject: Re: Reintroduce netgroups support?
To: samba-technical <samba-technical@lists.samba.org>
Date: Fri, 03 Jun 2022 12:01:32 +0100
In-Reply-To: <b1e1aadfb2a9441afd8f58e096cfbccb8bd54d1d.camel@samba.org>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
 <4170ad2340f7a3f2bc40c4f6c77ba5420a0c1cc8.camel@samba.org>
 <b1e1aadfb2a9441afd8f58e096cfbccb8bd54d1d.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-06-03 at 12:40 +0200, Samuel Cabrero wrote:
> On Fri, 2022-06-03 at 11:10 +0100, Rowland Penny via samba-technical
> wrote:
> > On Fri, 2022-06-03 at 12:00 +0200, Samuel Cabrero via samba-
> > technical
> > wrote:
> > > Hi,
> > > 
> > > I have received some complains after we dropped netgroups support
> > > in
> > > Samba 4.15.0. Our release notes only mention we dropped NIS but
> > > netgroups went with it.
> > 
> > Well, netgroups are part of NIS
> 
> Nowadays you can store netgroups in LDAP.
> 
> https://ldapwiki.com/wiki/Netgroup
> 
> https://www.linux.com/news/sysadmin-sysadmin-netgroups-are-not-just-nis-anymore/

But using Samba with ldap basically requires SMBv1 and Samba is trying
to remove this.

> 
> > > Some people still use netgroups without NIS, stored in LDAP and
> > > made
> > > available to the system through nss_sss, but it is also possible
> > > to
> > > use
> > > /etc/netgroups.
> > 
> > Why and how are they using a part of NIS without NIS ?
> 
> The netgroups are stored in LDAP and used in the 'valid users' share
> option.

But, you really shouldn't use 'valid users' with AD, you should use
ACL's

> 
> > > I had a look to the removed code and I think it is possible to
> > > reintroduce netgroups support independently from NIS, using the
> > > getdomainname() function from glibc instead of
> > > yp_get_default_domain()
> > > from libnsl. 
> > > 
> > > Should we bring back netgroups support?
> > 
> > I do not see the point, AD groups can do the same thing.
> 
> AD is not involved here, this is a pure file server use case.

Then it definitely shouldn't be brought back, once SMBv1 is removed,
then standard ldap will very probably not be involved, just AD and
netgroups will not be required,
 
Why not get sssd to work with Windows AD groups ?

Rowland



