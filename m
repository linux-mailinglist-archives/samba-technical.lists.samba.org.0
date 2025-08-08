Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC54B1EBE6
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 17:29:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZalSMCbOeBGEO/cAqDXW0q/oqDdJ/qs2lM9C6VfUB/w=; b=c2eJdwGnYuZC/imEOvkcBLnwuN
	8N8hBRXNUkNjyyNwJ3iz2udLwNbWgX8xKmz3fQcki0stpVu4qpOSGJs8+8uO+QqMe8MVux5bZDdqk
	xlhdQ4eHraAzo+/rOQuPo0poqfnLzrzFhfcsNR4GvLtni69AwzfaGPfXzXxWU1Dmu0ieMGMgmJfV3
	SHv9PZ3PEkrO2HvqzDaGvwaAWhPwaH9A/+pTVsqSRjRkf9zAgATcqYoUXLGYGVfZCLrZ9vi63FtkX
	1dexF6FbxAq/c/oPLWxxssfiyuuODZJR3iGa0aJGdNf8VSUpYO0XPD3kJqUnpaLf7B6M+Cr+G4DYR
	ImDai68Q==;
Received: from ip6-localhost ([::1]:63290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukP10-00EgD8-Bh; Fri, 08 Aug 2025 15:28:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15202) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP0w-00EgD1-JD
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 15:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZalSMCbOeBGEO/cAqDXW0q/oqDdJ/qs2lM9C6VfUB/w=; b=cwt6TqDZ8o5QXJmaaNuJxlJX4U
 4/sw0MSdKtrXzh3eRVyFqnuCV5eiyTxSOYp5KSDYAXRerwLxQne9V4qYd5X6xLKKhx4EoVP+7HjTg
 +9DTCRjAgs8agYNSt3lxAXlqJN/gxSxqlZ8vft8lRQZvyP1twRbjs0ggImd0/+CqZ3eNK7Z+lybn2
 gb+iIqrUfxU7tHzVZCcZbm6/spRz9jgRy2bX+EKx/YSh3KINt/MIXfaeF/e4mPm/G9ciBgt7IU5DM
 w2/hC2bflhvk95DlTANqvnJCIJY4ADcqdMNbsf4Zl4Ve8InC3J8hDnoQDV5kvrC9ntmWj7HoA8SCK
 BQu831tBLgZ/UoRkss+ZhK7+ZoRjoAcWyTYaxiRxWL421PKUC0DwAZvuv9dddVL3w0eka/EODl6bM
 aQiT10fJrtxxVsqT5X9/ijEAL7w0r0Zg6C5A+ufV9J1Thg6dKmDeHVprGlV+ISzNxZELAmpIFiIlv
 CXuxbYrd/McuL+ZuY9PLw4j6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP0v-001pNf-0g; Fri, 08 Aug 2025 15:28:13 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 0/9] smb: client/smbdirect: connect bug fixes/cleanups and
 smbdirect_socket.status_wait
Date: Fri,  8 Aug 2025 17:27:58 +0200
Message-ID: <cover.1754666549.git.metze@samba.org>
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

this is the next step towards a common smbdirect layer
between cifs.ko and ksmbd.ko, with the aim to provide
a socket layer for userspace usage at the end of the road.

This patchset focuses on the client side.

The first one is a fix for very long timeouts against
unreachable servers.

The others prepare the use of a single wait_queue for state
changes. This removes a lot of special handling during
the connect and negotiate phases.

The last two move the state_wait queue into the common
smbdirect_socket.status_wait.

For the server I have only a single patch that also
uses smbdirect_socket.status_wait, but I'm skipping
the server patches today.

I used the following xfstests as regression tests:
cifs/001 generic/001 generic/002 generic/005 generic/006 generic/007 generic/010 generic/011

Between cifs.ko against ksmbd.ko via siw.ko.

V2:
init_waitqueue_head(&info->status_wait); was moved
to the beginning so that it is correctly initialized
in smbd_create_id().

Stefan Metzmacher (9):
  smb: client: return an error if rdma_connect does not return within 5
    seconds
  smb: client: improve logging in smbd_conn_upcall()
  smb: client: don't call init_waitqueue_head(&info->conn_wait) twice in
    _smbd_get_connection
  smb: client: only use a single wait_queue to monitor smbdirect
    connection status
  smb: client/smbdirect: replace SMBDIRECT_SOCKET_CONNECTING with more
    detailed states
  smb: client: use status_wait and SMBDIRECT_SOCKET_NEGOTIATE_RUNNING
    for completion
  smb: client: use status_wait and
    SMBDIRECT_SOCKET_RESOLVE_{ADDR,ROUTE}_RUNNING for completion
  smb: smbdirect: introduce smbdirect_socket.status_wait
  smb: client: make use of smbdirect_socket.status_wait

 fs/smb/client/smbdirect.c                  | 138 ++++++++++++++-------
 fs/smb/client/smbdirect.h                  |   8 --
 fs/smb/common/smbdirect/smbdirect_socket.h |  15 ++-
 3 files changed, 106 insertions(+), 55 deletions(-)

-- 
2.43.0


