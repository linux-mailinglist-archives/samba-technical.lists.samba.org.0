Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC492B1CB03
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NGUczztnA5N8zdxeKC70fijwcwkKlzvVZOfwmMQ1OL4=; b=ZJ1jVPoRiBI4Da5B34q8u5qSut
	MyITLb3P+xgM1Esf/21htHcIbbbHsEk+PWN3NJTmB1S3L8FTYPkWX9+FjhOpW0s0VEq3T3cdneMKq
	LM/Qaa5/zCYLfjV4wqOXYXkxcM9oBFLKidqty5tQOrFICgo8tXK2SXLLpAIghyTOFMe2039eTnrfh
	56RjarOA8SWHQm63P5MQUZr99qrFgTkB8aAgBcIvckHBtArJ98US5vmy712up4ia7NeMiWtbObdfA
	hRUr04C92vTm0eiHh2BQ5XQHGJq0iJ4HM18lcW6RQOSXS6Jaus1HKUGPizXUVvvuy7JT4uwpB/Vpg
	/YCkK1Mg==;
Received: from ip6-localhost ([::1]:55004 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji3p-00ERMm-Ab; Wed, 06 Aug 2025 17:36:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64638) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji3k-00ERMa-Pr
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=NGUczztnA5N8zdxeKC70fijwcwkKlzvVZOfwmMQ1OL4=; b=hHjO/E9NV7OKNOyvXxw/7Z8l/j
 97oI+DpM2u3Y+3EYynCJj/HltvSFv6cg7EzhPKVVRp1XcslyeN85sWdoyeFDDHTufyKd6hhgw2zFN
 ftQS9Mlif9PHPrnNJybybchtOic3t/HSt7wzbRy/w1ppbS8TdVBFZh5i7/9+qrCMLEO8WpO+ihCBu
 +galiPSBZYZRN9vRIUHzeWbv1H7QpQZh15Fh6nAai3hVJRek0l5UHfBx80SK9NjDZKXUa5Ql8cSHC
 SzkAvcSpnfEv3ZCf22SUVqwl0I8pC8V2Ti/8sa5ePK35Tv08Ppd4zlQMkwZhsBqNboP5REVXbQURJ
 BxDnVmWIStTqa8oAtN6ggb+hd1nkV3ZoJmFuTJnZT6RlZKcjSyaXOaGoBq4i4e4F44svfy1mCGJg5
 TFi051ZANyqLqbNtMSmne5WCSCplSuEi+i7vlP3jwU0jKTM7v5gBBf+xtnQBU/8W4x1W44QIr/QZS
 67A5lD/E0rQv3KnT1i6yPiaD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji3i-001OWh-1b; Wed, 06 Aug 2025 17:36:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 00/18] smb: smbdirect: more use of common structures e.g.
 smbdirect_send_io
Date: Wed,  6 Aug 2025 19:35:46 +0200
Message-ID: <cover.1754501401.git.metze@samba.org>
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

This patchset focuses on the usage of a common
smbdirect_send_io and related structures in smbdirect_socket.send_io.

Note only patches 01-08 are intended to be merged soon,
while the ksmbd patches 09-18 are only posted for
completeness (as discussed with Namjae) to get early feedback.

I used the following xfstests as regression tests:
cifs/001 generic/001 generic/002 generic/005 generic/006 generic/007 generic/010 generic/011

Between cifs.ko against ksmbd.ko via siw.ko in all combinations
with and without the patchset on each side.

Stefan Metzmacher (18):
  smb: client: remove unused enum smbd_connection_status
  smb: smbdirect: add SMBDIRECT_RECV_IO_MAX_SGE
  smb: client: make use of SMBDIRECT_RECV_IO_MAX_SGE
  smb: smbdirect: introduce struct smbdirect_send_io
  smb: client: make use of struct smbdirect_send_io
  smb: smbdirect: add smbdirect_socket.{send,recv}_io.mem.{cache,pool}
  smb: client: make use of
    smbdirect_socket.{send,recv}_io.mem.{cache,pool}
  smb: server: make use of common smbdirect_pdu.h
  smb: server: make use of common smbdirect.h
  smb: server: make use of common smbdirect_socket
  smb: server: make use of common smbdirect_socket_parameters
  smb: server: make use of smbdirect_socket->recv_io.expected
  smb: server: make use of struct smbdirect_recv_io
  smb: server: make use of smbdirect_socket.recv_io.free.{list,lock}
  smb: server: make use of smbdirect_socket.recv_io.reassembly.*
  smb: server: make use of SMBDIRECT_RECV_IO_MAX_SGE
  smb: server: make use of struct smbdirect_send_io
  smb: server: make use of
    smbdirect_socket.{send,recv}_io.mem.{cache,pool}

 fs/smb/client/smbdirect.c                  | 112 ++--
 fs/smb/client/smbdirect.h                  |  38 --
 fs/smb/common/smbdirect/smbdirect_socket.h |  54 ++
 fs/smb/server/connection.c                 |   4 +-
 fs/smb/server/connection.h                 |  10 +-
 fs/smb/server/smb2pdu.c                    |  11 +-
 fs/smb/server/smb2pdu.h                    |   6 -
 fs/smb/server/transport_rdma.c             | 742 +++++++++++----------
 fs/smb/server/transport_rdma.h             |  41 --
 9 files changed, 500 insertions(+), 518 deletions(-)

-- 
2.43.0


