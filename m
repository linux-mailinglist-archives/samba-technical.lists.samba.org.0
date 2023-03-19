Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519A6BFFC8
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 08:30:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=9GqJ4hOcPX4sEwB0SHqwQn/2yXvbKYOg38P+dLEfekc=; b=r36RU4Bi3SJ221bAXxHPuaKEUj
	ZtMfNBUvjt1YMwlvPUng/uBhgHHFz3fuu/q7NBQRG0pt4KEkvbPH6PAvi5VRSDNlYtmIvwe5htZ74
	XQU21d4luse9SM9vOe3Mg/9HqF2HAam9qNEF/Zp7BpGs5IdxCECallJTBP18uYq8C41g78J8cGB1S
	yw7QPLW9uiNoo/q9sASUC+qbwetAXdiRLFhL8NIysmJlIsG/nId9e7Xgl3ISFDWarcBoQz1XwbBeH
	gC97zgjwpTL/GzTsX3+PvSB4Nn0/ArCEiZGkX3wo5OnEqGsOOs6XCYXvf0j19VkhZjZ+or3QmmnkV
	F3gpuepA==;
Received: from ip6-localhost ([::1]:36256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdnUH-003LiR-BG; Sun, 19 Mar 2023 07:29:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15768) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdnU9-003LiH-EL; Sun, 19 Mar 2023 07:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=9GqJ4hOcPX4sEwB0SHqwQn/2yXvbKYOg38P+dLEfekc=; b=1G/7h6wXmIkIEorAj+EvnqG/+v
 3HN7kjrscA/Q8eec9N3IBeNTpgEOZARmdnTt/CBa9UXrOTbgk5CDdfi/7MK5pK8mtnKL+rdYRa4GL
 qsZ5EbgHI+qhqyXLfA3FvgxwUjQhda8dKPILge3oiVloUxKtqHW27HXs7phoyk7ZhnEncQQw5Zy2h
 81MK8I43LUi6GPFuWZG4t1oxvz+PvJvdvHm58P5Rz0L/lT4nwNtDE6xu23XcNKHosD+iL1dpFV+ju
 gylHAQCkjU9QWAPOxV1VKuZfJEOEqLSuiWxeAA4z4sJjAG0KZvnIiac4hlC+UP3wrPbEzGyaq94iB
 Un2g2Rz+yQHmPnIf7FCYPoTzDHiHusI+pE7JVQ5Qo7Qd9K6oMXeY4KIJOe+hkm/umOcmTf3nfjTHy
 ilzqZpfbChUN+4lNW0+ZtV5H5KDkbU2DpP8HCQ7KkQNrvXZ7/H4qYmBn57WvZNy5xU4F6H1z+iqz1
 ixjcw7Pmqebg0ywTJJv7TYzT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdnU8-004Akz-OL; Sun, 19 Mar 2023 07:29:44 +0000
Date: Sun, 19 Mar 2023 09:29:43 +0200
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: mit-krb5 and heimdal binaries
Message-ID: <ZBa55+81hGE4QF7k@pinega.vda.li>
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On su, 19 maalis 2023, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> I already asked a similar question before, but it keeps popping up in different
> contexts and forms, and the more I use samba myself, the more often it comes to
> me too, especially in context of using various security tokens for auth.  And the
> more I think about all this, the more sane it looks to me.
> 
> The thing is: mit-krb5 has much better user-level support than heimdal. But samba
> does not fully support mit-krb5 as an active directory domain controller.  The
> AD-DC thing is server-side.
> 
> I can think of providing two builds of samba for a distribution (eg debian/ubuntu), -
> one implementing whole ad-dc, as a complete thing, using their own set of libs,
> linked with heimdal. And a usual set of more client-side packages, with their own
> libraries, built against mit-krb5.  Or maybe some other combination also has its
> right to be, - for example, smbclient built with mit-krb5, the rest is heimdal.
> 
> An essential part of this is that the two sets (built against mit-krb5 and heimdal)
> do not share any internal libraries, each has its own libraries. This way, there's
> no "mix" of differently built samba, each build uses only its own libs, so there's
> no clash here.  They share the same smb.conf though.
> 
> So far, I've seen requests to build two versions of the server (again, with mit-krb5
> and with heimdal), - and I faced the same issues too.  This is because a regular AD
> member server is also good to have mit-krb5 support to integrate nicely into the auth
> infrastructure. While for ad-dc, it is less often used as "end-user" server.
> 
> So I can think of a separate samba-ad-dc binary package providing whole samba suite
> built against heimdal (maybe without smbclient and some other minor things), and
> samba "file server" binary package providing regular server not suitable to use as
> an ad-dc, but conflicting with samba-ad-dc, so it is not possible to install one
> together with another.
> 
> This approach also has another good side effect, to discourage usage of samba-ad-dc
> as a regular file server.
> 
> Or maybe the whole thing is moot now, and we just can provide regular samba built
> against mit-krb5 to work as a good AD-DC?  That would be the best solution IMHO.

I would be against a blended build against both MIT Kerberos and Heimdal
Kerberos in a distribution. It is not going to bring you anything good,
support wise.

Andreas and I have submitted a talk to SambaXP about MIT
Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where they
stand against each other and what are perspectives. In short, both have
unique features that do not exist in the other variant and both are
close to being production-ready. We want to change the status for MIT
Kerberos-based build from experimental to production. Effectively,
actual decision for a version shipped in a particular distribution would
need to be made by that distribution, of course.

Distributions need to take into account security releases, as Rowland
has pointed out as well. However, from my Fedora and RHEL experience,
this is not a problem with MIT Kerberos -- certainly not more than with
Heimdal. It is pretty much a coordination question and I believe we have
very good coordination on that front with MIT Kerberos and distribution
maintainers.

If I was in Samba AD support for production deployments, I'd probably
go with deploying DCs in a containerized image way to isolate completely
from the rest of the OS. There are few images already that provide this
setup: [1] was presented at SambaXP by Michael Adam and other folks now
from IBM Storage, [2] is older and also active one.

[1] https://github.com/samba-in-kubernetes/samba-container
[2] https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc

-- 
/ Alexander Bokovoy

