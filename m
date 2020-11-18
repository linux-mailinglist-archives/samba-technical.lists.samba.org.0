Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 178FF2B7446
	for <lists+samba-technical@lfdr.de>; Wed, 18 Nov 2020 03:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=uog92dFznf2bVadlbQ70HaF9VtBJRioq1sWYzyc7znU=; b=sWzdUyc+HGGC3gYY3xhrz7T9sc
	bhJyo+xAvwoewip6JGjUHeknEPIw8A9H4XnFsn4OKbWHt5ZQd6gKgyYc9s/d/o51aDFK9WoojhYMW
	LYPADHafxq02ywoamzrhL4BQ0RGebMfOTglbIw5ycCyoBBRSkIFb7mAtuutnB1AHAfRWlIHLUfiYu
	8iY4UWtLLHpkQTgrT2ElRUHAWDEejv6rMnjY/GCJaMFUk0QIIYVOmBXElOfrZekUG2Bi8m+UQt6ap
	GatZRnhWDrlxFd+1xbZTok5CYYNZL2IA5Q+OW+nlQGOyrEYpypeJYF1gRgY2aVkt+a9a6PNz70xEZ
	Y+Vliu4A==;
Received: from ip6-localhost ([::1]:62090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kfDRF-001lZh-N2; Wed, 18 Nov 2020 02:43:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18960) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kfDRA-001lZa-N4
 for samba-technical@lists.samba.org; Wed, 18 Nov 2020 02:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=uog92dFznf2bVadlbQ70HaF9VtBJRioq1sWYzyc7znU=; b=Ppw58g80z4VkKHaIS9ZNxMInal
 MDHfHTDZG7YfuIhkxOeKzYfc3PHe/WP5qum2LrChdlodE1US4Lwa1n8kaGOSBHr6rCh0Fp9zDTlU6
 PVG11oKnOWkrMzzmY7M9ds1zM+r6Gj4JRUOmW4/sZBmAeJeuMjlx/bFKvhNBqKLWfqCkyJLhqCN5x
 n3U4uAsOoaT/G8LoeZAks7kHqSaIHWBldzTAJFzefD4wNcPczoBpdDGCoIWvdRHtAPo/vKwUAc5rH
 g/xKbt+YtP3SzG4jRsfHN9sQMXGerAsyh9yB1EZGMBsuzqI2fEUl9u9W4x2s0UcNQOFlP7jBAohxu
 LeqIx+WANef6mhbYlyoierZdGipI9hVGhh2ILJcOYLlcT6birJfSPuxDCb4cvS9M2tC2MPTnZOtVu
 Ey0cYLC4Wxpf1KrhNWVvBERMr72Vm6IouOYut5pCSa8MTJXTIudx5i/bjzJ6PjwX/ixFzsMYqeau/
 FRPMKdJoEuYNacLLh0Aw7wiC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kfDR8-0007QB-0v; Wed, 18 Nov 2020 02:43:10 +0000
Message-ID: <d113270e79b2efd610eae0df5619cdd6155d7109.camel@samba.org>
Subject: SOCKET_WRAPPER_PCAP_FILE
To: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>
Date: Wed, 18 Nov 2020 15:43:04 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Since this commit (below), using SOCKET_WRAPPER_PCAP_FILE, which is
still documented in our wiki, has stopped working for me (I bisected to
this).

All I get is DNS traffic, not the other protocols. 

Can I get some new explanation on how to use it now?

I tried using what looks like the new method with
SOCKET_WRAPPER_PCAP_DIR but I couldn't get that to work on a first try
either.

Can you look into this and let me know what the new magic is so we can
get it into the wiki?

Thanks!

Andrew Bartlett

commit 7d1b560804b46fd6de83fa1b478d180a4184b5d3
Author: Stefan Metzmacher <metze@samba.org>
Date:   Thu Nov 14 17:36:36 2019 +0100

    selftest: create a pcap file for the environment setup
    
    Signed-off-by: Stefan Metzmacher <metze@samba.org>
    Reviewed-by: Andreas Schneider <asn@samba.org>

 selftest/target/Samba.pm | 3 +++
 1 file changed, 3 insertions(+)
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







