Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E8712A7D
	for <lists+samba-technical@lfdr.de>; Fri, 26 May 2023 18:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uqIoFMIY7OEFaW6f2FGifna72te3hfXFPX4W0JI1TNs=; b=JTA/5879ekbJc9ZIckpA0yFd8H
	CQn3Z5+IvNOGsj8I3LRuTkD4BARPE+cQcP78lte+2Loa1tBcKofMvOTPhObwNZrHh5EJXFZn87Cpm
	KGvZjCms3Ha/xe++AyZ4qdTTAtK1pOF5HfOYERxnHIkRpN9HR/JN/flpAYW/oeppJV93hTV2Ui00P
	b7/WFwpB+au+EIruIA5TuHonxNkGEAZ+NOgjTthO86+1Nh+FUrGLTLVcoNxwYfitaI+qSfLI6p+WD
	e7q4KrUQIRVgNSZCb6/cpZJEmb+ZrphtLFCZ8TPmKvn0UCZBBZO+0DHiGkzXdriD0TUxFwhxB9itv
	uhfUm0DQ==;
Received: from ip6-localhost ([::1]:28358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2aAv-00CXWl-52; Fri, 26 May 2023 16:20:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2aAn-00CXWc-FQ
 for samba-technical@lists.samba.org; Fri, 26 May 2023 16:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=uqIoFMIY7OEFaW6f2FGifna72te3hfXFPX4W0JI1TNs=; b=IT/dGbUPev7uoyivskuojS8X0j
 G5bKYCmPDdX68LPholSPBzCDCGnY3GthlMcya3UAFXFYCtJHcT5+IeJDyBQkut/OTzignZDVcpGUc
 sdKY/XxfREGFxBv9ZSMB8fTqNi9tdS9B0ZH22UwoWEmslI/0uy/lvNHIc16WKCESSojgWatXB9eqS
 VCmX3DR1tmfW90v/4xQTFavzMfh8+CoXOROn75mIydTOC1opCL1ZFPyC+p0ia9FdgfDb48sk9wC82
 cD+M5XgMVUeeS134xRgxPpWIvKESMKEKFc1KatU8RqYOVrTQ3IcUgbyRK73ESWodGafdEnU0x2aFI
 YH5XxpOkIWBSNnWX6qdcrsBj+Doq4/wA2hAjhks4xPNbWjFrqiGiCYene5rIZQZslRa69FuhIDoNw
 OAUWcBzwJ3JW5LBehsjmoGwpzkd3PZaO3JnYWx68tpgkL5kF0ah/TXlcQUjIb6nCpw8fifhffdU3Y
 VqHgXpyvbN8BjABxQeyLeUL6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q2aAk-00CU5v-Sn; Fri, 26 May 2023 16:20:11 +0000
Date: Fri, 26 May 2023 09:20:06 -0700
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Displaying streams as xattrs
Message-ID: <ZHDcNrzmxYMxHzfs@jeremy-rocky-laptop>
References: <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
 <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
 <CAN05THQyraiyQ9tV=iAbDiirWzPxqPq9rY4WsrnqavguJCEjgg@mail.gmail.com>
 <ZG0/YyAqqf0NqUuO@jeremy-rocky-laptop>
 <CAN05THSWHq-3bJ5+tzZ==j9uGFGfbALw0FoLVa9UyucaZ92bGQ@mail.gmail.com>
 <ZG+JqEwIdPHmHhVa@jeremy-rocky-laptop>
 <CAN05THQVK7O75NY8mts7J=n7V4PErWCNWkM8NfCNJTH7p=W2_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAN05THQVK7O75NY8mts7J=n7V4PErWCNWkM8NfCNJTH7p=W2_w@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 26, 2023 at 12:39:34PM +1000, ronnie sahlberg wrote:
>On Fri, 26 May 2023 at 02:15, Jeremy Allison <jra@samba.org> wrote:
>>
>> On Thu, May 25, 2023 at 08:57:18PM +1000, ronnie sahlberg via samba-technical wrote:
>> >On Wed, 24 May 2023 at 08:34, Jeremy Allison <jra@samba.org> wrote:
>> >>
>> >> ADS - "Just Say No !"
>> >
>> >I think that is a flawed argument.
>> >It only really means that the virus scanners are broken. So we tell
>> >the virus scanner folks to fix their software.
>> >Viruses hide inside all sort of files and metadata.
>> >There are viruses that hide inside JPEG files too and some of them
>> >even gain privilege escalations through carefully corrupted JPEG
>> >files.
>> >We fix the bugs in the parser, we don't "drop support for JPEG files".
>>
>> What is the use-case for ADS on Linux ? And don't say "Windows
>> compatibility" - stories about your mother's advice about
>> jumping off a cliff have meaning here :-).
>>
>> Give me an actual *need* for ADS on Linux that can't
>> be satified any other way before you start plumbing
>> this horror into the internal VFS code.
>
>I think it is too late to stop alternate data streams from entering
>the kernel. They, or their equivalents, are already part of the
>kernel.

Where ? Yes, they're in NTFS/SMB1-2-3/HFS because they have to be
for compatibility with other systems.

I don't see any Linux native filesystem that has these
things.

Please do not add them.

>This discussion is more about how to unify these things and provide an
>abstracted api that is common across all filesystems than each
>filesystem having a unique way to access them.
>Filesystems that have protocol support for this is NTFS (ADS), CIFS
>(ADS), NFS4 (named attributes) and HFS (forks). there could be more, I
>have not checked.
>These four are probably the four most common filesystems in use today
>(ignoring FAT) across all platforms so support for this type of
>feature is pretty much uniquous.
>
>I think what we want to do is to have a discussion across maintainers
>of all these filesystems and see if there is desire to work out a
>common API and featureset and how that API would look.
>How that API would work and what it would look like is a question
>worthy to discuss.

As is the question of whether this should be done at all.

>Solaris surfaced this feature via openat() but that is just one of
>many possible implementations. A separate userspace library that
>provides universal access to these streams using something else would
>work just as well. The discussion should be on how probe interest and
>work together to create a unified abstraction common across all
>filesystems. Then later work on what exactly the kernel API to access
>this would look like.
>
>For use cases? Something as trivial as storing an icon for use by
>graphical file managers would be a huge quality of life improvement.
>Even better if it would be compatible with how windows explorer stores
>those same icons.

GNOME works perfectly well without alternate data streams.

I don't see adding them would be a quality of life improvement,
and an extra morass of complexity for developers.

ADS is the motherlode of bad ideas for filesystems.

