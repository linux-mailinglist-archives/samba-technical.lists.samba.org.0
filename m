Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5753C9BA
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 14:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=uzPqrXAG3FaC4OZUX8kY9nhZQV0JcPInE3rLbedWsmc=; b=JxGb6ye9bByfxcbY1UIHw7JJdN
	w7/iGahB5BF2c3ALHqFNcXnSl1ojfv56Kv745Co3c08TrQoQu9ksVZSlcZkuOaUkU4I3gXS2iLYk/
	le0jTQx378ok9ePCAyWRvOOOAjlS2z0b0OMUkwvi5mZGFeD/FI1xzivMK1P76LhIJfaXOGWsZwmUO
	mscMX0hHQTZz/PksBkJAjdZistT8RSNsMjp0cILIQihNzjdszdm0W8UFnbvvoLUAUW0r6tOY4rBwg
	/f2NBydNwVn5xJ7ATXs8AU21R4uqWbHs4S7A4/vZGNSldprf45d9xWuqUxwAd2S9sudP8YE77kfo2
	wtRQPjWw==;
Received: from ip6-localhost ([::1]:44654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx6A9-006rYX-5Q; Fri, 03 Jun 2022 12:12:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62000) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx6A4-006rYN-Ku
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 12:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=uzPqrXAG3FaC4OZUX8kY9nhZQV0JcPInE3rLbedWsmc=; b=QjzgR5f7DcnU2HqxtDUiwZjFB0
 TcZNlSDyQb2St9KCpVNU5E2a1QYG3DGNuRcd2nAzb6bt7Nj4obNCTv+cBD4oS526JKFrA+KNRe6bw
 lwpggMMRm6RYt10KRSXpYVfGCC0kL4YKiIXrwjtcVGzrl+bqJtMQcDL3av3OYv30AaEYofAyngBHh
 SlhB58tcPJqrNC474uXMzeyjuLjRYCwLhwXwlq6lY5ThFlwamWiyyUF7mCRklGCOwNB0awsuGwim+
 r7cH/z1C6gML0zZtbGQsXKZsPweqq4WmpkpHlCUgOjDh/QOp6iyLTw9WmncAycw2vHB5fPiN4Axm5
 Hc1xn1kBFBekx5IPFLMA2rk5Q3548EifOwRYxfENCWRvuAW4mMmogB7ybqViXssjFdNfeHjhyx9DT
 Z2YxVKlh2wFyr7dbD3zZ8PyMNhGan23b/DhSS+rURYLH09xRMx0fKoBXZ2qclIrasoTbEGeigKxiK
 edkpbrPnAI56dBa0AxShxtHV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nx69v-003pkZ-Ua
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 12:12:08 +0000
Message-ID: <57265464931453d4b8eb5099f30296ef442d07d8.camel@samba.org>
Subject: Re: Reintroduce netgroups support?
To: samba-technical <samba-technical@lists.samba.org>
Date: Fri, 03 Jun 2022 13:12:07 +0100
In-Reply-To: <27dd54d1ec4f7f0b6138d1d9e63b8b040f6eec6f.camel@samba.org>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
 <4170ad2340f7a3f2bc40c4f6c77ba5420a0c1cc8.camel@samba.org>
 <b1e1aadfb2a9441afd8f58e096cfbccb8bd54d1d.camel@samba.org>
 <4ce02f11ab5012b67f3667df5eb73489e1dcd334.camel@samba.org>
 <27dd54d1ec4f7f0b6138d1d9e63b8b040f6eec6f.camel@samba.org>
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

