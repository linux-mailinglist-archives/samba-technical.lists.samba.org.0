Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B593C9D081
	for <lists+samba-technical@lfdr.de>; Tue, 02 Dec 2025 22:16:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gRXwD70uletccTPFHozrCt8PmOX7/Wh1rB8nIsb7Ri4=; b=dtuvZv+6NG4Jc86vdEHzOoSWhw
	vIdn3KCEiGIG/75hUxz+uUleqr2XNT2fNmyUQu78eZ0vBUsbObTlWVmnmOUZ0mCj5xZSFEJQrAkJu
	yfMZdzPfa3x3EnD9Gu/V6pICX5VfAQLoUQOPGZTGYi/8YK23i67Kn7ibwqm+ADKeKb8c2Qcqr+hpr
	sGsd+btYKD70AdtBOYskcr3qu4mgka9UQQ0qyJEsG/pznzPsOkVK/Wlza0p/iMdKSqvyueFGFSQzk
	iLdeXHY09k+TE+hRoIQjT6asxxEgSPH8MY1t0XUdk2aXEGpMt+pqxGhgSr/pSldn8F/vOV80DXELP
	hZXnuI0g==;
Received: from ip6-localhost ([::1]:50746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vQXiz-00FbHA-BO; Tue, 02 Dec 2025 21:15:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20374) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQXiu-00FbH3-Kn
 for samba-technical@lists.samba.org; Tue, 02 Dec 2025 21:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=gRXwD70uletccTPFHozrCt8PmOX7/Wh1rB8nIsb7Ri4=; b=PMrju5s6uFH8IXzK2fJUxJdTXT
 LXz/nhCKxuBi4myiATZvnDZptIOnWVWY2tkDb/aAL8kMJhxFs370QVp0byqUJxGlit1jAxYtQjfVo
 K4hiLpqfdUtuO1FUS2BhQmlbRlJ5TpI1XGYSx3juWxYd20Q0kATr08Dvsgte+N5x0NwyUBhWMempd
 OnF8c2K5OdpIUSQtiWzhf9oKwvEXwPvXlFIOWAKHQQ3fNoDmJbrwjzcorzZIscpMqENdimS1ghYaz
 tCxn3ts9dOEO73gEgopKUgEg6QYF0VVk20SCQG7o+yhKzQhVnrGMonbRbBauHWJ0w6OmABeO6vJRW
 ieV5wQFqDtUpFsAjs8TCAj2amvGEpT9t7FvnM8lA/BSQMU25btBPibFFW+JatflbETrtP9T2D+ukk
 AI7PSR+ToYdtzLgeQBR/gzxCqG4wV9cAhM482/8hE83K/QJvD/L4CP8p4agWDRCETcvB0s7YRu28Z
 M2L2/NYYvWw/wrLP2kUVPRZM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQXir-00GhsP-1M; Tue, 02 Dec 2025 21:15:45 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [RFC PATCH 0/4] smb:smbdirect/server: introduce
 smb_direct_negotiate_recv_work
Date: Tue,  2 Dec 2025 22:15:23 +0100
Message-ID: <cover.1764709225.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

here's a patchset that implements a better solution
to the problem that the initial recv completion might
arrive before the RDMA_CM_EVENT_ESTABLISHED event.

The last patch is not intended to be applied, but
it helps to see the event flow it generated,
see the commit message.

This is based on the 4 smbirect patches within
v6.19-rc-smb-fixes:

dc10cf1368af8cb816dcaa2502ba7d44fff20612
smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in recv_done() and smbd_conn_upcall()
425c32750b48956a6e156b6a4609d281ee471359
smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in recv_done() and smb_direct_cm_handler()
1adb2dab9727c5beaaf253f67bf4fc2c54ae70e7
smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
1f3fd108c5c5a9885c6c276a2489c49b60a6b90d
smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper

I've tested them on top of v6.18 (without the other patches
in v6.19-rc-smb-fixes).

Sadly there are still problems with Mellanox setups
as well as irdma (in iwarp mode). I'm trying to
prepare patches to debug this next.

Stefan Metzmacher (4):
  smb: smbdirect: introduce smbdirect_socket.connect.{lock,work}
  smb: server: initialize recv_io->cqe.done = recv_done just once
  smb: server: defer the initial recv completion logic to
    smb_direct_negotiate_recv_work()
  fs/smb/server/transport_rdma.c TMP DEBUG connect work

 fs/smb/common/smbdirect/smbdirect_socket.h |  12 +
 fs/smb/server/transport_rdma.c             | 321 +++++++++++++++++++--
 2 files changed, 304 insertions(+), 29 deletions(-)

-- 
2.43.0


