Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBA52EC2E0
	for <lists+samba-technical@lfdr.de>; Wed,  6 Jan 2021 19:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=BzfC6xrpEB3dzHmrKiQ5SP85T0n3HttLCPXlt0vDFPE=; b=CQOuhGlxZrz47R9DElUOzj0zgk
	JuMtp6p+4wcqC9ay0wDSzEsTta8JwV1UuaL59MSCXzpjyibEhI0YZDJWuB5oQmjs3GV0vt6rsgCsm
	eDSzYefhh4yFAOFvg8YcaoxNAOiRHUYwU+h1yZcxibSiO8Asfd2W5RvO/c7nG/kQoj6FYGExNwr8O
	KPrxrVauZRllHDtZTeYJyYR1uezVfz89Ib/6y4Py0DkqH9UAgqU7Xk68MeDf31gAxuJr59Q6Sf2dU
	Ay1qbfyTbiT6LAF3SEiNFFHAbubIKtrmvp95cx9bpDuRKTMhzKPcZfjD6cpoXPuLeAiYxH6OIwmkS
	1xcgSkCg==;
Received: from ip6-localhost ([::1]:29198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kxD6C-004ylU-O6; Wed, 06 Jan 2021 17:59:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60216) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kxD67-004ylN-GU
 for samba-technical@lists.samba.org; Wed, 06 Jan 2021 17:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=BzfC6xrpEB3dzHmrKiQ5SP85T0n3HttLCPXlt0vDFPE=; b=KWPsb0FiU4mMshzms9/OH7lS7k
 z+isx2N8XcCS0AfEbLXlRZ5rEWOZzYgothWDcdpN0YkekP9HjcQBXAwpJF9pA9DD1aYEnmY1xJraW
 bS1LTVY6Sv8q2j3009nAymdgAfwgHT9KPO0BQq1z2o2vO6nzMR9D/5T4cJvoVScup/4Bl7NDtk758
 h1Uzp7R7IVT/u63J5q8DbZt3pJwjoG0FUH/GdBxbecJJcnr9bMRAW4fk7AYtl/Jvdip4uSACFo494
 SLModGWUnOc/K4euetLekeD3wdhmxJJ2wVQ7gGkIb9pVcKPW83XdcXfj2sHck537+2rJTgvGFcqV4
 BY+4Bm3T9tjDUroQsPc3qTikfCyWWfUoym7rQvxZdDHPtpr9s30ncKaiVRGK7QXIt70cICHh9XCp9
 bWQxViDANOmcFp5yoqEBMKTyUH1Cbu62b6XZJaPbNXYdHuTOzyAK5qzI3uxbPfurNQEPxBweh3A87
 oWYajRf7xxLczB4WsReHwq5d;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kxD65-0000RX-PN
 for samba-technical@lists.samba.org; Wed, 06 Jan 2021 17:59:50 +0000
Date: Wed, 6 Jan 2021 09:59:47 -0800
To: samba-technical@lists.samba.org
Subject: SMB implementation in Web Assembly.
Message-ID: <20210106175947.GC513295@jeremy-acer>
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

Much though I hate to link to twitter,
with no source code released yet, I
just had to point out this:

https://twitter.com/SkelSec/status/1346517626026123268

(found on hacker news).

"For those who might not see what this is:
Fully working SMB protocol implementation is webassembly, it runs in your browser"

Amazing !

