Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 915BAA83429
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 00:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=K3tqpFwotlUoBuBNXzOmYbqoL5by+YgGBst/pSlaevw=; b=o9wA/12yoNFIjCxAhhM0UO8yc6
	IpXOPYL643r4W701zPJ9DPJU3Ov+oPIkkWHzTrVe1iqzoXcYtN1lMgmnuVSqLqRY5Jyu8dTz3x5HI
	tZlvUy58LIi5rqd5VWojNmaxuDPCJF107Mr+2VapXo0eg24EGh6djxpUqmnVsVnAh2h73SFbDuYYt
	rvIXpdfEOalH1Iy46aAL8jJOvgjQpUPgpbdkbW1QT+534fJg4FIFqEbbnQuEszDY5l6jiaeJbDYz7
	DlOkOh40qdg3q3SgPsWhXu4URVHNBjIOW5m3Kl1/ujepQg58CGx1BQFqdgYlVxDFPXQVUciXa4YQh
	B0vTfFow==;
Received: from ip6-localhost ([::1]:46714 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2e97-0024t5-O1; Wed, 09 Apr 2025 22:43:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57432) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2e92-0024sx-HQ
 for samba-technical@lists.samba.org; Wed, 09 Apr 2025 22:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=K3tqpFwotlUoBuBNXzOmYbqoL5by+YgGBst/pSlaevw=; b=NjO+r+FQWxFBnBgGOfcc1VjSJ+
 /SLR7Umpai3G/2NUDqRlqaSiZoZWaq2anFL4jCt7axFqK2ia+Aaqo8gPLPWaC9RVmFGnGlpo4Igb1
 rZr896WAfWf70eRpeAMmdDKqmF01MTz49vE4+PZSMjrIWVsqa2R88FpUGcZGEbGobDaCgC74QoXdP
 s69WRT/hU6P1bIiQvVKb7eQ66ku0+TnnoR1oTR2J8DeqY1b8ijssNWRGwak28A261mE/ot5UuFW4G
 OuQL1b/0Vaca4SB6kiU26uQkdFz/9NdD5YaUGgMgIfkrjN8d6/4St59kKgbfW7R/fD4XSK+o2Fcdy
 YhMdu5DeRGWzMvegOAnUhVRvgwafHpEl738Tbgup+RAJmZ67MJNoqmkeHBIjx6lTcKVRAKHR6nZX6
 ZwlyKaSqrIIhPoNdz+OVo3qtiZWhbK1Vw2G4uTuQQ4zvrioVDd1D+P5lSBuYtSXS3G/efO2/vxf8e
 srV4atPZgG/15xskgBSTJnrs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2e8n-008z4R-1D; Wed, 09 Apr 2025 22:43:29 +0000
Date: Wed, 9 Apr 2025 15:43:25 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
Message-ID: <Z_b4DS3kOpbCI4pG@jeremy-HP-Z840-Workstation>
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>,
 "vl@samba.org" <vl@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Apr 09, 2025 at 08:18:22PM +0200, Ralph Boehme wrote:
>Hi folks,
>
>what should be the behavior with SMB3 POSIX when a POSIX client tries 
>to delete a file that has FILE_ATTRIBUTE_READONLY set?
>
>The major question that we must answer is, if this we would want to 
>allow for POSIX clients to ignore this in some way: either completely 
>ignore it on POSIX handles or first check if the handle has requested 
>and been granted WRITE_ATTRIBUTES access.
>
>Checking WRITE_ATTRIBUTES first means we would correctly honor 
>permissions and the client could have removed FILE_ATTRIBUTE_READONLY 
>anyway to then remove the file.
>
>Windows has some new bits FILE_DISPOSITION_IGNORE_READONLY_ATTRIBUTE 
>to handle this locally (!) and it seems to be doing it without 
>checking WRITE_ATTRIBUTES on the server.
>
><https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/2e860264-018a-47b3-8555-565a13b35a45>
>
>Thoughts?

Does Windows ever send FILE_DISPOSITION_IGNORE_READONLY_ATTRIBUTE over
the wire ? What happens if smbclient does ?

