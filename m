Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F86BFFB8
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 08:13:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ucCKHI82B/6ceYx2U1p88O8RO2zLlLVNO3BLfV52OP8=; b=T/462rVXz9gyCaIk9mAnyPvb3A
	aQOpUTgskNynT0Fw2L3exW0bu08Ricw7iJ/kAkZd98W1j5/EM0eu1PwEeSFHRiUbPSBN7H1qnXYs/
	I8r1kDWydrPJcJw5w5+cILt2PDrQb3Jf6G5wCqZCdgsbSSEE1ltUK1sS9DFGjB/FDXQH+ckRNqCWS
	ShKfPQAMGozVHVHG92SFmKguiO0869rVssP8jevSqS5fNIoMyOW/hQ8FANsrJehpcTgMEU+9iNxeg
	1plYfg4PU4pv4ajRm+NIdV49KBfYaOBITGN9OfLKgzUC6+hWOGZ83R86T5NYrpNgghj5aLpN4p3RB
	ra6yqXYQ==;
Received: from ip6-localhost ([::1]:42416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdnDk-003KZs-BV; Sun, 19 Mar 2023 07:12:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdnDb-003KZd-Ld; Sun, 19 Mar 2023 07:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ucCKHI82B/6ceYx2U1p88O8RO2zLlLVNO3BLfV52OP8=; b=zoH8v5KnR5oRf6lKW7SREo8knD
 a6qHraNUVLsz8cUpbOrzGltZRCmPDswswLwfFwYFiN6enPeasBlmCA1V9n8Tv/lRlgujnSAQpG2w+
 KJXJYvyPEgkxgQuc9gpn33GJpPb43tqxAKFktDoHpPvWkFB+SpbANN9mi5hgDPdXk3dskLIPIwK+V
 ZavU99rSNJeAMfaqcmwq74Li8XpoekGjpuKNFVYV1gNPExdfcujbYjFJUzj7O7419ona7nXF62UGE
 x4u6LUMGqMZ4JNscVSn8HDIF6YpjbLqMITeMSOIbGGUz0PvY2LBPIJFfjpcne16qL/mLM0sgS334P
 1JtkHGo44IuRdQ5TXhGxFUKTpeouKZ+O9DgIpUhOrT9zNxewR0BSgUVc2jaliZ1BgYBZXVVZS0ADU
 +bCZFiq08Jq5EWmtQxswJ21ChusQMhV64JkpOpSON1QMkL2BxRbAe/QHe6JkW8E/K4Ga2GwTWNsx5
 0DaLnSTP5pic277QVqJ6IvoF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdnDa-004Add-OR; Sun, 19 Mar 2023 07:12:38 +0000
Message-ID: <387a7efb-8e73-e5e4-b41f-656f81ce9918@samba.org>
Date: Sun, 19 Mar 2023 07:12:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: mit-krb5 and heimdal binaries
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
In-Reply-To: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>, samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 19/03/2023 06:12, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> I already asked a similar question before, but it keeps popping up in 
> different
> contexts and forms, and the more I use samba myself, the more often it 
> comes to
> me too, especially in context of using various security tokens for 
> auth.  And the
> more I think about all this, the more sane it looks to me.
> 
> The thing is: mit-krb5 has much better user-level support than heimdal. 
> But samba
> does not fully support mit-krb5 as an active directory domain 
> controller.  The
> AD-DC thing is server-side.
> 
> I can think of providing two builds of samba for a distribution (eg 
> debian/ubuntu), -
> one implementing whole ad-dc, as a complete thing, using their own set 
> of libs,
> linked with heimdal. And a usual set of more client-side packages, with 
> their own
> libraries, built against mit-krb5.  Or maybe some other combination also 
> has its
> right to be, - for example, smbclient built with mit-krb5, the rest is 
> heimdal.
> 
> An essential part of this is that the two sets (built against mit-krb5 
> and heimdal)
> do not share any internal libraries, each has its own libraries. This 
> way, there's
> no "mix" of differently built samba, each build uses only its own libs, 
> so there's
> no clash here.  They share the same smb.conf though.
> 
> So far, I've seen requests to build two versions of the server (again, 
> with mit-krb5
> and with heimdal), - and I faced the same issues too.  This is because a 
> regular AD
> member server is also good to have mit-krb5 support to integrate nicely 
> into the auth
> infrastructure. While for ad-dc, it is less often used as "end-user" 
> server.
> 
> So I can think of a separate samba-ad-dc binary package providing whole 
> samba suite
> built against heimdal (maybe without smbclient and some other minor 
> things), and
> samba "file server" binary package providing regular server not suitable 
> to use as
> an ad-dc, but conflicting with samba-ad-dc, so it is not possible to 
> install one
> together with another.
> 
> This approach also has another good side effect, to discourage usage of 
> samba-ad-dc
> as a regular file server.
> 
> Or maybe the whole thing is moot now, and we just can provide regular 
> samba built
> against mit-krb5 to work as a good AD-DC?  That would be the best 
> solution IMHO.
> 
> Thanks,
> 
> /mjt
> 

Please do not do this, you would only confuse people and they would try 
to use the wrong package, I suggest you stick to what Debian has been 
doing for the last 10 years at least.

For reasons why, see here:
https://lists.samba.org/archive/samba/2023-February/243970.html

Rowland

