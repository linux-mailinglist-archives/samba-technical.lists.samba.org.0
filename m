Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F2DB1A106
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eora2fqI5chQvxkEuD6zk0R5R0d8Ri8Smny+KGFtbIU=; b=bY16SRpmtW02Qpl0JVZ1xKML8Y
	ZvYcJZCYH10yQrXGmg8T3rCOohazFicoR5rXoW9y1C9z6YfvBnH6ijfvjdo70XhgpWqMpbEovvZ9D
	6cu4Kg5kJGC1C3s2NCe9p2tOHfIanCXPbXkwdOlnUBHH6dnrMaaqZiluC4xy+zHflofT3Dm5GQDF8
	VyMRQk3qaA31nQvfN3oGrvR8dKQaMm4VyZHU+SSGXvi1QZpRFTRr12kZyWVFpbn9ByHmpd/x9YneG
	JTQuNGSh6a2vXAlg+D8ghOlBmvRIC6TpLJZWyTtpY1KJ/ECMldY0orw+qoqF0Z62WTPA8ByJBgcrF
	BNFPh7fQ==;
Received: from ip6-localhost ([::1]:23218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu71-00EI5Y-Bz; Mon, 04 Aug 2025 12:16:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49040) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu6x-00EI5L-Ih
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=eora2fqI5chQvxkEuD6zk0R5R0d8Ri8Smny+KGFtbIU=; b=uLTYsGOmYLRuZA7FakALmPNLCE
 zVWatNwIMhoyhk1spc1ijad6MWJOB+clHCCNe32NtUZdrvY9cpmULfrghG7VGg/aASP+85iuyXgEm
 3W6zLJ+BiOuZ6t/kFRstehfLZ2YufRs2fiQvsSbbIwGD74c+AOALyL79FH5pMSmJ3Pkff19zz8N7c
 csHA4wDORk3RF/FNwNOLNKgYeTtELUnyHwXaKGWNqyKImvGQcNG0GzpA1Y8C6Hx830CVVfU2koOY9
 x8pk4wwpFKqN12Gp0KlHzzW0iqtBBfmLPqVKwQIKp6VEAYb1691ANirwYx0RV3k8H69Xl+a7ng4VT
 +0UH1eH4F/rS48JHwvXml6Pf+08VT/hX0nuoyqdLby4N1I6yNNlLqaoFGWPB9t1uW2YA8bgec6Q2T
 Qfu/tZyFl5s9IXvnql5uanJE9PCtjbqQVah96RSfdnsGSERaEiQX4mxoC6CfNZnY74uPQCy2qABL7
 3E9ttXKhX2+93vmPn7FN0+c5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu6w-000wCL-2P; Mon, 04 Aug 2025 12:16:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 0/4] smb:server: fix possible use after free problems
Date: Mon,  4 Aug 2025 14:15:49 +0200
Message-ID: <cover.1754309565.git.metze@samba.org>
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

While refactoring the client and server smbdirect code I
noticed a few problems where we might hit use after free
style problems.

In order to allow backports I decided to fix the problems
before trying to move things to common code.

The client has similar problems, I've sent a separate
patchset for the client already.

Stefan Metzmacher (4):
  smb: server: remove separate empty_recvmsg_queue
  smb: server: make sure we call ib_dma_unmap_single() only if we called
    ib_dma_map_single already
  smb: server: let recv_done() consitently call
    put_recvmsg/smb_direct_disconnect_rdma_connection
  smb: server: let recv_done() avoid touching data_transfer after
    cleanup/move

 fs/smb/server/transport_rdma.c | 97 ++++++++++++----------------------
 1 file changed, 35 insertions(+), 62 deletions(-)

-- 
2.43.0


