Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D4AB89B1
	for <lists+samba-technical@lfdr.de>; Thu, 15 May 2025 16:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JJfM8nFiWoccd/V6D90WFnzlzW/xnJkWL3VfI0apQ0g=; b=KF9tKT8tIn1uHcEbqk4FW028vF
	Ah4fHpGFnL/DqhugACC//GJFmGWUPYqvlH6M8xKPW2ALfxoksrfQHciNtKd/I2ApFnBGlAoeYwh4a
	ZPudh7uIBlW/xhloOxRCjqNdNTd7twpv4AkgT1z50dpKYf2B6XXAmS0voCUk1FOx/43SD2IE4B6Oz
	0pBHcHCwS4IJyzl54dlmOG/h1GQO1lMjLMsRZWiGmUr6kofzi8RmO9rrvyETPCDgEontCnt5tWpNM
	wt9AXnXjCXl1q3giIbCGbnbHT+TSGJe1EAPsDnuRs49G0nRzSwSYKqzL5cM9x60o6WcdIObjvam2T
	x9uj3KCg==;
Received: from ip6-localhost ([::1]:50540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uFZoa-003czX-7z; Thu, 15 May 2025 14:44:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54178) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFZoU-003czP-L5
 for samba-technical@lists.samba.org; Thu, 15 May 2025 14:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=JJfM8nFiWoccd/V6D90WFnzlzW/xnJkWL3VfI0apQ0g=; b=qqiC7bwA6+39h/gwVBgkCwNb1J
 E28ULhzAwHWTTq/2bmRvxolDhtv8eM0dlIqUlJBo1o4VT3zpljbSJEAUY2yKgT3OrYdnfq6zKSc0l
 rMIRDbqatDAgSbalZQPcCOvstDcprljvEyK/Q6/1X0cDdMFN8JOosDX8PoI87YBXF/E14blBbw7Is
 k9VLg1PFp9Xy14o4M7vA6UxcjuytSrBM6fZAuQ5pG0i8n++zD2dFm0tbx24nXEF+BcaUn9usX34WS
 TyF951SB+Il4x0X+Xt3AO/jbJjTsTlEH9tfpZVFUGnkDcGNe4+RuJ94dyY3scwoialmNm1UubT2iy
 a2IlvHALu81lEmGPJXXJHcBaCLpNoJ2oUF/ZgaWgKYJtgepkkA5beXqmHr1y47COX0Q2YcS5yefYt
 KNlyKAafwBXs1lmYS6h0PmGQdA2iFZaq3DkFgNcVUa8KrbwO9b4RlKW2gnUUokHK1nmYRdhXPIlKL
 OV968KO806Q1o3lLuglA1bf3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFZoT-005hw6-31 for samba-technical@lists.samba.org;
 Thu, 15 May 2025 14:43:58 +0000
Date: Thu, 15 May 2025 15:43:55 +0100
To: samba-technical@lists.samba.org
Subject: Re: "netbios name" parameter
Message-ID: <20250515154355.212243b9@devstation.samdom.example.com>
In-Reply-To: <00a801dbc59a$3f93d510$bebb7f30$@sapo.pt>
References: <00a801dbc59a$3f93d510$bebb7f30$@sapo.pt>
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
Reply-To: "samba@lists.samba.org" <samba@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 15 May 2025 14:07:01 +0100
miguel medalha via samba-technical <samba-technical@lists.samba.org>
wrote:

> 
> With the obsolescence of NetBIOS,

It isn't actually obsolete yet, NetBIOS is deprecated, there is
a difference and as much as Samba (and Microsoft) say not to use it,
there are people out there who are still using it.

> maybe it's time, for the sake of
> clarity and precision, to introduce a synonym like "short host name"
> to the "netbios name" parameter, which would eventually be phased out
> in the future.

Problem is, it would then have to be 'short hostname in uppercase'

> 
> As it is now, the "netbios name" parameter is the only way to refer
> to the short form of the host name, which doesn't seem to be very
> accurate nowadays...

I would hope that people would know what is meant by 'netbios name' and
you do not really need to actually set it in smb.conf, Samba will do it
for you.

> 
> Lots of other Samba parameters have synonyms, so why not this one?

In my opinion, mainly because there should be no reason for any
synonyms, they can lead to confusion, for instance, how many smb.conf
files have you seen with these two lines in a share:

read only = no
writeable = yes

They both mean the same and worse 'writeable' has its own synonym
'writable'

Rowland


