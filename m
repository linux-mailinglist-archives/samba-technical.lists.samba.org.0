Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF45520C8
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jun 2022 17:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SGTGXgDU2CcEpZoche1uRqCaG1VbB7wAuS+0jDeWk0I=; b=OFu42ed+tnR+f3FiaHpy6HrFuW
	ish9z9v0Qi4Rt7LPsZE3GAp86XcpYQ+7ydzqnoH56krVtQdLfShPs4QZNfCXXSYPLK/vyGau/qZaM
	XxdVnStskiOfFm7SyZIGdv+QJ3ZY6STJwViNV0b8gJHV8uyR6HvLUwmcm7qC73u8yuSca4zppNI5g
	CaBAzXOrTvg7uxQeddXpWo0fnVmrpVgT3+04Znf+WDEKTMhJB0IzcV6wgS24ua6+/lV9176qRCUjz
	ldodnxPYlPJ654lp7gH4kBT5sZPQyoNxjMFLcdZx4GRW3DB5In6N2+9GCwLTWXtu3mwvAa8v999Cx
	D1HhGdTA==;
Received: from ip6-localhost ([::1]:40386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o3JI0-00BMW1-Gb; Mon, 20 Jun 2022 15:26:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o3JHw-00BMVs-0u
 for samba-technical@lists.samba.org; Mon, 20 Jun 2022 15:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=SGTGXgDU2CcEpZoche1uRqCaG1VbB7wAuS+0jDeWk0I=; b=pZau2Y13YRpb1gO4DuHpuZIxlp
 v7vd0dK3yoFKmwDb/s6RpcmHqEozjtSxxzoH+qa3DL23ojjM9cXY0Ml1+GWdmEGpxZsYm7ljFI4en
 jO3E330c2oRQ6qXU7Guz5sX2xl4hmVvF7yChkPW2e4hPFcxLZiw72dqoxufUAq3QUDxgbFQMhqnfS
 bhHyG9Q1Rzkx1Lun7k2zLAXuGd9vKtO+6noPISoNVBSsSU4Zt20Mf6LvLcUCtwvlXy19n1eELWpvy
 QwCqNy6Hum3riKiO6VRgK7IiPp3A4p1w59sNAK06ffg6gxRptbPUebBvgOdgiQJbjD2mrzBiGi+Ha
 FPeOJ9tfpfAb9CYHAQNTSNjQtJ9ZVGndAJ29bs/wY60CreqY+VTLnF47OFcjOOuyoR+lW9S7uSJ8C
 3/ouzbX8ZmwnVyLNqvpMsLHR1alxnkpAKvuj7KRpcW2bSVCt18DjfYoIKvA2weUI92S3jUT9/cMpz
 FRrO9BpaIGU3WSrRnhgqhLdX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o3JHt-000kDn-Hi; Mon, 20 Jun 2022 15:26:01 +0000
To: Uri Simchoni <uri@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: How to write unit tests for dns-updates-allow-deny
Date: Mon, 20 Jun 2022 17:26:00 +0200
Message-ID: <4199916.ejJDZkT8p0@magrathea>
In-Reply-To: <CAHA-KoPYFfqJ0Yk_B92i7iVq09KBnmWqHw71-gzcYN9vcaydMQ@mail.gmail.com>
References: <CAHA-KoPYFfqJ0Yk_B92i7iVq09KBnmWqHw71-gzcYN9vcaydMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, June 20, 2022 1:43:51 AM CEST Matt Grant via samba-technical wrote:
> Hi!
> 
> Have a draft merge request up at:
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/2271
> 
> I am looking for someone to help me get the unit tests written for merging
> into Samba 4.17 please. (Uri Simchoni, are you available again please?)
> 
> This has been around for some time, but I have finally got everything else
> to the point where I can get this done.
> 
> Main issue is that I need to be able to do DNS requests from different
> source addresses into the SAMBA_INTERNAL DNS server in the test hook up.
> Currently python/samba/tests/dns_forwarder.py only does them from 127.0.0.1
> or ::1.  Multiple sources are needed as the Samba test framework can only
> use a single smb.conf for a whole test run (as far as I understand it).
> 
> How can we get:
> 
> 1) multiple 192.168.x.x and IPv6 ULA addresses set up in the test framework?

The number of IP addresses is limited. The IP address used is determined by
SOCKET_WRAPPER_DEFAULT_IFACE.

If you change that variable, you will get a different IP address.

More details at:

https://gitlab.com/cwrap/socket_wrapper/-/blob/master/doc/socket_wrapper.
1.adoc

> 2) Create DNS requests from these addresses (probably simple once 1) is
> done)?

You can change the SOCKET_WRAPPER_DEFAULT_IFACE environment variable.


Note that several IP addresses are taken by different environments:

https://gitlab.com/samba-team/samba/-/blob/master/selftest/target/
Samba.pm#L596=


I hope that helps.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



