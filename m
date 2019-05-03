Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id A204212834
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 08:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7h6eVmRKfWRQL+7JPGUaLchfHnHKRx/SXQvt89LErcs=; b=v4FOE/gxZiYYj1zaXIJNSrKymI
	HzqrpwuMul6d4lkDft8uR78cr3zBLcZjwmL2dEKppS0hrtc5trL79rB5nMNzWicilB/XOgrrELa0S
	lzZT4xb6WWbih++Mwjaat+wR811iCe3+d7p5+cbjyjXZgp3CvCe1R6fsVlYQiRCyC4itsTVLBwPw6
	iUAWdX8MPGnvFZC82kJ6b+IVndJi5uAEx+TpjyNcZ2KnDRaN1m6C2+tVKI89HlMUonextJkNfZaC5
	Ibw8orGwZVYGrc1p4PRx99cBh6LwIE/hUiGXwzKHQk72leltlLThtx+5PW5q7TeYQ4mwFjSIyk87/
	8spksM5A==;
Received: from localhost ([::1]:19770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMS6p-002AtS-Ku; Fri, 03 May 2019 06:55:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:38252) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMS6h-002AtL-6Y
 for samba-technical@lists.samba.org; Fri, 03 May 2019 06:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=7h6eVmRKfWRQL+7JPGUaLchfHnHKRx/SXQvt89LErcs=; b=VyG1QE7DaIdlQXhZxbLhsjHIs6
 XKarpKBWQ9Iam7tuBlybZiEA6U1IdJyADjulBuTfa/ti1No8wYH5nzxwynXmRsKIpSLk2wGXwh6K/
 AIXol7m2XylCACmh5ujgcYggtBtiOCGROlQN/xqKXVLlUOl55T6fi3lN/u/DxX6oy2Iw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMS6g-0005fo-0M; Fri, 03 May 2019 06:55:42 +0000
Date: Fri, 3 May 2019 09:55:38 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PROPOSAL] Release ldb with Samba on the 6-montly release cycle
Message-ID: <20190503065538.GA5460@onega.vda.li>
References: <1554694013.25595.6.camel@samba.org>
 <1554971819.4812.88.camel@samba.org>
 <3375324.H8Nz3ShdPD@magrathea.fritz.box>
 <1555011274.4812.106.camel@samba.org>
 <c06c2c6c113c64ddbd4974c8ca14355e94bd044a.camel@samba.org>
 <1556509193.25595.71.camel@samba.org>
 <b04df37b39526bedddcb95992542026836835038.camel@samba.org>
 <1556822561.2951.25.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556822561.2951.25.camel@samba.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Simo <simo@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 03 touko 2019, Andrew Bartlett via samba-technical wrote:
> > >   I've
> > > tested and the independent ldb build works from the Samba tarball.
> > > Can
> > > you spell out your specific concerns here a bit more?
> > If you are distributing ldb source (for example because they have to
> > given our license requires it) as a dependency you want to do just
> > that, of course people can make the tarball themselves but then you
> > risk having messy, unofficial tarballs around. 
> 
> Does anybody do that?
> 
> I'm serious, can you show me someone other than a linux distributor who
> already has to distribute Samba, who distributes ldb, or even a
> consumer other than sssd and the late openchange?
I have a bit of tangential answer but I think this is actually a valid
argument:

When a vendor has to deal with export compliance, even for opensource or
free software, you need to perform export compliance checks for each
software component. It means if ldb tarball is effectively samba
tarball, it is subject to addtional cryptography export compliance
checkes, at least for US-based companies.

Whether such vendor would be distributing ldb alone or with samba being
present in the same commercial product is irrelevant -- it is going to
amount to additional work. Debian's opinion on it is
https://www.debian.org/legal/cryptoinmain.en.html and it has this
particular point:

"Under the new US Regulations, not only the open source, but also the
compiled executable software derived from open source, is eligible for
export under the same conditions as the open source itself, provided
that the compiled executable is available without restriction and free
of charge. Unfortunately, if you include the compiled executable
software into a product that you distribute for a fee, then the
resulting product is subject to all of the rules that apply to
commercial software programs. For example, they must be submitted to BXA
and NSA for a one-time technical review, described above."

However, it is going to be a substantial effort to review libldb and
samba archives even if libldb archive is a copy of samba archive -- I
can only guess but at BXA/NSA sides this would amount to a separate
investigation in each case (and would force a vendor to file a tracking
record for libldb tarball shipping crypto implementations even if it is
not used anywhere inside of the complied code of libldb).

Basically, my personal opinion is that this situation is pushing more
unjustified work into hands of our downstream consumers (vendors). I'm
not talking about it on behalf of my employer, it is purely my own
opinion, but I can see this an additional overhead for some.


-- 
/ Alexander Bokovoy

