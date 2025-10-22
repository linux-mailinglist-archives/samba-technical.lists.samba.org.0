Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A8BFA6CF
	for <lists+samba-technical@lfdr.de>; Wed, 22 Oct 2025 09:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bhABinivBrGBVX3EGWSfyWLUQAaX9P1OfxoW826NLdY=; b=Mjxu0Cl63BKQRjwB2OJSd/m446
	nN6CLoBkIyDb3l3U2A/DJiaiBg+wjwo6ygx2PVeykC1WJ1s7sX1q/QTNW+KW8RLgut1cxnzW8OX2l
	1r6UNQ7+rqNSW1gUYbTTuXcmFlUPxEyFecCDA9K6pPVyBaaSxpp6ddQNfcrSymNIUjvpBpc7wvxft
	S45vXZmRd8MzoY51MS5qzvX3haS1XUFsyf9uF5+GI5kWCp/Jc7Z6qqR5exuLgmx2SyZkFM27zdCal
	NpXEd//rbGGAIh9H2xpSXidqbd8bPuvAfAM4IkBnTs+aN2qVeeYkQpLjEYdgpLsRQuurC5CLmV27w
	p428tL7Q==;
Received: from ip6-localhost ([::1]:42292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vBSry-008U9c-Oz; Wed, 22 Oct 2025 07:02:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54968) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBSru-008U9V-CM
 for samba-technical@lists.samba.org; Wed, 22 Oct 2025 07:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=bhABinivBrGBVX3EGWSfyWLUQAaX9P1OfxoW826NLdY=; b=cZ7FnpH9r/p+RFZbEEZPV0ekzb
 E1iLcKEa/CdJKQJDQEVpHQvalJdezk9AVjlieRSe1GkT6lmyjeeSDxklrpNUDLkQv1hvZvwWJokGi
 +fLMO49JkYnR3Nd+Z4Cn7qhktlz7ksqJ+WWVzs8i1E2YY4JWUF6ngFLLhfeemnBKTjD6dlLyxA2u6
 5UAQD2mSmuFC2nBIUj8P9ihLgc3uj3OntG2i4N47niwLFAvVLcuxk77GEpMXJmp41ZywaF5YbU/Gd
 uHpcOwo6i5e8VGRLPPUDOlFXJ+PJwwGOUdtfEFA8z1+AudM9z8apQ8281jSXRELGEWQNkqmhdGBmQ
 Pdw+menUKkUAQZwSgz90OyI3+hz6+u09PEIsUD9COz0JDnLVsyfPVmenlv/un13uhzDkAtW/C2dAA
 ACbthIBzfxmFnnH4MspyjSZJ1DE08XL3yuUowiJi4/P5MSoqy+2vxpyawVqawfW/LyB8AFmx3OhaA
 Znft8ssxYlz2ApWTeJd/SOuV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBSrt-00ATax-1v; Wed, 22 Oct 2025 07:02:45 +0000
To: Thomas Spear <speeddymon@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: mount.cifs fails to negotiate AES-256-GCM but works when enforced
 via sysfs or modprobe options
Date: Wed, 22 Oct 2025 09:02:44 +0200
Message-ID: <5023741.vXUDI8C0e8@magrathea>
In-Reply-To: <CAH2r5mtCjCvYphEAWir9PtxWQUy51jiir2Lk8erubUetX8TAbQ@mail.gmail.com>
References: <CAEAsNvQmV=xFsU-4jn9zC2DYoAUjXTS3qcsGNe7XUZEEXg1cLg@mail.gmail.com>
 <CAH2r5mtCjCvYphEAWir9PtxWQUy51jiir2Lk8erubUetX8TAbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: linux-cifs@vger.kernel.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 21 October 2025 19:45:17 Central European Summer Time Steve French 
via samba-technical wrote:
> Good catch - this looks very important.
> 
> Do you remember if Samba support gcm256 signing?

We support AES-128-GMAC signing.

AES256-GCM is for encryption not signing.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



