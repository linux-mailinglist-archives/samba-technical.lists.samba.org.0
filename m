Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA5621EA7
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 22:41:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1P8YlWNWRgixlUl9krUqyUqC73gXwDuEYr34PvmdSdo=; b=JE13zLeRLC/PO8dK3WH325yfFw
	8q8KEz+g9hV6XlYts57rWQ7DrKyfbU0Mzs3B6UnmAP76/Yi52dkF96OBAnV9Vp2G+Lu5TpS0axUqF
	T9bIMoyEB/cxkAzLZhNfEiM7LsM0S+qWthEOV29HxRy65hp1F7Ytis8ricLIAqmGcIpbZj8QdLOtB
	0+OJhO2E9g3pM7v36euAnxWVc8qFJylnenox6pALt/qc6sP6EkoXJvck5sSPr/JYpKQ/iSK/Fs46S
	fEm7t+VsBZMxmgEwiVyioeCDnrQSWpjx1FTPvwsUVfiMumVlYqHZQIpB0IHk8x16hIKUVBhqh60K+
	/zfNO4PA==;
Received: from ip6-localhost ([::1]:19068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osWKV-00BenZ-VC; Tue, 08 Nov 2022 21:40:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43970) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osWKJ-00BenQ-7R
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 21:40:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d20so14263866plr.10
 for <samba-technical@lists.samba.org>; Tue, 08 Nov 2022 13:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Nhgvn4jL7Hjmp+8VlJ8hyicO50k3oAXr8+WNDkgZPYo=;
 b=CoH1p/nwFnuiWQU3tinmKYdX9cm5t7bb9N10s92Sh7hn7GqN1Ki7zrfn1s5gQKPMd7
 Dfm+yg9gKCHxS7IcGMxxKJ31QgLnOmKH+O3by20D+cdOrqA5gz4ifNj0/Q5R8nXirmvC
 BXiySNWtjl/tP7RhFX8LenCPV1L/J1fHr8vqZ9kAQASHu5CG1I/nnd9fC9fPcNqukqa5
 mpO4Zbt4lP+vXD/RfoghuLVzQiVocrYon4qpUeco71DiDEd415kkWmnFphCbjzUu1kEO
 QHYJwCs3d/+FiBlMRyqnG4q1DGgB+4toc5YZNy3UUadoVKpNT+fDEuTVhZthhvUEcEnw
 HLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nhgvn4jL7Hjmp+8VlJ8hyicO50k3oAXr8+WNDkgZPYo=;
 b=tnkq6A2deFdPr2x0e/MgKt1bl2ZK4h+T4tDI5zPNbxhJKAQfvE66nKQ4GYepKJfL7B
 l8HahTGviBylL7RADtRel6NJGREmeBMHj93+oJ7LI1mb+A+Xzcx3AsqoEo+MvN6gOUUa
 chtWmaoxzDPFcMINHfDvkRGpNkrflPWCw1wLLpjLiV7CEto/CEH1/G0Rp+OyTwLEWrzB
 YmiuNFlK4CMNnPiGRoZR6zwVXM1Ox2r5m84+Ykgkx8RdIv9IPNd/w0yqRVgN/cFuRR8c
 Rdh7pe4vgL4gh5XbSxF03h0dYUngztjrxOuBb3uVwvkk3/aW/mP+qXGZzxxJwUxabtL3
 oYaA==
X-Gm-Message-State: ACrzQf1auOKgZZcnpS95E7eaxodWpSfAKbqFcO2QsS0jxFG+6SZbIw/n
 EhAiWPX6EZxgF1luUJg5C5jZAAbgX3kVFhn9gue7NQW+O6OjvQ==
X-Google-Smtp-Source: AMsMyM48WK9EwLRfa8oB+7MBV+9oGyggciM8Fpq2ZRNRwOV0JyEJKyi6tFpG0Eu9bvhB7GPNc+s/TGK1deVegRfgNlk=
X-Received: by 2002:a17:902:ecc1:b0:186:b57e:d229 with SMTP id
 a1-20020a170902ecc100b00186b57ed229mr58824270plh.167.1667943607245; Tue, 08
 Nov 2022 13:40:07 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 9 Nov 2022 10:39:57 +1300
Message-ID: <CAHA-KoNdxiY5wwibtWzYjRED9Wtn5ks485f9zSfJv4SZiuSXLQ@mail.gmail.com>
Subject: IPv6 resolution bugs (the IPv6 Brave New World)
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Items for immediate action:

   1. Recently I discovered bug #15226 which appears to affect the whole of
   the client side of the source4 tree.
   2. There is also a parallel problem over in source3
   in libcli/http/http_conn.c http_connect_send() where queries are only done
   for A records for dcerpc over http!  I have not run into this problem yet
   in my IPv6 ULA environment (Samba only on IPv6 ULA network)

This concerns Samba in an IPv6 dual stack environment, only working on IPv6
ULAs and ignoring ISP supplied PD prefixes, and RFC1918 set up for IPv4
NATed connectivity. My Samba AD DCs and file servers only listen on ULA IPs
via an smb.conf 'interfaces = lo fd14:BEEF:BEEF:BEEF:1::DEAD/64' statement
and there is only AAAA for the samba servers in SAMBA_INTERNAL DNS

Manifesto for MR 2271

People will say I am mad to not use RFC 1918 addresses for Samba, but there
are places where IPv6 ULA is seriously done such as Facebook, and other
large environments.  It does pay to do this, as we then actually find these
issues that exist in the Samba codebase and get it cleaned up.

You have to admit though that RFC1918 + IPv6 ISP PDs are becoming a common
environment for Samba to run in.

DNS 'Spam' from windows clients via dynamic DNS is becoming an
administrative problem as administrators prefer that internal traffic
happens ONLY on the RFC1918 or IPv6 ULA internal addressing.  Using the ISP
supplied IPv6 PD is a problem as it can CHANGE if the ISP reboots their
network concentrator back at their local 'office'/telephone exchange
potentially creating havoc at your own business as PCs  and printers
potentially fail to work...  We should endeavour to keep the ISP IPv6 PDs
out of the Samba/Windows environment address resolution.  Hence MR2271 as
the start to this for filtering dynamic DNS updates. (If servers are only
listening on RFC1918 or IPv6 ULA, and that is how Windows clients talk to
the servers, IPv6 ISP PD address changing becomes a non-issue)

I should also point out that these issues mostly disappear from DNS if the
DNS is ONLY updated for A AAAA and PTR from the DHCP server.  This set up
is also far more secure as it also prevents/contains  AD server spoofing.

Your thoughts please.

I do believe that items 1) and 2)  should be sorted out immediately as
important bugs as they involve obvious non-functionality.

Best Regards,

Matt Grant
