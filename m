Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB042B8E6FF
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rz1x2p+kZcks6PcfkDJEI4VuC2ZiaeIdhVgUw0SbpIs=; b=WG7jXmQgJau2w4e4cCQwDcc785
	b9iTQj21xoy85ytaBR3hu3g86WQVOilTjYAr/X5w6uru0sqw0bFs28WcO+DV45KFLDY4lcgwMY82l
	4iCZ6hlxHMuyn6oHUYEAIdnOZPbpyiNvpWCzVYkV1Yzdw4Tl3sjJ8DG/UyZj8E8ZICv9uEm8KIFtI
	Q5rt8+sx8etw8ju7SOGR6CquM+oXoRJG4fL1QcqYUlCEeBSBswROaCU9/ORKnBYDxJ2mPq6FM/viP
	b+r7mR/M0TJN3t28YO9q0mYD3snJ7v46queJUyJE5OuNuJxeGJ3txsnyxK6WpWJEQIhkvvubz2h+k
	78M+NiNA==;
Received: from ip6-localhost ([::1]:51086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Rs8-004SwS-K9; Sun, 21 Sep 2025 21:45:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20616) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rs4-004SwL-MY
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=rz1x2p+kZcks6PcfkDJEI4VuC2ZiaeIdhVgUw0SbpIs=; b=ebYcaTkHtIGJxit7ELdsPFMTMD
 E/EfFXmfZBNAIDwkcCIuawdqz+l6KtWhw4cYT+b7D6QWH+wCGY5rY3vcwpUlOpRWWlzhsZHz4WstE
 RM6SJrzGeCFUniyEK/hEQobmwxM2GUmFlmcuXLx11Vu6cnKTIqkptp5Py6HMgyFLzQYFs+lDE8C+X
 boGjmtIQTC9hCuquBOS26ijA0tiN9o4D/lp5Xn5RACRx5aNoJhUCkrLVJRTZGkGyCaFM6Jc4WuJgZ
 jxf6Eyarv4ZQqYKlXjXUtKcO5Z3NNdnpDhyKUsl2CJ4RKFkh1I/j34js9M77LZN/6faFxSbyTI2gv
 swomwpIcBlSuJPjYgHhX7y2MHWQSblBkFAAf5F+VO9/cneCsAFPeU7PmBbbbjTbkBrBG4ZEMU+CiO
 0cP5tGNUtnBZPhNcnLltpuQoVZzyoKR8tjhDFHDESuN60F1RjZShfUDBtNlzTyF/OVAoVtEwkx99/
 Z/o9oJEgvtKgzsOI5zeb0S1c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rs3-005GM3-0U; Sun, 21 Sep 2025 21:45:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 00/18] smbdirect/client/server: improved error handling and
 other small improvements
Date: Sun, 21 Sep 2025 23:44:47 +0200
Message-ID: <cover.1758489988.git.metze@samba.org>
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

here are some patches basically on top of the other
smbdirect patches, which let us use common structures, see:
https://lore.kernel.org/linux-cifs/cover.1756139607.git.metze@samba.org/

They improve the error handling in all kind of situations,
we now consistently reset SMBDIRECT_SOCKET_CONNECTED on
the first error and wake up all waiters to notice
the state change.

We also disable all work consistently on error.

We consistently use spin_lock_irq{save,restore}() now.

There are also some improvements in order to make
further refactoring easier:
 - E.g. move ib_alloc_pd() and ib_dma_map_single() on the client.
 - On the server use ib_alloc_cq_any()
 - let smb_direct_flush_send_list() invalidate a remote key in
   the first message

Some of these are already in Steve's for-next-next branch.
I'll soon provide a branch that can replace for-next-next,
as some of these patches should be moved before some existing
patches, while dropping some of the patches from for-next-next.
So that we only have patches for 6.18 included, the rest will
be deferred to 6.19.

Stefan Metzmacher (18):
  smb: smbdirect/client: introduce SMBDIRECT_SOCKET_ERROR
  smb: smbdirect: let smbdirect_socket_init() initialize all
    [delayed_]work_structs as disabled
  smb: smbdirect: introduce smbdirect_socket.first_error
  smb: client: let smbd_disconnect_rdma_connection() set
    SMBDIRECT_SOCKET_ERROR...
  smb: client: fill in smbdirect_socket.first_error on error
  smb: client: let smbd_disconnect_rdma_connection() disable all work
    but disconnect_work
  smb: client: let smbd_{destroy,disconnect_rdma_{work,connection}}()
    wake up all wait queues
  smb: client: make consitent use of spin_lock_irq{save,restore}() in
    smbdirect.c
  smb: client: allocate smbdirect workqueue at the beginning of
    _smbd_get_connection()
  smb: client: defer calling ib_alloc_pd() after we are connected
  smb: client: let smbd_post_send_iter() call ib_dma_map_single() for
    the header first
  smb: server: let smb_direct_disconnect_rdma_connection() set
    SMBDIRECT_SOCKET_ERROR...
  smb: server: fill in smbdirect_socket.first_error on error
  smb: server: let smb_direct_disconnect_rdma_connection() disable all
    work but disconnect_work
  smb: server: let
    {free_transport,smb_direct_disconnect_rdma_{work,connection}}() wake
    up all wait queues
  smb: server: make consitent use of spin_lock_irq{save,restore}() in
    transport_rdma.c
  smb: server: make use of ib_alloc_cq_any() instead of ib_alloc_cq()
  smb: server: let smb_direct_flush_send_list() invalidate a remote key
    first

 fs/smb/client/smbdirect.c                  | 224 +++++++++++++++------
 fs/smb/common/smbdirect/smbdirect_socket.h |  24 +++
 fs/smb/server/transport_rdma.c             | 157 ++++++++++++---
 3 files changed, 309 insertions(+), 96 deletions(-)

-- 
2.43.0


