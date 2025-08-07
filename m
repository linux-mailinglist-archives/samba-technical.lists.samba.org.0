Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 547CCB1DB60
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/C1CqhI10VUgF6eD/HMz/kLC6eN5I58KPzRJ9uSjIB4=; b=xWSMIYQpkL/cT8pyvPJku3/KP3
	3e7cx7mwYxhX+8Fd1WCvSo2pbTEBG+9srVlnS7vxZXXuYm/FeAoPr3fTY7oQIzehIlr+6Wx5FDXL4
	LxfDL8chMR8Z4GljZBEwQNVQtWUubRD2i0UQsRmi/zRkaOjzndAUq7yVybcQA5FGmZWyuALPJq0J/
	5cs4iS5g1+ofGFEKNAmCUUDnzOSWRLBOxvTWxKHfUQTrI0vzcaxoFuk+0gfLAP9INW75PyypPmbaj
	IcUGyJ4qZ1yw4T9ryKVntue4TezLMH2JqmgLgkZyw8gHccXiZfOWAQTKWncukCpAySzfYPC78Z+NX
	2AZuiNwg==;
Received: from ip6-localhost ([::1]:64742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk3ED-00EZU0-Oy; Thu, 07 Aug 2025 16:12:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27210) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3E9-00EZTt-2l
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/C1CqhI10VUgF6eD/HMz/kLC6eN5I58KPzRJ9uSjIB4=; b=BBnC9vREJtF8A40cGxhIiIKykI
 LX5E2Ek/Xu4flWRxGHuw0FB+onQFz7PgOWPqZr7cJ+8tOxIMjvR9j7UgUSOLudyXbTZxcd5bCqGUL
 wUBbfb52hhYx1SKGTjELz4webVBXHEjV9G+RMa99kVns57r0zehr/eEb23ZfivxxkZmziJm3ero6k
 VHAZwuSeSYuJAQkZVRWcZExdWF5OPc5nEOHBtavDKlV9PgU++HDT2jetKbhY2Hr1KRdl9fEtnb6MK
 Iv4qEwUq07ii2l2bywQms4coq2ZpGXYzoleRBqNn4MjERcvwtmizC78VbdX4xOLDtPCLQi/LbGCSB
 MrGxBj0WnV41uyovY4XqIUNAzdBeYcNhLj0PagPPrBiXxJd73DqvzN2xzbCKqoU+M2O7D9XF8nP7K
 rabkvdn2SyQnAAClwFvCGaOaDPMieN2HBy+jqLnoJTAK3NFHna41eNNXhDteQ3z6/ntyENqFBzWgU
 vyuXtboTSP79XMaAcFkfFITQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3E7-001cYo-2T; Thu, 07 Aug 2025 16:12:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 0/9] smb: client/smbdirect: connect bug fixes/cleanups and
 smbdirect_socket.status_wait
Date: Thu,  7 Aug 2025 18:12:10 +0200
Message-ID: <cover.1754582143.git.metze@samba.org>
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

This patchset focuses on the client side today.

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

I plan a lot more progress on the server side tomorrow
and hopefully finish the moving everything from
struct smb_direct_transport into struct smbdirect_socket.

I used the following xfstests as regression tests:
cifs/001 generic/001 generic/002 generic/005 generic/006 generic/007 generic/010 generic/011

Between cifs.ko against ksmbd.ko via siw.ko.

This is on top of the patches for the client I posted yesterday...

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

 fs/smb/client/smbdirect.c                  | 137 ++++++++++++++-------
 fs/smb/client/smbdirect.h                  |   8 --
 fs/smb/common/smbdirect/smbdirect_socket.h |  15 ++-
 3 files changed, 105 insertions(+), 55 deletions(-)

-- 
2.43.0


