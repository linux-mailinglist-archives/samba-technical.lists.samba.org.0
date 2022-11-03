Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B776173F7
	for <lists+samba-technical@lfdr.de>; Thu,  3 Nov 2022 03:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=OXfXNKGmOVOqWfPs+jZcf/wH53ypaXLa4pEcNzPFAbg=; b=Kopok2hw/DxExXQdsV4gTGkgrZ
	t04lTGHLmMOD7G7mXrB6x6rTHS4M3MGhV4AlL5Aitbefll9u/YljV4ARmlU81zACxvz09TFmsQhnz
	/CF/kap97KRfwteclPmoqn2ws4Egf8PmLcqKCoBTgb1xNnLx9fOt0lbyd0vj/uu/hy7/9kHLCbGoS
	UuPCrHCIvj+u4IMEV2KiGQzUys9x7xMOqaZ/OxjZipRgcZOP0TjDdfCB0V+sJrrX+qxW8/3yAxXSy
	SRhXPH3qtuxckK0f+df0RZaK2FzO/D5d3ngA1FqdiAj4Rg2VrwYz0Qon4AkpW17NEycnlr1SH4LOf
	7NUa+0xQ==;
Received: from ip6-localhost ([::1]:59958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqPXn-00ADcK-UC; Thu, 03 Nov 2022 02:01:24 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:54765) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqPXj-00ADcB-Jd
 for samba-technical@lists.samba.org; Thu, 03 Nov 2022 02:01:22 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4N2n6R43mZz4xP9;
 Thu,  3 Nov 2022 13:01:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1667440863;
 bh=OXfXNKGmOVOqWfPs+jZcf/wH53ypaXLa4pEcNzPFAbg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DFWXxVsb5q7a19yFmtaN89fbtb2jO9nNYzgqGbfRNv8E6F5bL8K1q3V5SVhA8p/0J
 cWdZxd89WHyfNPlBoeMHCgwSeCubTRplizrJ3/yTFNXxbwjoJfeqH4OJDS4cFLVKZI
 Lxl82/EivY7oHjnEtJMFDvz5Q2VV2VhccyQJe6xd3HtOD+fsvKxWdj2z5spni0Uj2m
 IC+EsJb/Ia2Ytiy/uHV0Kj9jrQQYN5HiMguVCvOpuSXBrUtBohenwMrmGL9nf1pI9/
 G/pKyT1Y0Gy1j5XMWQGNstz641nl1SVFSInwlvjQagN+p+3rPcSI83Iu2cykGraIqs
 mhRawFJ2iCtyg==
Date: Thu, 3 Nov 2022 13:01:02 +1100
To: samba-technical@lists.samba.org
Subject: Re: How to push to a non Samba Team member branch on gitlab ?
Message-ID: <20221103130102.675b7106@martins.ozlabs.org>
In-Reply-To: <Y2LxSR6Iv6Qwd0ub@jeremy-acer>
References: <Y2LRam/bPaaRWRjy@jeremy-acer> <Y2LR/7ytNMuNPxDV@jeremy-acer>
 <0939d282f53194402d6615485a7fc97716fc3b7b.camel@samba.org>
 <Y2LxSR6Iv6Qwd0ub@jeremy-acer>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2 Nov 2022 15:38:01 -0700, Jeremy Allison via samba-technical
<samba-technical@lists.samba.org> wrote:

> On a more humourous note, anyone wanting to learn git
> should *always* start here :-) :-) :-):
> 
> https://git-man-page-generator.lokaltog.net/

ROTFL

peace & happiness,
martin

