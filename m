Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B900C84168
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 09:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Hnz2480szv90NTNQyX8eDnXxOfZ1MVz6HO9CHwNLyTg=; b=WSk3V4F0jDu6ZZPisetIeP9WSS
	hZlg/EYEYkbfxy3RxzXRtdlnYDDTCGVF5x2slS/TBhid1SvI97NZNjB9xE3tYSpHFHNgc88EkgG7m
	QPNjoWULvNP5v97p+UqRX5ZKHJT5oyKdrT64cNQWOT5W9urv+FaMa4glCnAqmy0yPX0VlyEl1bb3a
	7JkhlBWA3VG0TcsQ8RGXeH/435E5pOwt4woiDssWWHT81l4PCAMT/VUtXgT4vgt/JjYuRsRCnAOQd
	RIqrRweOmjI7/AFsMxZceByvpKStHJ3bYutCB0IxyDNZ/iz45LeeFrZLCVsi4KKtCx1hKaBb1jx/r
	Uy3yATZw==;
Received: from ip6-localhost ([::1]:60038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNoqJ-00D3xq-Ue; Tue, 25 Nov 2025 08:56:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12214) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNoqD-00D3xg-7M
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 08:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Hnz2480szv90NTNQyX8eDnXxOfZ1MVz6HO9CHwNLyTg=; b=PlhipQ7sUTszguxY7kkZe5L03N
 H4GPLFZLxPBnMOSWVr6ORnKedqRzrjyYvhmdzcMYYHZ9thr/Z7tdMCGqGliUJQ10bYe5E0RnuES7h
 8GQDGIdDg0Lipv2xFMERRnRenKF5jb8peQIGy8BC3LcXDEiFslMAz4mcfoKjRt8E8AFbrBy5vfc+l
 wTB8PScSozxEr38SvBeJiGdz3JTDdzML11qUbchBE6U/UrjwFlhisgaTNXoM61mRp+V0iAh5FopW9
 UcB2xld4x4rOT3c9LTMl/Fgu3UYebzIjfen3nmBNcWEE90q/lwd02BFCr0U/SRuxP8qaRHi4oZuR+
 CfUn0oFHIX6FQLj8nR4EDprz2OXEz0pccfsKocwh3JaRaVaCxSaUTWez+YRMOxxLjnfU7r3GJD97v
 LTuZqvEaw7/WV0Ch/Ec7Hrc9bTPHzQB7OEZEQzdgHFNYGPlj93sfg10YBRt7CzEK/tF12McewD4uC
 cIbZk5pMNRaH+mCRlcd6eMot;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNoqB-00FYJH-0x; Tue, 25 Nov 2025 08:56:03 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
Date: Tue, 25 Nov 2025 09:55:53 +0100
Message-ID: <cover.1764060262.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, Paulo Alcantara <pc@manguebit.org>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

here are some small cleanups for a problem Nanjae reported,
where two WARN_ON_ONCE(sc->status != ...) checks where triggered
by a Windows 11 client.

The patches should relax the checks if an error happened before,
they are intended for 6.18 final, as far as I can see the
problem was introduced during the 6.18 cycle only.

Given that v1 of this patchset produced a very useful WARN_ONCE()
message, I'd really propose to keep this for 6.18, also for the
client where the actual problem may not exists, but if they
exist, it will be useful to have the more useful messages
in 6.16 final.

Thanks!
metze

v2: adjust for the case where the recv completion arrives before
    RDMA_CM_EVENT_ESTABLISHED and improve commit messages

Stefan Metzmacher (4):
  smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
  smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
  smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
    recv_done() and smb_direct_cm_handler()
  smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
    recv_done() and smbd_conn_upcall()

 fs/smb/client/smbdirect.c                  | 28 ++++++------
 fs/smb/common/smbdirect/smbdirect_socket.h | 51 ++++++++++++++++++++++
 fs/smb/server/transport_rdma.c             | 39 +++++++++++++----
 3 files changed, 97 insertions(+), 21 deletions(-)

-- 
2.43.0


