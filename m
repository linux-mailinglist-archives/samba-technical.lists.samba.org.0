Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC96540068
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jun 2022 15:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=gHbvsfxseEp0eAhUlZOPdnVJ0+VF1l69mVCxzWqY5qE=; b=HhZQxqeHwt7x+XkKg/oSvZFYET
	7EmNpV7jb0jqXLTdRQ9chfZecgDyR6kEBpgF2b9azaZTuWnowlXsG/xo82Px1UINZQ8YlVyG3GAFt
	uJbKYvcIvn9KB3CDWVPI4aSmKlkAEnnecWslc9PMuO8omrgfgvWNcTloRUGjPWeY4RUt7qdCoaeSn
	IkZfSIT6pj7NSr86TQbRbR3GrMD7fAStR5uf8xbiP5Rg+lxac2XIqPN82tqFPCkU9q6LjG/XfCUoi
	OiVpHenXmvJ0AunVmFVLSBdW4oBXWgQpSzTfEo7ZxzuGV+Eka6o0p+7amIR124/2UyOvvvJriNFbi
	n91mLPZw==;
Received: from ip6-localhost ([::1]:19902 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nyZX3-007lCk-6o; Tue, 07 Jun 2022 13:46:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62096) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nyZWy-007lCa-5C
 for samba-technical@lists.samba.org; Tue, 07 Jun 2022 13:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=gHbvsfxseEp0eAhUlZOPdnVJ0+VF1l69mVCxzWqY5qE=; b=g998Pcdli90OPSlPIs8Bnq0QLK
 l2MyCtj+ksDw8dZNHWYfDSwUmFpemBpNRUuBtL+qAYXR+wQPzfB7PXXd6+KhSEk+ze0RwTB7fzI9d
 WBSFMxRuUgZTtV0sor4I4U98OJskFCHhl9Jw+GtRxSrqqQ9uMQy+ajlY2oxX2340GQMiHpq5RCbWP
 u6jKrBaL8eDf0VptA/0vMGNBdqTIFV1nThjA4Nz6vz1UAOA05EZ5820ATGavjM1oo0AkqRZDL8Y5T
 dCrHLqaqO2zkhCduByxoHffWSHP8nKOlnUGVEs2xECuZCugMYVg0Z38X7+nBF6ND/yYIf5TJcFwA4
 v7W2hPVJbkIdGydHJ2uYRHE4BofVsyYi4VRzb/O7dOz+xqDZ4+gDlLBeKirIGE+2BUDjBllLqCvJR
 CV1SASDG2ut3CHSatRjjf3JkjbreKgrUmWyHMLRQheSsjerbQMrF7bk22L/sxqddT7HY/qIRz5Ku8
 5ryBuF6WDgkPABvn7SToTXR3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nyZWw-004PAC-DB; Tue, 07 Jun 2022 13:45:58 +0000
Message-ID: <751604e96a30f1462464829ffc38df2190c5376b.camel@samba.org>
Subject: Re: Reintroduce netgroups support?
To: Andrew Bartlett <abartlet@samba.org>, Jeremy Allison <jra@samba.org>
Date: Tue, 07 Jun 2022 15:45:57 +0200
In-Reply-To: <73fce0f07e74d97fb7cf78569448591162dea1c4.camel@samba.org>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
 <Ypo8dcAnXWqnhBye@jeremy-acer>
 <73fce0f07e74d97fb7cf78569448591162dea1c4.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
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
From: Samuel Cabrero via samba-technical <samba-technical@lists.samba.org>
Reply-To: scabrero@samba.org
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-06-07 at 22:08 +1200, Andrew Bartlett via samba-technical
wrote:
> On Fri, 2022-06-03 at 09:53 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Fri, Jun 03, 2022 at 12:00:16PM +0200, Samuel Cabrero via samba-
> > technical wrote:
> > > Hi,
> > >=20
> > > I have received some complains after we dropped netgroups support
> > > in
> > > Samba 4.15.0. Our release notes only mention we dropped NIS but
> > > netgroups went with it.
> > >=20
> > > Some people still use netgroups without NIS, stored in LDAP and
> > > made
> > > available to the system through nss_sss, but it is also possible
> > > to
> > > use
> > > /etc/netgroups.
> > >=20
> > > I had a look to the removed code and I think it is possible to
> > > reintroduce netgroups support independently from NIS, using the
> > > getdomainname() function from glibc instead of
> > > yp_get_default_domain()
> > > from libnsl.
> > >=20
> > > Should we bring back netgroups support?
> >=20
> > If you can do it to help a customer without an extra
> > support burdon, then go for it !

Certainly this is the case and the reason of this thread, the complains
come from a SLE customer.

> >=20
> > I will help review the code.
>=20
> I agree.=C2=A0 It is a hard line to find but I'm sorry we got too
> aggressive
> pulling stuff that folks were using.
>=20
> There is still a real use case for Samba that isn't all AD domains,
> no
> matter how much I love them, and a set of administrators who have
> been
> with us for decades now that have Samba working just how they want
> it.
> We removed it because the supporting libraries were going away, but
> looking over the code I see how netgroups could be quite handy,
> exactly
> because they are not unix groups.=20

Yes, it looks like some deployments are still using them. I have partly
reverted the patches removing NIS support to bring back only netgroups
and created a bug for the backports.

https://gitlab.com/samba-team/samba/-/merge_requests/2564

