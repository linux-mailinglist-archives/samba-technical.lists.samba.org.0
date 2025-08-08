Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD78B1ED39
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 18:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=i4Pvjp+MJ7/cVrnspLr5xjJdmUHVkyVFKIm5pjL3358=; b=399V/o0JuWkqKujO5msxmViQGS
	6ljDthOb+eoF/75x4/Zq5INHvTj5Soues40TMp+0ggWmK4AIZrZO0lDsZh/zTeCsyLkOoXvKDG1n9
	09KWYfWVvwHUyoT7J0ZvgN/RD2GfHozbSW1bgUvX9t+bwBpPLPR/xUrgVJJIzH16du5EVOlbinZ0C
	qok0DZmj4p2rxe2PnfrW2i4fETwmbMNtMpxvljW8x5GMhevcvFZ6lJBcn+xnPy13a8tLusOb15L0m
	VtHvWCcRi98LFDNeJAoWyrie6CqrJg/wOi6OgxX6lybOrFJ2fjcwkIQJ4NiDrfCL7LRMXFuRJsaHT
	o7MzU2sg==;
Received: from ip6-localhost ([::1]:35282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukQGZ-00Eho9-IB; Fri, 08 Aug 2025 16:48:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40818) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQGV-00Eho2-ET
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 16:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=i4Pvjp+MJ7/cVrnspLr5xjJdmUHVkyVFKIm5pjL3358=; b=iUoytrmI3DYS5JI/jK3a2Sub5W
 xcF3aADNZ+Urz5w64MSEt3wT3255oK6Ee7DGlZRMz6NiWFhefe7nuguTR61byXCx15nC2hmadAQgn
 zmnEcCOLyKg6Snl+OkWVUJl47un++fNdAzzvdCA6ny+2Ie9IWKMTVNkwnVM/Uf2lN86MMea+NIrQq
 UfiMxptMb5zqDq0YtbI8tkLOqUwUXvbxgsc0vBbquh8NCUr3TOP3/q9R1/h1QYsh1z5ZeV4lE2a+w
 e/udUcgITJJD7+/e0mqOdptpGcQpWh9uqjW+Yi7ra7f6Ai8/kOcGvMvm7P6k5JTMWz0Yd/e8FY4cP
 D33q9BZ3UzTR5X98FhvhAjy2j8Ybg3SGLzt+iR3VMOxXO9ngm3FJPvSrcl+HHE7Cd+ywIRjWpUF+L
 LaYBiQfBQX5yDqwNzhQv3AKsym17XrrXfTbnibYbBxVgBI59vhtR4ME46fTj7j8n1pdA6ydwLLs+J
 qArA2V6yX+dTosI1REOVucXG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQGU-001qLk-0a; Fri, 08 Aug 2025 16:48:22 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 0/9] smb: client/smbdirect: connect bug fixes/cleanups and
 smbdirect_socket.status_wait
Date: Fri,  8 Aug 2025 18:48:08 +0200
Message-ID: <cover.1754671444.git.metze@samba.org>
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

V3:
smbd_disconnect_rdma_work() needed to handle more
than SMBDIRECT_SOCKET_CONNECTED in order to call
rdma_disconnect.

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

 fs/smb/client/smbdirect.c                  | 167 +++++++++++++++------
 fs/smb/client/smbdirect.h                  |   8 -
 fs/smb/common/smbdirect/smbdirect_socket.h |  15 +-
 3 files changed, 134 insertions(+), 56 deletions(-)

-- 
2.43.0


