Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C8AB89DA
	for <lists+samba-technical@lfdr.de>; Thu, 15 May 2025 16:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4d7AZj6ig/hmIuiflaHcwMCHGBz2otJDG4xkwsY5yA0=; b=bWq4LZBBiLS7g4OZ/K1N/VPIv4
	ufd+spN/WvQ8jxg4yGBWr42Il7gxNkAyGWn/2Vw0WnBC/ZIeKgkAomAx4xZYHZuOwMoZf2e2zV1fR
	BXQFRd7vcH8QXnN5SqbcUNv8cSOIdqxa+7fI6ideu9m5UWi3UDPkugstgmZq8VKD/LC7RQMTQUL8f
	ibkGtgGfDz4+tM+MnR8J2GTqKOTStt4MshGMEYWJiV8dkhJZEPwtGVlC4KIr2aA/XzWAhoRksCDSy
	aK19KOc4C/ocqdcQ3K8uFpwsLluIntWLTYS8+ovuF3QDSG/6RRaL1UlyAZ2aqjTZ46g5bffT0LAvM
	PVXrFPdw==;
Received: from ip6-localhost ([::1]:55634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uFZuk-003d4t-Gl; Thu, 15 May 2025 14:50:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45690) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFZuf-003d4m-Qz
 for samba-technical@lists.samba.org; Thu, 15 May 2025 14:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=4d7AZj6ig/hmIuiflaHcwMCHGBz2otJDG4xkwsY5yA0=; b=B0giIIQws0vXHLwvAw03C5lg5V
 3CvxyhPp8ReSqeFpEvuHY53WNZLHHjWoJx7uljMAvF9AZk3Ityyz8F6i8vAofTJNqMwXklpfYvPil
 7Zyb8KK2BrBnSifTRNZziDue5ZTIWQ5s0T317jigaPOIE7qLg77d9mLb+WdvadHklAws3IfxdFW+L
 0Ht0kgYVlXz320Eicmy+fKqu7mugtkSNFxQrd72cL0BDavYL7QQ15WgXj6n2LFrQ0ISsP8K9JvT1i
 v2YaQE8/h/QAn6wvZodvDG8dvN4LTK5wA0hJC/FHOxLbh1WYxxpNtyGRyeff+5RxzttHB6Rf4Hjk4
 Jy6bC7nn3+ogUyUtQ+8HsB4tXbiTYNZS4OeISOx34utmFts8MVrCc8pFaO1D6SsXM/CKkOun5/Wqy
 D8BjMS+wP5D2GHWFZ8QHS6Jq9PRMgN7Wl+vZzkXJigaIsGq4MUXl+5koZBqeUcFytem+C6lVOCoNX
 n0Yv8uGC169mss03RBR39ux0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFZuf-005i3L-0M for samba-technical@lists.samba.org;
 Thu, 15 May 2025 14:50:21 +0000
Date: Thu, 15 May 2025 15:50:18 +0100
To: samba-technical@lists.samba.org
Subject: Re: "netbios name" parameter
Message-ID: <20250515155018.072004cb@devstation.samdom.example.com>
In-Reply-To: <000101dbc59d$20eb9910$62c2cb30$@sapo.pt>
References: <00a801dbc59a$3f93d510$bebb7f30$@sapo.pt>
 <000101dbc59d$20eb9910$62c2cb30$@sapo.pt>
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

On Thu, 15 May 2025 14:27:38 +0100
miguel medalha via samba-technical <samba-technical@lists.samba.org>
wrote:

> > With the obsolescence of NetBIOS, maybe it's time, for the sake of
> > clarity and precision, to introduce a synonym like "short host
> > name" to the
> "netbios
> > name" parameter, which would eventually be phased out in the future.
> 
> > As it is now, the "netbios name" parameter is the only way to refer
> > to the short form of the host name, which doesn't seem to be very
> > accurate nowadays...
> 
> > Lots of other Samba parameters have synonyms, so why not this one?
> 
> In the same manner, for the sake of consistency, maybe the "workgroup"
> parameter could have a "domain name" synonym.

But then it really should be 'NetBIOS domain name' or 'pre-windows 2000
domain name.

Rowland
 


