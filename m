Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 735171E4EAF
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 21:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=KZgkGq5YccywiEg6l8OAMK6h81v654KTdTBsmEOJ6EM=; b=Y4lkksi5oXUqpNQwKIh58GGtE/
	dr4UnL7tIPIgrfW2vd/8xr/ttDDI9r+E6Jwz+smrettvPyJlD1fBA6+j4N18UzK7ODfPpAcUQlaUf
	NCqWvdpV5y+FXGETKAQd2kxeUHIV68APp8AYh6kqe1t9RCsjXL22Hn9SYpeQgDWE5vT14UPgonrxR
	IH7zU6G4FdDYVY7oexXeMkbv9KLDZgHWrnBsfJmmXOB5m+u0amN6BeB6haGDNyI1CySlppzOZULg6
	NrxLlEDliiyYC1MgPqeHr46NUyJcORA1yBn3LkH+9Va5dDIlkq0rmLMUdI4iazUOb572pOrRg4JAb
	FhchXKWQ==;
Received: from localhost ([::1]:20366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je2AK-0065gx-4l; Wed, 27 May 2020 19:56:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je2AF-0065gq-C8
 for samba-technical@lists.samba.org; Wed, 27 May 2020 19:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=KZgkGq5YccywiEg6l8OAMK6h81v654KTdTBsmEOJ6EM=; b=AXh1L6cmmNhwS9TQ0XwTTfLrEn
 6bu7iR+Iux/CFmhOQtZy2CbVjorYvsM8BMt+xnOGlRNnP77zTOKIwdOmRAOMZdHiGt74IjgUmEhP6
 3neSu8kSbdu2IEo2mWf4nWoqbczM4GgDC1exHZvJTPvpc3/CikzOMd6ySPHrvxSAjBnczP7hXfPa/
 YbUAwDaWcff0gd5Twu+GKG1udFKrcXBfQh+S14WklInQ1Ok3Mi1bHOJ8d1vfDdqpodb0g11jgY+0k
 MFV4odJm0gBmHgxBUBotQRWG/oPobMFfFNlrXYj6KAm5kTM/BzFvJK57/Kb1nK8zFCgg5OpEivAvZ
 U51hMVIRA4icuMsEPjrTSWgl7VBQmssChiQ4O9jXWQchozWVOD2Poa/lZ6oYgGM6XM60MJFvq9OJh
 bpq5AGteifol0aa5ckv+MfeNS3yLToMfTqlDv5O3SbT3oWD8TXY9abx/e7OirhDElziDDSiH9ab2k
 jKZvB+zmuZ52ZUAk0+/agaQd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je2AC-0002KQ-Up; Wed, 27 May 2020 19:56:33 +0000
Date: Wed, 27 May 2020 22:56:31 +0300
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Kerberos features talk at sambaxp
Message-ID: <20200527195631.GM5779@onega.vda.li>
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
 <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
 <20200527194425.GL5779@onega.vda.li>
 <72637587-49b0-76b4-ab2e-81437fd03e1e@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72637587-49b0-76b4-ab2e-81437fd03e1e@samba.org>
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

On ke, 27 touko 2020, Stefan Metzmacher wrote:
> Am 27.05.20 um 21:44 schrieb Alexander Bokovoy:
> > On ke, 27 touko 2020, Stefan Metzmacher via samba-technical wrote:
> >> Hi Isaac,
> >>
> >>> Thanks for the talk was great, can't wait for the slides :)
> >>
> >> Thanks! I'm sorry not to finish in time:-(
> >>
> >> I may be able to complete the recording to the end for the archives.
> >>
> >> StefanMetzmacher_sambaxp2020_Modern_Kerberos-rev0-compact.pdf
> >> can be found under:
> >>> https://www.samba.org/~metze/presentations/2020/SambaXP/
> >>
> >> Also checkout the latest wireshark!
> >>> I don't recall a problem with the enterprise principals in old
> >>> S4U2Self padata, but I mostly test MIT client, I'll give it a try.
> >>
> >> I'm also not 100% sure, but I thought you told me about it:-)
> >>
> >> I think the difference is also the client principal in the referral
> >> tickets on the way back.
> > 
> > As part of our work on server referrals in FreeIPA, Isaac and I made a
> > tool that might be useful for these investigations:
> > 
> > https://pagure.io/freeipa/raw/master/f/daemons/ipa-kdb/ipa-print-pac.c
> > 
> > It uses GSSAPI and Samba's libndr to obtain tickets and print content of
> > a PAC. Obviously, it can be extended to print more ticket details if
> > needed.
> > 
> > It is able to acquire normal service tickets and S4U2Self ones, with
> > enterprise principals or not. We use it in FreeIPA tests in-realm and
> > for cross-realm operations.
> > 
> > To compile it on something like Fedora you can use the following line:
> > 
> > gcc -g -Wall -Werror -o print-pac -I/usr/include/samba-4.0 print-pac.c  -lgssapi_krb5 -lkrb5 -L/usr/lib64/samba -Wl,-rpath=/usr/lib64/samba -lndr-samba4 -lndr-krb5pac -lndr  -ltalloc -lsamba-util -lpopt
> > 
> > It is basically Samba libraries + Kerberos/GSSAPI + popt.
> > 
> > If people are interested, I can submit it to Samba upstream as well.
> 
> Isn't that what 'net ads kerberos pac dump' already does?

Partially. This does not require working Samba configuration on the
system which is useful if you want to test unrelated issues in a
Kerberos implementation.


-- 
/ Alexander Bokovoy

