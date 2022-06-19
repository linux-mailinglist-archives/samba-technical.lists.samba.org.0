Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CACF550DA6
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jun 2022 01:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=HH8s6kbxHhKCbXze13/90v5myT1nG+U21aGjJvUj79k=; b=cZrzM+aBTZvN7Wbnk2GInNQMai
	/S8+oVHQG8ZqYKdzOoS8lTbw5uqFcd4W0J6ceuoe7/32J2HaO6MYC+sTCgxcCrRn0Kp+HpJjcU+FD
	XFqayvok6ylOJC11CdGmcisJ25yo//kQPLqtkRyHdIYEKbozV4rMxuG9968RvF6x1j9qXYwZRF9iN
	O9A6YwyR01NRR/s5ooPE85Lf5/w1wzUr63hPo8EMQ0Tsgf9N2S6rKTxaYO6Uc0HenA1ZcOcCUU4b+
	slRmqjOyRsy/uUJKys2rYl4z4i25DvRQ2uUt4h7TBT0e/Q27JkCrtCQmEX0SQZXW975ug4gXHZEsd
	O4AYYXag==;
Received: from ip6-localhost ([::1]:18648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o34aS-00BBJ0-VJ; Sun, 19 Jun 2022 23:44:13 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:39832) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o34aL-00BBIr-QO
 for samba-technical@lists.samba.org; Sun, 19 Jun 2022 23:44:09 +0000
Received: by mail-qk1-x72f.google.com with SMTP id 15so6825243qki.6
 for <samba-technical@lists.samba.org>; Sun, 19 Jun 2022 16:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=l0v6aczoqZuKGvZfMrzv0dl5HOjDYt9ye0hbgm+/IjY=;
 b=DJYyDB7lcAjtEEoKDMHhHm/CtxfvDq+sq3Mhcsl8udYJdS4RYYpB7vs+t044cx/RKz
 ZIJJKWfKiKbLuPcbWwzXP+CxUHh4T6CvBLoAvc5Q0DngGdmKBDTYSxK2vDy3cDa5QrdD
 50HNALKDscOGPIGXH+O6GXAyoAvlm4eI32opCk/hHxK+xw1+Es0U/ECqa07/usxhdZmH
 gBxE+zPh4NxRIZVbdU7p0OBhDWz0JBrqeR/4NKnBaEFvdoK99uTyNngUpuVuMbPszn4r
 HtDVZ1GEkQzDbBuIbyi2u5+YAg10pXKo+jtoFZeBEXA3FChNicw1QmL/VelxCq2YPdW/
 a9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=l0v6aczoqZuKGvZfMrzv0dl5HOjDYt9ye0hbgm+/IjY=;
 b=UFj9pkz1nMQKeDdmsYASiyIG/WRwcyUM1yzACbOyV3tvIB3ivpvzhml/PMww/O1UWf
 3f4tmBqgpIx+7gevlYryGI79kGv3pLX26wGugFu688B5lVtb5TMhwzKKxhuXWxVSv5aI
 Sn6E/whsASQFVO5hOCH6dK/8ukeOsn+1669ig81SsXX86R7r0a2giyzqWwwR7ivAZ6MX
 ygMPvBhxXUUwFvwTMUXKziluPj1q15fUoZZDqy8xQLVPmcvEWseRGj+vgHxmSegs0zQw
 P3M3eQJ3+dTbo0hbOtMizskOOyrWiE8drpGacntKqRDnSxZGANNB6AzSDjbA8cnFZfsD
 N7HA==
X-Gm-Message-State: AJIora/6f/1HXi7URX9RYrUSYUMDJVNjNf//K4bfQqeGfUsli5Xjprxd
 qh55abePWbQPONQcPvmu1XvnOlhzy4vzscu0KnJ0nw==
X-Google-Smtp-Source: AGRyM1seBm6hp8nnxO8bVKCcklrLY/U0Lva5mJw+XYHD/QhiZqRaHbT/W7s+w/tf3Z+KBeTVs8S65OzJG7hZI2vIYn8=
X-Received: by 2002:a37:755:0:b0:6a6:a7e6:fa8a with SMTP id
 82-20020a370755000000b006a6a7e6fa8amr14743502qkh.344.1655682242720; Sun, 19
 Jun 2022 16:44:02 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 20 Jun 2022 11:43:51 +1200
Message-ID: <CAHA-KoPYFfqJ0Yk_B92i7iVq09KBnmWqHw71-gzcYN9vcaydMQ@mail.gmail.com>
Subject: How to write unit tests for dns-updates-allow-deny
To: Uri Simchoni <uri@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
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

Have a draft merge request up at:

https://gitlab.com/samba-team/samba/-/merge_requests/2271

I am looking for someone to help me get the unit tests written for merging
into Samba 4.17 please. (Uri Simchoni, are you available again please?)

This has been around for some time, but I have finally got everything else
to the point where I can get this done.

Main issue is that I need to be able to do DNS requests from different
source addresses into the SAMBA_INTERNAL DNS server in the test hook up.
Currently python/samba/tests/dns_forwarder.py only does them from 127.0.0.1
or ::1.  Multiple sources are needed as the Samba test framework can only
use a single smb.conf for a whole test run (as far as I understand it).

How can we get:

1) multiple 192.168.x.x and IPv6 ULA addresses set up in the test framework?

2) Create DNS requests from these addresses (probably simple once 1) is
done)?

Comments please.

Thank you!

Matt Grant
Debian Developer
