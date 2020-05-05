Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 320741C568D
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 15:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=D17E/gP2PfDHKBX77gyJWBm4qaHrYJbrAzQSSzEA9jI=; b=dOj7Mt0mf7ScSO6nWkNEvsr6fm
	C2H6BaQYMec7nzu9AC8SmifrcRZryA8vH+QkwSmEOZ2YH57WP1BuGXEzIEE2wn9UlDCdZPnHHXJJe
	KaD7tpeBQFb5Vqid50+N8ggrGycFNZm0uE4X4skrddAvfmE+KiGCUU3ekvzEJHUSGFf/C/Ma2GXfQ
	OLjS0XNzzjnTW4hx2fhXmGX8mSR+ScQA0U1dnnNiUkTp9wrUcIhE/J5HzQs9zyqmLpmx7Fe/ERcCw
	JOeIOb/Qd6IeTHwwXFtyX1LRs3Y2DkbNRWXfnsS0WnK6HBdjovT4ByiRRxRS/Rp/DNRakDCP3n8L9
	lZLirr+g==;
Received: from localhost ([::1]:35984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVxR0-002p78-V7; Tue, 05 May 2020 13:16:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVxQu-002p71-CL
 for samba-technical@lists.samba.org; Tue, 05 May 2020 13:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=D17E/gP2PfDHKBX77gyJWBm4qaHrYJbrAzQSSzEA9jI=; b=TNkbMu0Hh6t8icxxjKPvHFiJjS
 n/ksv+uW5wURfQe/+6fIJ9CjsttLlDbU4uf70NsiL7gJq0zuODLcun2sx7FRCFqTGVLcwTJmV72p7
 3qdzT8iPWh6r3xLCCEQ2BkcW3vRsLohrlr1kFDa7ymZeq9o1MEL+g81ieK3jjOczKMV/tvYVpFrZR
 y3cEhsubk0zS3+I5H+urn8nllTZSGllNGoxCl31gtrmAUkESqlJnBVi5ZtEFTR7acChPbjNypSydn
 Ox/2qdlPSmnHeQFh4xbXxKJF6qf5YtaYdwQh3alCdev7oORRCfTETWQuQIgyIu1gEFEYveKcvIaY2
 edQQa/p1dk3IvuvTEP17K65yOIBqH89EuCeS7ZiFzOfO7Kx3JV8Mnkxg+/ALuXxU2QlV5L5rdrFhk
 YPBLlEHTO3suJWa7SDJDPQ1xl1vq9JEZ7/8cx68n2kUrHQrTy2V4IenLTT13href8bMtLMOnyO8LT
 QUtLa2XtRKWHvHjJjH7ejW9h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVxQt-00031x-Rw
 for samba-technical@lists.samba.org; Tue, 05 May 2020 13:16:23 +0000
To: samba-technical@lists.samba.org
Subject: Don't break your users: keep your API/ABI stable! - DevConf.CZ 2020
Date: Tue, 05 May 2020 15:16:19 +0200
Message-ID: <4652597.FDRxNn04ms@magrathea>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

you might know that I'm the maintainer of libssh.org. As we put libssh into 
RHEL we needed to keep the API/ABI stable and manage it. For this a colleague 
of mine, Anderson Sasaki, created a tool called abimap. He gave a great talk 
about it at devconf.cz

https://www.youtube.com/watch?v=tFuFO_bDke0


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



