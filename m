Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3768CCBA4
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2024 07:06:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tF6Kx9pd5yezFjqe2ydRSdeLmrzD4h4wUjjTdpDm3b4=; b=5okJHHCsOiXcR4WuIaMbTWvDcv
	lhqBr952qqt3yTp/W9PM0wA/ddFC3xprGNpwl9haV6BirBc2AnKDP9CihBxMLU2sSjqfOZo41NgFO
	lHFXsxaK5zYkWvSkOeJwBBAD4sgFKkLVK4UmxB3glj7b6N+wTn87QinyP0+awKvP5w4UarimZwN5Q
	NuF2o0z/Mko3VLfLZW7WJGS757on/MpxwpaRr0WlxJRWisYfKW3OcHgST3/hg7Kjxt6qsHQblP2o2
	NgZ17ig5YOonbhb75K79zJbwgUwKXQL5uJQsb712kCdZsTcuZQGA3tvPpy/sBaPdfGKri3G7WJTVl
	KNgKI7zA==;
Received: from ip6-localhost ([::1]:26680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sA0eR-009hH3-Lx; Thu, 23 May 2024 05:06:03 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:53634) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sA0eM-009hGu-L2
 for samba-technical@lists.samba.org; Thu, 23 May 2024 05:06:01 +0000
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6f6765226d0so1964279b3a.3
 for <samba-technical@lists.samba.org>; Wed, 22 May 2024 22:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716440755; x=1717045555; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tF6Kx9pd5yezFjqe2ydRSdeLmrzD4h4wUjjTdpDm3b4=;
 b=deoQvHNQCFMy+BCfUM019PbT7cHRAKcrdFC37YrsHKKzx140D/Z0cDSV0lpp3Sh1Wb
 DLfZFnhLaQy2HF2OlaG8QefCP5lUKdQUzr0vA2fcD5CEr+ouL1z2EXPp6bpAcvztohKo
 vUMdpTcaTNdm3wx8RU+lhtH37CcTL64s7uIAykSZ9pC7HNkMI3pVfdEEkmJtWaOvKPKL
 7SKBWZbePXuIlDNJvw6/W/mfFXubR2DMjJSuyVz1ue4Dofh6HfK2QCVbwnXr/ntahyPl
 Jjf2UC4T68tOsUHWMnV0reFP7MRorHN4ecDgRgkdDWKUy2k3tVBDEDIP+Z9ee8guc0Bc
 EbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716440755; x=1717045555;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tF6Kx9pd5yezFjqe2ydRSdeLmrzD4h4wUjjTdpDm3b4=;
 b=CpYo3qL4z3GbPvq7OMoCF1yEx2leXCd/oeNqGKS1Lvfnb9bfZlqFXGzFjF4beb/eSk
 jbDKlSOKTsIEurGJoGJLhavJYflUIKl4LadX2eMsvUUTA7CcTiOfFwHWPd/PaotSf65I
 xUALRtPe1Sg9Hm7pBuTMxxpC1jyXkKrNMfeJ3qG4ZOnKRkiGyulyPGqZzFCDbDu+egEO
 QJGwCdsvJQ769q0z7vfMJ2/5ZL6bqoGs/vbsKTRytSPw6uAsxP/M34KQ+g4z6KJ8pVw4
 51Bw5m5OftRGbUwBz4C+6kb73Rv9gNeJ1/phGFa2eMP1U9htd/srDRCNueokbuZxp3cz
 oPxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOqkPIwAck3zVEJtoi3S9DQyZgcBKQMYkuLlLFoX//L//3Y4EpC1ncfZ/wV56IUnPYkLiykrZ6aJkY50srCHR31FEjRhv3FNZi00xRug7i
X-Gm-Message-State: AOJu0YyCU5hcRd2ldKpM2fIS8gSEZJ/WOud65adgHQctGsbO++308NBt
 z+9wTsAFvL4qbUWnWEPThu/DDSGtQe95XCFGNv1D/CXIeJswLdBopXYH2GB6QqoB65RFkOfLuEg
 GTn9KyGOoKkwedwqjX+5rS0A0+2w=
X-Google-Smtp-Source: AGHT+IFRe5OLvE2qEd1txQbhRpgZX6pnqKA88zpPw43LzAOs3XU+9mDNc3wdNiZD7DmD3CjfhiCWyjpx/V3Q+cooRXY=
X-Received: by 2002:a05:6a21:8183:b0:1a3:df1d:deba with SMTP id
 adf61e73a8af0-1b1f88df90dmr3629546637.31.1716440755231; Wed, 22 May 2024
 22:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk> <20240523145420.5bf49110@echidna>
In-Reply-To: <20240523145420.5bf49110@echidna>
Date: Thu, 23 May 2024 15:05:43 +1000
Message-ID: <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
To: David Disseldorp <ddiss@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 23 May 2024 at 14:54, David Disseldorp <ddiss@samba.org> wrote:
>
> On Wed, 22 May 2024 11:36:25 +0100, David Howells wrote:
>
> > David Disseldorp <ddiss@samba.org> wrote:
> > > ...
> > > I think the best way to proceed here would be to capture traffic for the
> > > same workload against a Windows SMB server. This could be don't by using
> > > your cifs.ko workload or extending test_ioctl_sparse_qar_malformed().
> >
> > I don't have a windows server I can try.  Steve may be able to try that.
>
> I'll put it on my todo list for the next time I have a Windows VM
> sitting around. I do recall testing Samba alongside Windows when doing
> the initial implementation, but QAR is very FS block / allocation size
> specific, so 1:1 behaviour isn't straightforward (nor is it required by
> the FSCTL_QUERY_ALLOCATED_RANGES / FSCTL_SET_ZERO_DATA specs).

I recall talks with microsoft folks on the list about these as well
and I think they were problematic because ntfs and other windows
filesystems do not really have the same semantics at tha tlinux has.
I think one issue is that "set-zero" nothing more than a hint
and depending on phase-of-moon and how the server feels might
sometimes punch a hole,
might sometimes fill in a hole  or do a combination.
The behaviour was hinted could even differ from one run to the next on
the same server, because reasons.

There were other issues as well making the behavior unpredictable
becase one could not assume the alignment of blocks, or if it would
even be constant throughout the file.


It might be best to just ignore tests that fail in this area. And just
accept that some things, at best, is a best-effort approximation.
(as long as dataloss does not happen, of course. That is never acceptable)
At the end of the day it is a lot of guesswork and trying to fit a
square peg (unpredictable ntfs behavior) into a round hole (linux vfs
api).



>
> Cheers, David
>

