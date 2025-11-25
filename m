Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39470C8562D
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 15:22:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bYY3AOmGiKgcZTF7Mmtp25ETkgx4F0BmYP/mA7zw7/s=; b=vlAJAhG0nH7BqI2aKUj94aody5
	+CeY8aiQ+15riYeYburbH6AADa/kpCUeHXcp+3BVMilEVFtPn2ly74xVDAt1cWYqGirKyNp0M0msQ
	A0dCXqG9dope4cKzulibJFMoIn07Layh7ywQS5CGtXqE8+/DCzpmqvR/T5kAosDNbgRLLbjG2o/Kj
	kY9VlMejMLaQCX9SSbqxrP9pyKhjj2sGmlcSScVAJ96dvewOjn/57HtNIk18r5XJV8H2wqwPG8wBV
	TKfyo9C0UkYnrp5YkBXXoxZuK/IP/vXziLB2011kx9Q2lCIeYOLSJ/JbSc8D7NPc/yNvWKWFSzUeR
	F12VpCaw==;
Received: from ip6-localhost ([::1]:24578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNtvj-00D5a6-Cc; Tue, 25 Nov 2025 14:22:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31416) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNtve-00D5Zz-JV
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 14:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=bYY3AOmGiKgcZTF7Mmtp25ETkgx4F0BmYP/mA7zw7/s=; b=d3FYnf2DkbEhUgwZTwfkOc/9BQ
 AC9NBtFOv+24lfEAC0E5oY32VN+lcw4dQLdJfH6OOVrTcrto3Q32LQSIzDTijLCDnL6VcIFX9VKWy
 lCxM1qq6gQ6bcnbVkT3q60UnmIQG8siFs9BoBgZhUmYvLhIbKbDm8ZO78jrNUcCB924WisG0RnB5s
 XfMzpEd0zMe+S2agOPXs/OXZJ0avVhUMkpSTkD5Mb2RKJ8lt0uTemoTgu0WYgg+PgQA32AlbWq0cY
 kwLPRsJILf6BTqkuFXnll+w5+nKd70QJlSVf8gOAsMwtzaCifA6EgOuzCuK9NVwIfYZADujFGrHol
 HSkQsuUwBq1snhkRFba92Du774fWfnXHONDtaO0r8JOxRZJB+QKLIa3GXVF/1bMcTGEnZ7rMeNiFs
 +RxSXRoDxHQUguwOjBNm0efFjaSMZ68cCvtzILDvEJ8tQWvB7di5Kzs+qSF2KhbQtrHtSHBeUvMjX
 rACI2XawVLr6Fz/MDlxsJwo2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNtvd-00Fasw-0E; Tue, 25 Nov 2025 14:22:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
Date: Tue, 25 Nov 2025 15:21:50 +0100
Message-ID: <cover.1764080338.git.metze@samba.org>
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

v3: move __SMBDIRECT_SOCKET_DISCONNECT() defines before including
    smbdirect headers in order to avoid problems with the follow
    up changes for 6.19

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
 fs/smb/server/transport_rdma.c             | 40 +++++++++++++----
 3 files changed, 98 insertions(+), 21 deletions(-)

-- 
2.43.0


