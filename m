Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AFBA32B3E
	for <lists+samba-technical@lfdr.de>; Wed, 12 Feb 2025 17:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BH/XkGxN7mMzX73bgA4AAPw1JElmOxb09kcTFkcHzyA=; b=ShQEUYtLqemNMhLV83OrKT4sDi
	mh3bgb3oQh+BXMwJwvJw+zkYYdUsMFKO/PEt6L4V+CQqW7PSloz9w3LOusFyGos+OVJlBryiQ4zbf
	EfWem9pyJm4FBIpcLS1x7uJ+zqd0c30xtjRjy/GkzgCxv+yETL++ogmbU4ho3+nc6ROLQd2LDYfaa
	QwMoPQer0HTVFsEp5ITOj5TmNDrjyUGI2oA8BlMsgLv2BtDRC/kyeg1NsLLUN8TQGJ0n1fggG7gQm
	8Jns8DGGrt3m8uWQEJGhd+zT3v9vAfoTXbVpm8QSt9UKJmAIdusppvPdmWsYKL+093xxf5aB5/6MR
	ieovg8yQ==;
Received: from ip6-localhost ([::1]:47966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tiFKx-00CH2W-PB; Wed, 12 Feb 2025 16:11:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63350) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiFKu-00CH2P-3S
 for samba-technical@lists.samba.org; Wed, 12 Feb 2025 16:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=BH/XkGxN7mMzX73bgA4AAPw1JElmOxb09kcTFkcHzyA=; b=rjWXsjKICSIFGU8rA11gwJIGyB
 eMIgPswKn1/JB8cuaX/lJwQzqNiGSceygQVSiTPi9fpiL5g+pcH1gUv8md3QL6+3/IEoVLBCiWTFZ
 eNnxUc6+iGbgrWj5exiFMxkhs6LnKKuA7bhi195ALU8whgwzwqwRn+Tm7ynTzc9Au9zYoDE3kM2g/
 4Szwb6/TQaQ+sVpMOY/SNS88y7lLYfYrTlI0P5lSDqSK57VXHKBTi15Yq5twrcXIuDlm6SbCNMQjt
 J7zVngETHaE9GXD003Cz7Nrw/HnQolnykEc9x3AZyT00GN2Jx0NZ73bqE34cvBExdc7oLmWXu7MEm
 s4cZ8F9Nvag7vpY/lh/TWA2oq9r89b7OFZ87J+axdW3tjhYM/kGCZWfQHr7r01mqh4L++536Pv1mY
 zsD8Hs71eD4bmmzbTF6TfnFHu49eoekrlBfb4XqE3FzXVo2SrRf1L2Igc1WRbexnqjk0U1NqTddPE
 tMbCeg3rk0K3GcLOhMsC/f57;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiFKs-002EEI-2q for samba-technical@lists.samba.org;
 Wed, 12 Feb 2025 16:11:39 +0000
Date: Wed, 12 Feb 2025 16:11:36 +0000
To: samba-technical@lists.samba.org
Subject: Re: Reading >4kB xattrs (from ZFS) = input/output error
Message-ID: <20250212161136.5c2f5d22@devstation.samdom.example.com>
In-Reply-To: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
References: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
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
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 12 Feb 2025 16:38:40 +0100
"Peter B. via samba-technical" <samba-technical@lists.samba.org> wrote:

> Hi everyone :)
> 
> I've recently set a >40kB binary metadata as xattrs on ZFS, using 
> `setfattr` locally.
> Works fine, and I can read/write data like that without issues.
> 
> But when I try to access such "larger" xattrs over Samba using 
> `getfattr`, I get the following error:
> 
> `getfattr: bigdata.test: Input/output error`
> 
> I've tried increasing the log-level on the server's smb.conf, but I 
> couldn't make out relevant information telling me more about this.
> 
> 
> The server's running Samba packed from Ubuntu (18.04): 
> 2:4.7.6+dfsg~ubuntu-0ubuntu2.29
> 
> I know that version's ancient, but it's a stable (in-house)
> production server.

Ancient, well that is one word for it ;-)

Being 18.04, that will mean Samba 4.7.6 and the latest version of Samba
is 4.21.3, quite a difference, I would imagine that there is a similar
difference in ZOL packages.

Now your problem may be a bug somewhere, but who knows where ? What is
certain, if there is a bug, you have no chance of getting it fixed with
your current setup and you may find that your problem doesn't exist on
current packages.

Rowland