On Fri, 2022-06-03 at 13:39 +0200, Samuel Cabrero wrote:
> On Fri, 2022-06-03 at 12:01 +0100, Rowland Penny via samba-technical
> wrote:
> > On Fri, 2022-06-03 at 12:40 +0200, Samuel Cabrero wrote:
> > > On Fri, 2022-06-03 at 11:10 +0100, Rowland Penny via samba-
> > > technical
> > > wrote:
> > > > On Fri, 2022-06-03 at 12:00 +0200, Samuel Cabrero via samba-
> > > > technical
> > > > wrote:
> > > > > Hi,
> > > > > 
> > > > > I have received some complains after we dropped netgroups
> > > > > support
> > > > > in
> > > > > Samba 4.15.0. Our release notes only mention we dropped NIS
> > > > > but
> > > > > netgroups went with it.
> > > > 
> > > > Well, netgroups are part of NIS
> > > 
> > > Nowadays you can store netgroups in LDAP.
> > > 
> > > https://ldapwiki.com/wiki/Netgroup
> > > 
> > > https://www.linux.com/news/sysadmin-sysadmin-netgroups-are-not-just-nis-anymore/
> > 
> > But using Samba with ldap basically requires SMBv1 and Samba is
> > trying
> > to remove this.
> > 
> > > > > Some people still use netgroups without NIS, stored in LDAP
> > > > > and
> > > > > made
> > > > > available to the system through nss_sss, but it is also
> > > > > possible
> > > > > to
> > > > > use
> > > > > /etc/netgroups.
> > > > 
> > > > Why and how are they using a part of NIS without NIS ?
> > > 
> > > The netgroups are stored in LDAP and used in the 'valid users'
> > > share
> > > option.
> > 
> > But, you really shouldn't use 'valid users' with AD, you should use
> > ACL's
> > 
> > > > > I had a look to the removed code and I think it is possible
> > > > > to
> > > > > reintroduce netgroups support independently from NIS, using
> > > > > the
> > > > > getdomainname() function from glibc instead of
> > > > > yp_get_default_domain()
> > > > > from libnsl. 
> > > > > 
> > > > > Should we bring back netgroups support?
> > > > 
> > > > I do not see the point, AD groups can do the same thing.
> > > 
> > > AD is not involved here, this is a pure file server use case.
> > 
> > Then it definitely shouldn't be brought back, once SMBv1 is
> > removed,
> > then standard ldap will very probably not be involved, just AD and
> > netgroups will not be required,
> >  
> > Why not get sssd to work with Windows AD groups ?
> > 
> > Rowland
> > 
> 
> Rowland, lets remove LDAP, AD and SSSD from the equation completely.
> Consider this pure file server deployment:
> 
> 1. Set NIS domain name
> 
> $> nisdomainname
> foonisdom
>  
> 
> 2. Add couple of users
> 
> /etc/passwd:
> user1:x:1001:1001::/home/user1:/bin/bash
> user2:x:1002:1002::/home/user2:/bin/bash
> 
> $> pdbedit -L
> user1:1001:
> user2:1002:
> 
> 
> 3. Setup /etc/nsswitch.conf
> 
> passwd:         compat
> group:          compat
> netgroup:       files nis
> 
> 
> 4. Add a netgroup
> 
> $> cat /etc/netgroup
> netgrp1 (,user1,foonisdom) (,user2,barnisdom)
> 
> 
> 5. Minimal smb.conf
> 
> [global]
>         workgroup = WORKGROUP
>         security = user
> 
> [share]
>         path = /srv/share
>         valid users = @netgrp1
> 
> 
> 6. Test, samba < 4.15.0
> 
> $> smbclient //localhost/share -Uuser1%<pwd> -c 'quit'
> $> echo $?
> 0
> 
> $> smbclient //localhost/share -Uuser2%<pwd> -c 'quit'
> tree connect failed: NT_STATUS_ACCESS_DENIED
> 
> 
> 7. Test, samba >= 4.15.0
> 
> $ smbclient //localhost/share -Uuser1%<pwd> -c 'quit'
> tree connect failed: NT_STATUS_ACCESS_DENIED
> 
> $ smbclient //localhost/share -Uuser2%<pwd> -c 'quit'
> tree connect failed: NT_STATUS_ACCESS_DENIED

Lets take everything out of this, you want Samba to bring netgroups
back so that sssd works. Why not get sssd to emulate netgroups with AD
(or ldap) ? why should Samba be altered to work with an outside corner
case ? There are, in my opinion, too many corner cases already.

Rowland
 


