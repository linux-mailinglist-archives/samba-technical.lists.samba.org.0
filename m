Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A541E4E74
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 21:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=s3sVNoySQl0QI8gRGXUHPP/W3oe2QMKg1vAdAnc3aGM=; b=sZzlyaQKylbhDyu5ZJe8FlPvGV
	DR5kHDEBvDmjcZdW36GR17Ip1bYH52AgCRegVco6FU5FpRrCrn6Pm1QLKiUyNgDt7iTVUhrKcU/k4
	mFckSt95xYcZ5LlUbAhfTQYKaywKAuCS330wxELy4W5+Is/UaPnWMRhWbqp13DXCsDSx6+5THClEa
	hRvhqYuGC3bfXndFi/4s9qobTdPlmUb3iEXjmlMQXXfFBQN5QqaxhOQ24nXFk/60xRmjkaKCjGxGD
	Lk5tfR1HLQm+EORRGcJTTqfNbse2AKVTfZRpsDR1Oecl2wVGxkyXevQxmFIpS3n1X1mdarZLTiYXf
	ZpJbYgsg==;
Received: from localhost ([::1]:18170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je1yh-0065Of-1n; Wed, 27 May 2020 19:44:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je1yZ-0065OX-Uw
 for samba-technical@lists.samba.org; Wed, 27 May 2020 19:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=s3sVNoySQl0QI8gRGXUHPP/W3oe2QMKg1vAdAnc3aGM=; b=VIIS0uaTYuXhigbGHXk3KsQJzV
 74mB/7hZNOnxAB9G6TNjVqG+2k6esz1VvrnJ+vtV9AanyDpadT2x+40P/4dF1E+eQEnQLNlk5P4wm
 33Blj/7qmL+MWBC1TkS+vKWBRXJciWi9Jdo0p8ecx+OaL2ZTMYSOukEHt3iw3dWI8rqT7KZUdoY5d
 eLc02wQekMcl73F26KqlSR58UOWg7bYE9mziwgxtnB8tV9Jfs03El/LwCm3M5j/MmFaIjlvrQSNmR
 eYibJfrWMaOECcDdqTjNpSkkFmXbxONFtYnP+ebGZPdT9XmbCHT1N13qUgihyltsLy2k17pYhBgW2
 K9m+CmN4+nviYyxsrORcQFOSbsA7UFbX6LOVep6E3kIFNX1cQFI6Yjjpxv9kXAwqxJrrPw8lgK0Nk
 nVbenYacGdfBXV2jutIMt0op4jxt7sFLXIXD7KAS0cazxGljLyIGy/lLwSQH0FlQ25SIAKd6uvG8n
 Osocg154mRw4tD/Hg77Chgjw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je1yV-0002As-Rk; Wed, 27 May 2020 19:44:28 +0000
Date: Wed, 27 May 2020 22:44:25 +0300
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Kerberos features talk at sambaxp
Message-ID: <20200527194425.GL5779@onega.vda.li>
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
 <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 27 touko 2020, Stefan Metzmacher via samba-technical wrote:
> Hi Isaac,
> 
> > Thanks for the talk was great, can't wait for the slides :)
> 
> Thanks! I'm sorry not to finish in time:-(
> 
> I may be able to complete the recording to the end for the archives.
> 
> StefanMetzmacher_sambaxp2020_Modern_Kerberos-rev0-compact.pdf
> can be found under:
> > https://www.samba.org/~metze/presentations/2020/SambaXP/
> 
> Also checkout the latest wireshark!
> > I don't recall a problem with the enterprise principals in old
> > S4U2Self padata, but I mostly test MIT client, I'll give it a try.
> 
> I'm also not 100% sure, but I thought you told me about it:-)
> 
> I think the difference is also the client principal in the referral
> tickets on the way back.

As part of our work on server referrals in FreeIPA, Isaac and I made a
tool that might be useful for these investigations:

https://pagure.io/freeipa/raw/master/f/daemons/ipa-kdb/ipa-print-pac.c

It uses GSSAPI and Samba's libndr to obtain tickets and print content of
a PAC. Obviously, it can be extended to print more ticket details if
needed.

It is able to acquire normal service tickets and S4U2Self ones, with
enterprise principals or not. We use it in FreeIPA tests in-realm and
for cross-realm operations.

To compile it on something like Fedora you can use the following line:

gcc -g -Wall -Werror -o print-pac -I/usr/include/samba-4.0 print-pac.c  -lgssapi_krb5 -lkrb5 -L/usr/lib64/samba -Wl,-rpath=/usr/lib64/samba -lndr-samba4 -lndr-krb5pac -lndr  -ltalloc -lsamba-util -lpopt

It is basically Samba libraries + Kerberos/GSSAPI + popt.

If people are interested, I can submit it to Samba upstream as well.


-- 
/ Alexander Bokovoy

