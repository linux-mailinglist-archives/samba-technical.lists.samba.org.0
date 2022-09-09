Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A655B2D54
	for <lists+samba-technical@lfdr.de>; Fri,  9 Sep 2022 06:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6x9ES48mmzR8BCsrydfDDY4TMlx9mkEa/K69diAWfjc=; b=3PQp0sHeG+DBWfMPtrhdCPysLP
	qwaD83qSVfPFOHGKXxkrHlu1HV1jxbFp+csz8Zb+/xrTdGGuN5rQjSkIfRSX3KKbN/Z70+Sae8Ggz
	YlBmgsDN8XqwdZfWaAFntU0qJMRytpeYmzJp1wCgUs6CaQunoOAkjMBtOzEZ4siZq2ebrkWEhQmti
	sm2/UinLKKa8Hdfk1RM+cjo0SPei77q+t3VPX1w99/8UCehfui2OuRtL786DylNmWJ+H4rDK/q3TI
	NUkd0LIPB1A581vjtgWJExqHIv8o7lQ/EwV+Ztnx27pHMDMh4dn2KHHZxnnS9FnxYVcvJhHH58xnW
	0fbmyw7w==;
Received: from ip6-localhost ([::1]:23520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWVWC-0003Zw-Jd; Fri, 09 Sep 2022 04:21:28 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:38793) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWVW6-0003Zn-GB
 for samba-technical@lists.samba.org; Fri, 09 Sep 2022 04:21:26 +0000
Received: by mail-qk1-x732.google.com with SMTP id x3so392380qkn.5
 for <samba-technical@lists.samba.org>; Thu, 08 Sep 2022 21:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=RxjjBVdnYKWGLPOaTY8jZVXRJKCSxDOTDIkcVRr37Ko=;
 b=E7xCQET+zEIEZd7Mmo0CJXl8VjrlAttJfQ3FRKeZTd80G41SO/mIGH9MxKCZ3gN13/
 Pfv5/fzE4Re7tEqgI1v6PVTBK2Dl1UyTxMemk/KoQFBTVil5I3VgTZY+XkZc+Sbd9vyi
 ohWJyzoF/OZf7Ql7/sOitmh0yArsesVoc572pBmThebyTc6wRzKwtz3g8fVUPpOb6Z8N
 uF0UZLlcCfmXlyB0MHM23NlG+LRN8ny+GGKNwUnyFPyHjKQuS6eN2JGgvS2jaO9dzPkW
 nAHz1aGzGnA25d4EVqvlWuxw3Y1Gd/LPxBoo11N9ExO3BtEDYaGF6qgN4iKa923UtwqI
 H4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=RxjjBVdnYKWGLPOaTY8jZVXRJKCSxDOTDIkcVRr37Ko=;
 b=IEUDoQTMhI15/ADEDkwwCCC3EsGpMEIaOE3nNPeJUvQCcQKZvQNwMSPA9F5j3GXNa3
 ZyBX0IJwtz+c8rimDw0jSA+WZ8P/Dvc27AeqRgEoJd5MuHg76olpY2rSVPEvA8fkX1g+
 gg2xMT9zoj6qKzU5U5MSxvgyl3MOlnqGZlD+Zy5ASf4tUWKmRqixdO9z/PCL6z60Q/sw
 hSLETX6JuoXiUaPpYTLg4P8X1e6HtYk1g/EgZOsB7QSHAJd95VNPjqzkcYIL3Lw9Eo3w
 F/nnERHSENaz61duIZ0QLKcbE3UYwW+mkWp8ni7VYI+PlUacpek3mke4dU8U5+3+771e
 r0tg==
X-Gm-Message-State: ACgBeo3SwQBJJlBsA2Nbb94lwggsHE+4O7n9pR/lVghD9DAT+BT5UgRT
 qSCh38F9gOctPEnesYZvyTZfZuG+YRkq03w1+KnYCKGLpWQBfw==
X-Google-Smtp-Source: AA6agR7wBpyiq0pnNyc/OJmj6xZKoJL1RbAPAN62x6svLQbxa4YnlCspdopWx1//uJFuJTRNz86TylnMgasZzf3HFEg=
X-Received: by 2002:a05:620a:170b:b0:6bb:83e2:e678 with SMTP id
 az11-20020a05620a170b00b006bb83e2e678mr8936350qkb.555.1662697279974; Thu, 08
 Sep 2022 21:21:19 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 9 Sep 2022 16:21:08 +1200
Message-ID: <CAHA-KoPFeH1S6ufMz2HLNjRmjrLMawbKkAw9qns0VEu3UDLYEQ@mail.gmail.com>
Subject: Using regcomp/regexec in code - are POSIX extended regular
 expressions available all archs?
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

I am looking at using these functions in source3/utils/testparm.c to check
network/netmask and IP address for use with lib/util/access.c
allow_access() parameters for dynamic DNS filters for the SAMBA_INTERNAL
dns server.

Are the Linux POSIX extended regular expressions available on all compile
targets?  (*BSD, Linux, SVr4, AIX, IBM i) etc?

Been around Linux since the early nineties.  Things would be easier if
Samba supported libpcre2, the Regexps for samba-tool testparm are a slam
dunk as they are basically Perl regular expressions.

Want to know before cutting code and getting it into master.

Best Regards,

Matt Grant
