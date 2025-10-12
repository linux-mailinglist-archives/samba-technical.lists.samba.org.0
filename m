Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A1BD0A8C
	for <lists+samba-technical@lfdr.de>; Sun, 12 Oct 2025 21:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=C3xK4o2im5CSEngKJSj5dBitw+XSS8ccMgiHuGRZ1JU=; b=dBkBkVK5rg/OxD773SSA6Dj6zC
	Wwf7xjt6t3MP0YitFwPCELZTHFZ7rGw04W1d+RkCO3jzFvxKjVoHiZYb63WWvB8tZu4gHU5GYqQM+
	5bvAFxE1qmePkiv870JSV3rHWz1zf2UjOPrxeiVMhV6W+7oTudk3T15l30sTTIFzj4e6IDqIDwZje
	a5rErK8uu3ymDYE9NlaH86u13+ACAAcDhJHrv3gFyihDNXBJwScqF3EV+mcyme182oIF52oJ3xjsh
	z6/tB/xnfD0T5TAp8VzkVkpUl0zkp8sMH92rup5k+g5Bfts4fneL9aJA+l5LbJ0wie9JhXotBMquw
	+NxkT8mQ==;
Received: from ip6-localhost ([::1]:34918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v81Sy-007cIK-1J; Sun, 12 Oct 2025 19:10:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11622) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81Ss-007cID-Vu
 for samba-technical@lists.samba.org; Sun, 12 Oct 2025 19:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=C3xK4o2im5CSEngKJSj5dBitw+XSS8ccMgiHuGRZ1JU=; b=yM4ZEo3+pVYeLy5IHReaJ0P3Xl
 EWB//7MgQsH7F72DKlAVGQwCqMoT/4FCpLpUNZp4DRSLX+7WV639rpwdPxb6EU70kn+hG/E4CWWvZ
 AtpR3Z69WqprS3R+t4KZum8lvAViwlNkNgN6LeHzQqbX0N1m3ZEkaThQ0dOy9yP3htebkbcf2w0ed
 Hj2fL/OIfSquaMlFo+3nm/p0+GvEvVc/63cTPp7uvVYILLjPCoFoSa06HxZupTiAk0QehMWSQLUdj
 MguilAml+QQr16q0ryjFHnJUg343VShrTAPi4r9un6kjTlLHIs5iMEPtkLNftWdBvZ0+UljdH1vXR
 omyRrNLW8izEOhy7hdyUpbwj32lJrWbdtTEp0zYmQJUz9OMhJcY9ZYXApgjuwn78cD0YDST67RENg
 MFQNBR/+qj6CV9Q7NqkyzUOYvgcWWggZ0uaAw5Q+v0ix9HiBbKRqu2sytyAODPyX6tzz4efS8n9jy
 he6VAdalxiJvmMw/wnOk8q0X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81Sr-008nzT-1L; Sun, 12 Oct 2025 19:10:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 00/10] improve smbdirect_mr_io lifetime
Date: Sun, 12 Oct 2025 21:10:20 +0200
Message-ID: <cover.1760295528.git.metze@samba.org>
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

these patches improve and simplify our handling of
smbdirect_mr_io structures and their lifetime.

smbd_register_mr() returns a pointer to struct smbdirect_mr_io
and smbd_deregister_mr() gives the pointer back.

But currently the memory itself is managed by the connection
(struct smbdirect_socket) and smbd_destroy() has a strange
wait loop in order to wait for smbd_deregister_mr() being
called. It means code in smbd_destroy() is aware of
the server mutex in the generic smb client handling above
the transport layer.

These patches do some cleanups and fixes before changing
the logic to use a kref and a mutex in order to allow
smbd_deregister_mr() being called after smbd_destroy()
as the memory of smbdirect_mr_io will stay in memory
but will be detached from the connection.

This makes the code independent of cifs_server_[un]lock()
and will allow us to move more smbdirect code into common
functions (shared between client and server).

I think these should go into 6.18.

Stefan Metzmacher (10):
  smb: smbdirect: introduce smbdirect_mr_io.{kref,mutex} and
    SMBDIRECT_MR_DISABLED
  smb: client: change smbd_deregister_mr() to return void
  smb: client: let destroy_mr_list() call list_del(&mr->list)
  smb: client: let destroy_mr_list() remove locked from the list
  smb: client: improve logic in allocate_mr_list()
  smb: client: improve logic in smbd_register_mr()
  smb: client: improve logic in smbd_deregister_mr()
  smb: client: call ib_dma_unmap_sg if mr->sgt.nents is not 0
  smb: client: let destroy_mr_list() call ib_dereg_mr() before
    ib_dma_unmap_sg()
  smb: client: let destroy_mr_list() keep smbdirect_mr_io memory if
    registered

 fs/smb/client/smbdirect.c                  | 312 ++++++++++++++-------
 fs/smb/client/smbdirect.h                  |   2 +-
 fs/smb/common/smbdirect/smbdirect_socket.h |  11 +-
 3 files changed, 224 insertions(+), 101 deletions(-)

-- 
2.43.0


