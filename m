Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F07F3262F9B
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 16:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=8F3bjD4j3fn+2LwQs8yKiZ4gS9AtJ/Sk139/k0YTy6E=; b=CYN5CNX8kUxwzHVv/94gvrYTN0
	U1j4Br6rRb/GdnQBFht/tYPA1ysscCxWpYbe1FTRIR1Qy8EfN1OXGOL4zDx16dSYdL7jFZVlP/+eb
	zwPObEWv2k7CUz+Tbl/GrLUt+r61rPQ0PRnuncqlOAXIdHkmqmnm43/iAAGNFh1782+Biy6DbxJwa
	XgZF+iW8R3u0FbIRJxa/iPWUE+WcA7YMBLwWYyazOig3Y2R1YHnytCDAsfCJtqcDOYEHPNJK7m/mn
	WV+06Hpd+PX2EAl8phkQ6dWdcUbaC7VEBb1qTAOPCjlrR3KcQJQv8ciHRHHFC1A3T0c38yLIISLX7
	EfZrba8g==;
Received: from localhost ([::1]:31072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kG0qi-004mdm-Rb; Wed, 09 Sep 2020 14:13:24 +0000
Received: from mx2.suse.de ([195.135.220.15]:34446) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kG0qe-004mdf-Ij
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 14:13:22 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64A66B289;
 Wed,  9 Sep 2020 14:13:33 +0000 (UTC)
To: Shyam Prasad N <nspmangalore@gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
In-Reply-To: <CANT5p=qMHxq_L5RpXAixzrQztjMr8-P_aO4aPg5uqfPSLNUiTA@mail.gmail.com>
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
 <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
 <87eeo54q0i.fsf@suse.com>
 <CANT5p=rxp3iQMgxaM_mn3RE3B+zezWr3o8zpkFyWUR27CpeVCA@mail.gmail.com>
 <CANT5p=qMHxq_L5RpXAixzrQztjMr8-P_aO4aPg5uqfPSLNUiTA@mail.gmail.com>
Date: Wed, 09 Sep 2020 16:13:16 +0200
Message-ID: <874ko7vy0z.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shyam Prasad N <nspmangalore@gmail.com> writes:
> Thoughts?

You are reaching the limits of my poor understanding of this kerberos
stuff. What is the difference between keytab and credential cache?

So IIUC you are proposing 2 ways to go about it:

a) - do PAM login in mount.cifs (which in turns calls into sssd/winbind)
   - implement umount.cifs for PAM logoff
=20=20=20
b) - ignore PAM and winbind/sssd and do kinit in mount.cifs manually
   - would this requires umount.cifs as well?

I like (b) because it feels we have more control and don't require a big
external program like winbind *but* if (b) doesn't do the refreshing of
the tickets then the mount will always stop working after they
expire. This seems only useful for quick one-off mounting or
testing/debugging. Real end users will find it unreliable unless they
setup something like what winbind does essentially.

So ultimately, to me, (a) seems like the better choice. Let me know if I
misunderstood something.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

