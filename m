Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8774A8AC
	for <lists+samba-technical@lfdr.de>; Tue, 18 Jun 2019 19:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=X+mlhhAWyK9C11Zm/YyEGHdugeqb5lUY9L5yu5ET6B4=; b=zyvkSSmRKvV2yX9oES9EapFM/c
	/vr/HxR1VuBLJxV2ptZEDfs/RT8Pkuml3jJ8RSpRHyZA5iUDn8lG9kxpIio5r/73O+bj3Y//ZjyFk
	KX8h6U8x1HLTdLvkLYt/FGyfg46NxsZgy/UD16AXkCmgaPY8USIPWgMAoAECcTvf1Q5rLnTlNt5X8
	mY1xXmNQQyXeN4R4872NNZB2kZ2dBnCbSFaEMwNfFgA6N/dcLuj7mfMzJeARFTL8xUeKHC+vFiL6q
	J+Wgo9DiBxy30Wk/j/fhVKmAiAesPCu5gUXaWfP1QS60TyJUAhkcmayIJA0YRjRuAyya/xKssVpvn
	Jsr8cUYQ==;
Received: from localhost ([::1]:49204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdI6S-0006YI-Dm; Tue, 18 Jun 2019 17:41:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56298) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdI6M-0006YB-SD
 for samba-technical@lists.samba.org; Tue, 18 Jun 2019 17:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=X+mlhhAWyK9C11Zm/YyEGHdugeqb5lUY9L5yu5ET6B4=; b=UWjtzrcgFOlY+se4UrJTHLtEt1
 AW6R3NyF9QeINo/iNTahZn6eC+rMPWQvp928xp3q0pyag6/OcwEcgVTJXFmzfoN/X+hRmQbizZOfs
 MscvfsR7QrBVM5n1z9qIlD+BLFGRNRuLsBbKQzbady4BwEkRRngyVsFJA1D1JRgjtwj0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdI6L-0004i7-VQ; Tue, 18 Jun 2019 17:40:58 +0000
Message-ID: <fd40b82df37deb9f81cd0934f6db7290bc345fbd.camel@samba.org>
Subject: Re: RFC: deprecate allocation roundup size
To: =?ISO-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>, 
 samba-technical@lists.samba.org
Date: Wed, 19 Jun 2019 05:40:53 +1200
In-Reply-To: <20190618144358.GA6800@sernet.de>
References: <20190618144358.GA6800@sernet.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-06-18 at 16:43 +0200, Björn JACKE via samba-technical
wrote:
> Hi,
> 
> I was debugging a problem with strict allocate = yes and our current default of
> "allocation roundup size", which is 1MB. While I understand that a large
> allocation roundup size was supposed to the a performance tuning for old SMB1
> clients, this has the side effect that with "strict allocate = yes" this makes
> even small files take at least 1MB on the disk, because smbd allocates that
> ammount of disk space which is given back by smb_roundup. This is an issue for
> some setups, because the extra ammount of needed disk space can be huge
> actually.
> 
> To work around the issue, I tested to remove the smb_roundup in places wherere
> disk space allocation is being done so that the allocation roundup size value
> is only used to announce this 1MB "block size" to the clients. I'm not sure if
> there can be other negative side effect thought if we announce that large block
> size but behave with the actual space allocation with out normal small block
> size.
> 
> As this performance trick is not needed for modern SMB clients any more, it
> might also be be better idea to just reset the value of "allocation roundup
> size" to 4k again, deprecate the option and remove it with one of the next
> releases completely to behave more windows standard conforming and to just cut
> off this source of irritation.

Certainly now is the time to be doing deprecation.  This option has had
other consequences, with some clients reporting massive 'in use' sizes
for short files, to the confusion of our users.

Deprecation is harmless, so we should do at least that, and changing
the default back is user-visible but at least recoverable (while the
option still exists).  Perhaps we should be fixing the bug above also,
that seems quite wrong, but it is a matter of resources (pardon the
pun).

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



