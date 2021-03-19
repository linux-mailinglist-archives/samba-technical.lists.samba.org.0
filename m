Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB603423CA
	for <lists+samba-technical@lfdr.de>; Fri, 19 Mar 2021 18:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=0Hu/sFTU07BSPfslUR3noYn7pP1Ta+WCFBZfNTBzMrU=; b=HRT2g4cpkoe8msBAbZtUAkYKy+
	yhroP407+V39UdelvwcJ6O/G1GVeKmUZvieeFa/6iY98xImQzQ4kg49hjahDlB5EI6uR0DQTeKezy
	URjIDTsZqqcaoVfDYRn6KkcOl2IbPg6Fex5QqO1/pARSPpOXbVeIZdsGdGvV6AbfyAR7YwiUczyrp
	FKMftNwLzj9iVzwO/4OKh1desrmO5c/0cNezclS8prDAFPbcO0viNXsBGIkU7vy5NE6v8G1W12QPF
	/eyc7k8A/oaW3skjFgTm/Ja7Bf5x2ftDJ9BURBdZ94w89I8Fy6LJ12rSqBpAtoJM5NBTUoc8kAMbE
	1xQ7vE6A==;
Received: from ip6-localhost ([::1]:35508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lNJKZ-0063Kv-G7; Fri, 19 Mar 2021 17:54:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30946) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lNJKO-0063KS-7T; Fri, 19 Mar 2021 17:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=0Hu/sFTU07BSPfslUR3noYn7pP1Ta+WCFBZfNTBzMrU=; b=Yqqm0Nk9PE2PES1z80+xxM1fDH
 7xVOoYdQcf2xE5lI1Ywxh9+Q/DV22WzG5s6jZORIlduwK+OP5T922tBLBqtldtLe+xi5yozK6RsBD
 nXRNoLW+E9p2lSPVLM4nmr4hVK8heX1kIq3Ac3Epq47H6mceMdw0fud78X6hOu7VVM+w1DeE2gYJ+
 pqh0z1g5DG1eyXdeE5liBFW97ZCVxJ/54IdxIL0OXtBNU6UenpZcHqQp+IfwtVA7tjtMd1a//Vfuq
 8yMvepZWHF/rmFYykM2pa1q3nGOpIvh9XW0H1sN4YS0ivu/DEDl+NKVN+K93DRpqXifhZtsw0GTej
 8gwgDi1QQ84V0ryh/1uIXfGt5BC3t+W5/gZdOAVObOHRoAMqXV3GGHiPxLqCEF/O4R9FHXSRxdY/I
 TNY/p/oInFeTx4fmzC/ygk5DNeICix62RVHbTQ8hYUzQvjYxYC+2T1W/eQFBOzsnLUZZZaX4HnuKn
 5s5LecGBps6btTtMJ2Fvgi5c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lNJKM-0004zu-Nb; Fri, 19 Mar 2021 17:54:27 +0000
Date: Fri, 19 Mar 2021 10:54:22 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Ask not for whom the bell tolls HPUX. It tolls for thee..
Message-ID: <20210319175422.GC310511@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

OK, I've gotten approval and removed the code
for Tru64 UNIX in Samba (last supported release
2012).

Now I'd like to ask about a harder topic.

HPUX :-).

Wikipedia says:

https://en.wikipedia.org/wiki/HP-UX#Versions

"the latest revision being B.11.31.1805,[16] released in May 2018."

so it's still in support. Just. But it looks moribund
to me :-).

Is anyone still using it with Samba ? Does anyone
still care ?

Speak now or...

Jeremy.

