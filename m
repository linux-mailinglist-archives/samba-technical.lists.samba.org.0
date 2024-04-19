Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB38AA698
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 03:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5p142brCiFzAuZBxjaaY7qI9jriDNtx3PfAQuXC0SN8=; b=VGMB1D7Bcabisj7jbvP+JTqUrf
	+7RonBeqdZ5ugVv9/LqpXSSY+VwlWorkEG7l4Ak9vBTZJzakRFbFlQY5Kj2pVeMqV0p3na4Oq2wBL
	Tge8aRI3olf/RQh0mJ9TLauJCPAncl2ZFGVDI9McWkwbx+ZlSw2f/mzSDOUbHaEcQe8r+5wF6Bf99
	rVW/krdvMoPcSd69N03Qfw8f6ub1+vROQ6aXABtLawJa0VzM1ffPr6YXaUiUP8lKyCVBQ9xxBuVin
	QQGZEc70Slww0X6ZXn6BqH5rvZRIsIhmn90UF0h0ZvUxFodqiXLqgUMc+8Cy7gDvvbAYssPmCxv5z
	pMKFYqSw==;
Received: from ip6-localhost ([::1]:64830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxdFB-0057vL-I2; Fri, 19 Apr 2024 01:40:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50098) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxdF6-0057vD-Be
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 01:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=5p142brCiFzAuZBxjaaY7qI9jriDNtx3PfAQuXC0SN8=; b=YcBYI7LYmehu1bOjyy6FInoIik
 TaYDdRaZN2a4JEaMK+sKcYan553SjUlKdYj/SD8lnuQVM7t9ZuCh8LMiI/92u6mKYsPWlp5RqPE3y
 bv358pQjv0IT3eZFqNlhFr3n6xhyFL+udzEiI/GqPzCOkWDsp3igZoDlpo9qKvO3R+TXsvxvTwnOU
 /vhwTP16knysKnu0wpmGFdF7JODAcHRQA1tdcIBBM9fpdXwtdjuF0dPERb8rNOAsD0Q61Y2fd1Qvu
 JzQ6xqRprXHDuCMeZwgrEEqY3KPNM0qYPy9u3ceiJjgHF4SJbDyE01lsFoZPjm3rbrpghwa70R5Rz
 5i8cp+sMIeFerlKQ4YyX9DE/zMzWW/0DguMz74HvbETdvd1fBFUH4Uq3G+bfNBqV0xSJXHliRBWoQ
 Efk8ab+HpGwv1se33+COwYprLeEQwx4wS9gYwQGQFVhOBPrprzrBP3GcGSBKxwlFINoIAcOK6XBdi
 WPwxGETLFkmasyfaG4WlzouE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxdF1-0079qe-0p; Fri, 19 Apr 2024 01:40:39 +0000
Message-ID: <c7d80c1538db3a414636977314feba13871907ef.camel@samba.org>
Subject: Re: Missing protocol features that could help Linux
To: Steve French <smfrench@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Fri, 19 Apr 2024 13:40:34 +1200
In-Reply-To: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2024-04-18 at 15:21 -0500, Steve French via samba-technical
wrote:
> Was following up on a recent question about support for Linux features
> that are missing that could help us pass more xfstests
> 
> Looking at the standard fstests for Linux (xfstests that are skipped
> or fail for cifs.ko) to find 'features' that would help, perhaps
> extending the current POSIX Extensions or adding a couple of SMB3.1.1
> FSCTLs, I spotted a few obvious ones:
> 
>  1) renameat2 (RENAME_EXCHANGE) and renameat2(WHITEOUT)  2) FITRIM
> support 3) trusted namespace (perhaps xattr/EA extension) 4) attr
> namespace 5) deduplication 6) chattr -i 7) unshare (namespace command)
> 8) delayed allocation 9) dax 10) attr namespace security 11) fstrim
> 12) chattr +s 13) exchange range
> 
> Any thoughts on which of these which would be 'easy' for samba and/or
> ksmbd server to implement (e.g. as new fsctls)?

POSIX <-> POSIX locking over SMB is something I have a client trying to
get working with SMB3.

They have a use case where, as I understand it so far, the mapping of
POSIX fcntl() read and write locks to SMB locks isn't 1-1, because they
expect advisory locks, but SMB locks are mandatory as far as I read
it. 

They use cifs.ko and Samba, so it isn't about working with Windows, it
is about running Libreoffice on LInux against Samba. 

Andrew Bartlett



