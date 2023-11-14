Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24F7EAD81
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 11:03:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oEXaGkqZc38m+cNktSahlS3D34vsixJifI4tkOmGk0M=; b=5oR7zQHlddR2pyuZECQ1A5ZRCT
	rBWfmwG6mYH0GWM9hwTNCnnCMHKIg4TPWqnc6OpZ0KO8/rHnK3cmVnA8viiSeiP1ipvgv+pDoe+Bx
	e0LHfrQ/fFJWyJH3ciSteUC31VO3hNxUTEBZ+NJyOJ2aMTuMGvdWdqo5aMI9qwL3Wkd1DU2UtBUd6
	RjaI1mf/fqxjbLNGUkXSWJpB0h1tmFILXpFLWoMNrmxylQcfK1wD9Jp09Vgmh3azfyv2ewB1vol0z
	xEjvit0S/8KUGBmkNscL4eN+Dcnedr8SYqzEqjuLIsMIq3jynggRoRRnClebMfId/i2+RebiPo4g8
	3vc9E6lg==;
Received: from ip6-localhost ([::1]:51650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2qGX-008Dur-F0; Tue, 14 Nov 2023 10:03:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59420) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2qGN-008DmC-Gl
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 10:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=oEXaGkqZc38m+cNktSahlS3D34vsixJifI4tkOmGk0M=; b=NHZI/lR2RYQzL89UlLGNM4NuNR
 kKeHk92uIAznj1tezu46Tj8Rh5E7KYACgxLwFmEIf52I7D43JSSGUYan7+lH95IMdNx1YUc0yn37m
 x6MF8r8jLn7q7o4oXT7e3cO42/SfiZvzOpNHgx9w2lI+LZ6oMKcud8Zfd4CCtftkdQE/qcw0EpRWo
 ry+9SEdBa99A0Dj5tQhig4/KlUj7TA8IQfHI/Xg7FqWTRmTKpD1BaU0k2E17N8kCDtW/ruQF6ZZH3
 D+Tq5fHvVbNYQrSI5r5SQr6Uif4veWMwSQeJfh/nlPHKKtxPKgvgov03ncECWvy2ob7Yw1oLGx61Y
 dsiXcRY8diEg/JJkHsv0IgKwJjEN0xIoi0/NgYmXvv6V/Ipd0tDDuEK0fIDpkbf4Urp21dnSiNR5u
 dNKUvIar4pXLKayWEUU25YaZhTdNa4DGBiBMJWNKW2AXFYkx1aY1yyULxDwokdVLlsKSSziUxqn5O
 yLqd7DlELIhkiym5tdt77Y9f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2qGM-0065fr-2U for samba-technical@lists.samba.org;
 Tue, 14 Nov 2023 10:03:18 +0000
Date: Tue, 14 Nov 2023 10:03:16 +0000
To: samba-technical@lists.samba.org
Subject: Re: [SMB3POSIX] File attributes
Message-ID: <20231114100316.3445208f@devstation.samdom.example.com>
In-Reply-To: <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 14 Nov 2023 19:30:43 +1000
ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
wrote:

> On Tue, 14 Nov 2023 at 19:16, Ralph Boehme via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > On 11/13/23 18:50, Jeremy Allison wrote:
> > > On Mon, Nov 13, 2023 at 12:28:18PM +0100, Ralph Boehme wrote:
> > >> We had support for file atttributes in the CIFS UNIX extensions,
> > >> this is currently not in the spec (or code) for SMB3 POSIX.
> > >>
> > >> Is this intentional? What is the reason?
> > >
> > > Do you mean the attributes listed by:
> > >
> > > man chattr.
> >
> > yes.
> >
> > > chattr - change file attributes on a Linux file system
> > >
> > > This was at the insitence of Steve as I recall.
> >
> > adding Steve to the loop.
> >
> > > We never implemented this.
> > >
> > > Might be done via a tunnelling ioctl ? Other thoughts ?
> >
> > well, it's a rabbit hole of its own and still seem to be rarely
> > used on Linux and the BSDs. It's not POSIX anyway so just declare
> > it out of scope for now?
> 
> Not to derail, but "chattr +i" is not a rabbithole. It is very much
> real. If you are going to set up and run bind locally on a
> systemd-resolved infected system
> you literally must use chattr +i to stop it from ruining your
> /etc/resolv.conf

Ah, no, in my opinion and experience, the best way to stop
systemd-resolved from altering /etc/resolv.conf, is to remove
systemd-resolved.

If you have to make a file immutable, then there are problems
elsewhere.

Rowland

> 
> >
> > The Linux interface is via ioctls so doing it over the wire via SMB2
> > IOCTLs looks like a good way forward allowing us to ignore this for
> > now and possibly add it later if there's demand and resources to
> > implement it.
> >
> > -slow
> 


