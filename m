Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DBC826E2
	for <lists+samba-technical@lfdr.de>; Mon, 24 Nov 2025 21:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=RCiY/tsuKelbe+ksfCqr7LjnKhvZHxR1ZCZRdK+dzJs=; b=RGw7jHwDdakLYYOyCJgKv9ew7l
	tJ8LpQqXYEwrBvseM9my+jbFuUxH3/49qgpWG7WYbRSHlIJnCJChilY+Pl4i3ejcz4nLhEh1lCLSf
	u5C7pgpJ04uMB79rAvyd8ne2UqUd8ywTsHlIwwlQqCRts7fbveuqqqbsEfUso9NaLWgJRXSUZtvXY
	8+Q7qpOxlVB61dd0Jj29pOWRhoy8GhNivX9nk9nKnxpxkGiFJh4S4zSuYyp8n1GUhu1DEMUuismBw
	rGpsfaNfO/VleGTof931OIQWYdLDPtLFDrcr0w/ocGieE6qxzqb2MrmZxXRWGM9mFqaJAGGAhxxzw
	fzl1BrAg==;
Received: from ip6-localhost ([::1]:29268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNdNs-00D1nq-Sx; Mon, 24 Nov 2025 20:42:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31328) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdNp-00D1nj-48
 for samba-technical@lists.samba.org; Mon, 24 Nov 2025 20:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=RCiY/tsuKelbe+ksfCqr7LjnKhvZHxR1ZCZRdK+dzJs=; b=YsYGjB5nHI4TTHV52xZobkd0RU
 sPl/BsyEkqFU1Rpjikh51rTqD8n+pFvmYX5Yj1jMkO7g5l2hnoprFkmPFZuYnRwJbuOKh4uROCH6Z
 WpLRs9exP4axfz8CbJuQCj5WNZhkrw6zyWQ2bCkudsXF6M0zfvF6EOXxaklOu+aFHKNRL+Eb+CufO
 Jv1IxbQW9JwmAvPTq8J0KGHOo6dmQahQHekrtSQakOutl+0B4XeSGg4YRE23fQauCTmMGF0REfKqd
 3ktK8/+EKmGu7ywfLZ6jYxCiAW/2FJdj0RL/u/O8UzuaJrD5h4WO6jmuRgsbFergftB3+YeY7izAh
 kCB0xzyss07vtdN/aG/L8lPpLIcjPT7aJq+U0wz76GFDGvgs3s+2w5cRosgqHZM/pa/j5UJY9w5P8
 NIQ141RWduSPEQfhFedgjXT/sphrCuiDk/8x4JBsMhgkzzJ/FJ8Hn727Ao3RTNmTpksNPEuXfDH8J
 7xkCSHSJ9hKMuFZ/RVgsnUnF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdNn-00FSVp-27; Mon, 24 Nov 2025 20:41:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
Date: Mon, 24 Nov 2025 21:41:43 +0100
Message-ID: <cover.1764016346.git.metze@samba.org>
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

here are some small cleanups for a problem Nanjae reported,
where two WARN_ON_ONCE(sc->status != ...) checks where triggered
by a Windows 11 client.

The patches should relax the checks if an error happened before,
they are intended for 6.18 final, as far as I can see the
problem was introduced during the 6.18 cycle only.

Before the first two were part of my smbdirect.ko patchset
and I'll post that patchset hopefully tomorrow as this patchset
should have one round via linux-next without the other patches
first.

I've done my typical testing between cifs.ko and ksmbd.ko using
siw and rxe. Namjae, please also test with your Windows 11 client.

Thanks!
metze

Stefan Metzmacher (4):
  smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
  smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
  smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
    recv_done() and smb_direct_cm_handler()
  smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
    recv_done() and smbd_conn_upcall()

 fs/smb/client/smbdirect.c                  | 28 ++++++------
 fs/smb/common/smbdirect/smbdirect_socket.h | 51 ++++++++++++++++++++++
 fs/smb/server/transport_rdma.c             | 22 ++++++----
 3 files changed, 80 insertions(+), 21 deletions(-)

-- 
2.43.0


