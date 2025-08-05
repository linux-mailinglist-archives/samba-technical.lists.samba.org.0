Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDDB1B819
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=00LNmLviPOmuiNw6apWNFzSfq3PsRV1SJJmPYDRheyg=; b=pxUYj2TpfQRhI4hsCqqPu1Yf2I
	mSCgYH35l2DDNEtPZzr8TBF573MpqSKt7hK00Hi62cSJw1FkxIcE441myxLb4OE2k3PLvz1W4jfY5
	9u/vl+7taalphWdBmd/K3tZnVA16CUV3hAapHRJTgj/mozwVZWQ8cmv3HXtOwjqY5THwWMZA/ZFz6
	YV/nv4hZ6HNfRe3MXaDYsoyyKErhmCr3DcEl3xCFFYlNVnstK2bjHGswmePC9yNt3It6z3zidUVTK
	Onn53dd2wrI0u3JUAI8FQA6AG5M96hH3OXpYJ+ZtfSv7M8tDAmIwfujFvXvR1aNPaSFGfcjUxPRF+
	upEiYW+w==;
Received: from ip6-localhost ([::1]:22648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKGa-00EMtE-1w; Tue, 05 Aug 2025 16:11:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44312) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKGW-00EMt7-8Q
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=00LNmLviPOmuiNw6apWNFzSfq3PsRV1SJJmPYDRheyg=; b=UhKpOt3MZun9wYxhN8iBAGbvNI
 cjKr6ISVsHP4mP0UHSa/WtB7iUL4QO2LENnG1E4ipQjFsBxjKPKzAx5hW+smZmNt0MHwKwoX7v1ea
 yUSeNSmzaSUI6fkdn9j+ZKz07/b2vDL6DB50opYzpRWYXy2+ZjHjqJm/EPnz6kmfbmxkNBt3J01AL
 fFA7UPG1lfmEv6fACKA1g7aoAudVbKX9x5RVgHxTU9bL+SY5SDrkVP7wF423fsMd4yr4x4e6EUA8N
 mWtFXd3gL1Q5QJJaKoX67iAZDnM2WshxqqOqqLvoBjlapSlIhbBfqAXBbZv6VqnHGp9wQkZgBrsV2
 CxO3WU6BYZ09LvLOxJU8ZONZr1Om2pfJWe9mv28YcPnj2JGJBiylMMbjCkVTiZI+IH7JGSG5bWMGF
 I4JZdTAQcnVVXlb9g4b10Lb0Akjr1DtYfaIV6/m1dq6KquPTUHN32grdxtTC2RP80aO8wQeTYJeip
 sJn9INlST3FI0s8Te8x824mm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKGV-0019Yf-18; Tue, 05 Aug 2025 16:11:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 00/17] smb: smbdirect: more use of common structures
Date: Tue,  5 Aug 2025 18:11:28 +0200
Message-ID: <cover.1754409478.git.metze@samba.org>
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

this is the next step towards a commin smbdirect layer
between cifs.ko and ksmbd.ko, with the aim to provide
a socket layer for userspace usage at the end of the road.

This patchset focuses on the usage of a common
smbdirect_recv_io and related structures in smbdirect_socket.recv_io.

Note only patches 01-09 are intended to be merged soon,
while the ksmbd patches 10-17 are only posted for
completeness (as discussed with Namjae) to get early feedback.

I used the following xfstests as regression tests:
cifs/001 generic/001 generic/002 generic/005 generic/006 generic/007 generic/010 generic/011

Between cifs.ko against ksmbd.ko via siw.ko in all combinations
with and without the patchset on each side.

Stefan Metzmacher (17):
  smb: client: remove unused
    smbd_connection->fragment_reassembly_remaining
  smb: smbdirect: introduce smbdirect_socket.recv_io.expected
  smb: client: make use of smbdirect_socket->recv_io.expected
  smb: smbdirect: introduce struct smbdirect_recv_io
  smb: client: make use of struct smbdirect_recv_io
  smb: smbdirect: introduce smbdirect_socket.recv_io.free.{list,lock}
  smb: client: make use of smb:
    smbdirect_socket.recv_io.free.{list,lock}
  smb: smbdirect: introduce smbdirect_socket.recv_io.reassembly.*
  smb: client: make use of smbdirect_socket.recv_io.reassembly.*
  smb: server: make use of common smbdirect_pdu.h
  smb: server: make use of common smbdirect.h
  smb: server: make use of common smbdirect_socket
  smb: server: make use of common smbdirect_socket_parameters
  smb: server: make use of smbdirect_socket->recv_io.expected
  smb: server: make use of struct smbdirect_recv_io
  smb: server: make use of smbdirect_socket.recv_io.free.{list,lock}
  smb: server: make use of smbdirect_socket.recv_io.reassembly.*

 fs/smb/client/cifs_debug.c                 |  10 +-
 fs/smb/client/smbdirect.c                  | 203 +++----
 fs/smb/client/smbdirect.h                  |  47 --
 fs/smb/common/smbdirect/smbdirect_socket.h |  64 +++
 fs/smb/server/connection.c                 |   4 +-
 fs/smb/server/connection.h                 |  10 +-
 fs/smb/server/smb2pdu.c                    |  11 +-
 fs/smb/server/smb2pdu.h                    |   6 -
 fs/smb/server/transport_rdma.c             | 608 +++++++++++----------
 fs/smb/server/transport_rdma.h             |  41 --
 10 files changed, 505 insertions(+), 499 deletions(-)

-- 
2.43.0


