Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5388339D79
	for <lists+samba-technical@lfdr.de>; Sat, 13 Mar 2021 10:59:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=FHpGHsC8Y8EtvU9sdNoJ6US5JywG8M8Fq3U3o1ZTqkQ=; b=ysP3l/VKz9/XyW3rz67/meg15Q
	Ij2qyqmFT/2htkeS0L+EUcssgZ6CZzodwMPEQd4lAORONBNK4sh+LmLXczhYFiMdvS4KUfzLt2nBb
	tZXs8fHzgpxKu2/Og+MMpZaJElJ2YrF6vZey6w/YVta5xTZi/mJduLVOwCK9Ut8k84xdWqVh0yT9D
	iN18Vtb3k1L7Jpv9IGpEE6CVJq5d7QrmvHNboVAzhkLLmR78TC5PJWebHZBcNlP7ELlt0yZQ5IgNh
	nYw6dHkfg8rRyB3RfqicWUvtLAUAsBQRNh/Bz3nS1p17oAq1E7otBrCrgR7wsFSrlyXVHwOrsolWc
	Q3u1elEA==;
Received: from ip6-localhost ([::1]:64278 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lL12I-005Ls3-Mr; Sat, 13 Mar 2021 09:58:18 +0000
Received: from plasma3.jpberlin.de ([80.241.56.76]:64107) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lL12E-005Lrw-2e
 for samba-technical@lists.samba.org; Sat, 13 Mar 2021 09:58:16 +0000
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de
 [91.198.250.172])
 by plasma.jpberlin.de (Postfix) with ESMTP id A4F9E10261A;
 Sat, 13 Mar 2021 10:40:44 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.76])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id 9-XasL6sgbwF; Sat, 13 Mar 2021 10:40:39 +0100 (CET)
Received: from [192.168.123.203] (p57843780.dip0.t-ipconnect.de
 [87.132.55.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id DE9C2102611
 for <samba-technical@lists.samba.org>; Sat, 13 Mar 2021 10:40:39 +0100 (CET)
To: samba-technical@lists.samba.org
Subject: Time for gpupdate
Message-ID: <b8305d58-1cc1-f38d-2abf-9252d5a679bf@kania-online.de>
Date: Sat, 13 Mar 2021 10:40:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *****
X-Rspamd-Score: 6.99 / 15.00 / 15.00
X-Rspamd-Queue-Id: A4F9E10261A
X-Rspamd-UID: a16263
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
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everybody,

I still trying Linux-client-GPOs. Now I read in the manpage of smb.conf:
---------------
The Group Policy update interval is defined as every 90 minutes, plus a
random offset between 0 and 30 minutes.
---------------
The wiki: https://wiki.samba.org/index.php/Group_Policy
says:
---------
Policies are enforced by winbind at a random interval between 90 and 120
seconds.
---------
What is the right time?

-- 
Stefan Kania
Landweg 13
25693 St. Michaelisdonn


Signieren jeder E-Mail hilft Spam zu reduzieren und schützt Ihre
Privatsphäre. Ein kostenfreies Zertifikat erhalten Sie unter
https://www.dgn.de/dgncert/index.html


