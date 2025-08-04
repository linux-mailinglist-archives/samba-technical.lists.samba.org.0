Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C49B1A0E9
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CS61DGPj97lQRncfj/Xbj3wUZQbd2n896SaL3fO1Uo4=; b=u3mq8517kJHEA+WsOH+uvfubsK
	gwc6Aa5qhU4o6v6kDmZZPRiH1QYuBWDomEHAugTW3GpfT7Jsm2JLSfMhSg+0fH/eEVD1I1JxZ15We
	SYjrK1i39aQT+0m9gGaGUEMqRlthWoPzOiF6mSxLhpgcHnOu7GQLFqK0bHTcAMYH77flY1rBZOUbm
	zd0NqrlJl9lq4IMV6pGX/5dssf6MCTMg4EVA7ZPjkXAjympZpqRXl31uw9o7F2v4B8XG0FFwi4y8S
	AJKXqe+7zZoQVQyzm2GZ/YjhBFuD7bksYqEU3m2FgpWRmPSzirG+Zp6G9DwMXjdzs4lIV8rb+BvrQ
	52XUVA/w==;
Received: from ip6-localhost ([::1]:56040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu2F-00EHcp-8s; Mon, 04 Aug 2025 12:11:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25652) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2B-00EHcd-CS
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=CS61DGPj97lQRncfj/Xbj3wUZQbd2n896SaL3fO1Uo4=; b=oZmJAtWmE0hQVucr3RPXsqID61
 yL+4ADJQNl6Nx1yZI/I+grmCS+Lhm+7o2Q1uVkrq1zEqHfNySeAkHBAjPX7RwUBp2NZrA05cOfOLI
 j5OfSMzyGOIN9EPf1Q3AMRjZpWv6X03bV/jidOZc/c1mecM8k8NFODmb79fPALNETgpHhiQ8gfSrq
 iTWbHQMH/z+flB1rRRCOZ4fSQxe3DThe8S2cHuWE51ZrZOFxR0mq8oCftPe4OUuSmUlDapcePwdt5
 +NoGsmwlkdTsCA0bOcvSqy8MDlrCmV/+2Kg9lSybJT63nRYsZq7iVCdxU75Pg3mJaVlgGRg2NMzC+
 LvjGw+TLerGM7XKGxaPywt0et0PvW/xt8awhYYcAs6Rudu6DS2aWYv5KkV8wGAJZdDmPimCNO5F/Z
 rJYQcNMK4kZqke3GrDwnKNz28fPfqEdzklGSo7IK/8wiFT90dtxBpdrS/BhbkohfWDe5a3vweCXrm
 Ph76SNPwMtEeRCkEF9rGPnb9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2A-000vtZ-0S; Mon, 04 Aug 2025 12:11:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 0/5] smb:client: fix possible use after free problems
Date: Mon,  4 Aug 2025 14:10:11 +0200
Message-ID: <cover.1754308712.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

While refactoring the client and server smbdirect code I
noticed a few problems where we might hit use after free
style problems.

In order to allow backports I decided to fix the problems
before trying to move things to common code.

The server has similar problems, I'll send a separate
patchset for the server as they are independed.

Stefan Metzmacher (5):
  smb: client: let send_done() cleanup before calling
    smbd_disconnect_rdma_connection()
  smb: client: remove separate empty_packet_queue
  smb: client: make sure we call ib_dma_unmap_single() only if we called
    ib_dma_map_single already
  smb: client: let recv_done() cleanup before notifying the callers.
  smb: client: let recv_done() avoid touching data_transfer after
    cleanup/move

 fs/smb/client/cifs_debug.c |   6 +-
 fs/smb/client/smbdirect.c  | 124 ++++++++++++-------------------------
 fs/smb/client/smbdirect.h  |   4 --
 3 files changed, 42 insertions(+), 92 deletions(-)

-- 
2.43.0


