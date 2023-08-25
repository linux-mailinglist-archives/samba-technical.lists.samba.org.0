Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F17788ECA
	for <lists+samba-technical@lfdr.de>; Fri, 25 Aug 2023 20:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=vs2Eoojs22wzHY596hu1H6ciSCEuekbBgrkuyMMfbYg=; b=OmPBaB73ellJDumzUsu8JdYYuy
	Lh9VZn9gXEJZKgTkdSURtoRaiEZyA+PJPeJtiI48lK6XjscCrZTsROvd7m/sPf60VCy1aYdrnAGj/
	tDrqi5ZQxtPTw/AjI/8ZhTzrJk6zHj2/FTDtuQgt+lb4KvKbKsQ0Iqa08HiKM+NufvTLxHZ+UBOaG
	9EubFoeVyocEXKx0FCR5zpiXn5itp+BF8D+zSrCgGOhM7K91AXqtl4DMTTp6hPT/Umf0gwQBR8mQw
	5Viz7ln4SeTtl3r3BjxnJP8JeK40VTG+ne8xPfY6hKT10EYnTIviIVMg50GSEqaCF0VI5J8OxTBrU
	Xu50vsqg==;
Received: from ip6-localhost ([::1]:60928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZbfd-00EUVO-Dx; Fri, 25 Aug 2023 18:36:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZbfW-00EUV9-Ml; Fri, 25 Aug 2023 18:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=vs2Eoojs22wzHY596hu1H6ciSCEuekbBgrkuyMMfbYg=; b=oOxCEjpXdC9upJXo17lP0nyfv/
 1mIS1xwd2cE6ML0F9TQgC1GL8uY1X7fbLYOXVjm9RmNV0eO4a6DxF9Po93raGmznAh0L04f68nuHN
 8RKM9XPwm7hgONt0NZTP6QgUmWYptWqoP5L22froGXIa8I7SpW1o5XvkpNQR8fT6TvHtnLbd5Fueg
 yuACbjty92SHNeXUsHg0pkrAOlX8qhfMwHYRXoD0oJKy9IRTORZbZQGCpSLginyE6ZzW35BpRph4R
 S2rm1f5Tusg6ET2ufJrNmDa7x+WIY5mAmq1HVEGO7KDoiv3Xop+OFpaaSNvq2vlTGhL/D3A2Czv8j
 /byxDik8ETThdf9LyDJzn58xFu/ECL9gFiVHpqbKqMocM7pPnmaBfxu/okOgUPPVg1Q91Yqh5CWUx
 6Fq7S46REHv0X1DC1Jo3zvu1l5baBQQKo13Ffv/z0XCG1mcDtxEV6SQwNjuIcCKqpnDCN2wpXhSUm
 7yP6FkGNdVXPdubuJrcE0q2p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qZbfV-009z1r-1d; Fri, 25 Aug 2023 18:36:25 +0000
Date: Fri, 25 Aug 2023 11:36:23 -0700
To: samba-technical@lists.samba.org
Subject: Running Samba in Google Cloud just got easier...
Message-ID: <ZOj0pya7VhaERx7U@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This:

https://cloud.google.com/blog/products/storage-data-transfer/cloud-storage-fuse-now-ga

is interesting. If anyone wants to try running Samba on
top of this on GCS I'd love to see the results !

Jeremy.

