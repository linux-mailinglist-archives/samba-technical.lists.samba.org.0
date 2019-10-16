Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4FED9C48
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2019 23:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Rtb+2kdRn8perdldTeE4yqY1kvTunTWHiFSixuBZlIo=; b=t/k92a3A6qnkLqXdsDp9fJb540
	hoXPDSzaakeamDaQVu0Wk6pvj42o9qFYTDFCksVxHSnx1cWOypZ6Nj56TRFwTRFOM6ke/i3DZVxlb
	jCqa94pMMxY3A2R9PV6TfLdTAeh34XnMcDUSjDsUpzSTIwjYMQrHJ0ZASBlAjZjGS6baQRVkCGspe
	XTI+XUeigpG478YGy7w/ZZUdMnP/7dcOYrSQJEKLBF+cNo0TnNk2G+GfPJVX6euaJsi/zg6scLb9V
	GWiTdfPsLrK3f3c6X7+5F4ShaGYYcvyJFqIJSK9FeqhMKQeLQIk7UBfbFogXSvEPMSF2nD+9lFw/T
	eslMRQ0Q==;
Received: from localhost ([::1]:45090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKqYt-004PNj-JR; Wed, 16 Oct 2019 21:10:27 +0000
Received: from [13.77.154.182] (port=37536 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1iKqYf-004PMe-CS
 for samba-technical@lists.samba.org; Wed, 16 Oct 2019 21:10:15 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id BF51D20B7116; Wed, 16 Oct 2019 13:52:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BF51D20B7116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1571259134;
 bh=Rtb+2kdRn8perdldTeE4yqY1kvTunTWHiFSixuBZlIo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=qFIs8dpv54C9das6jYmoorkcU1WOfWMzyE/TM3h00P4otkQow6ti1I5WBN1DrUC8v
 wc6Tp40NyAoe/4bzDAjpGC+eW4V3heFmgQxPmx8UyLi2mCvnGsbXMEhxLbL8v2/K9l
 kPGS38PPSFtcPD5j83wFEL+Scqy6legGkoxmblUc=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] cifs: Don't display RDMA transport on reconnect
Date: Wed, 16 Oct 2019 13:51:50 -0700
Message-Id: <1571259116-102015-2-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
References: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
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
From: longli--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: longli@microsoft.com
Cc: longli@linuxonhyperv.com, stable@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

On reconnect, the transport data structure is NULL and its information is not
available.

Signed-off-by: Long Li <longli@microsoft.com>
Cc: stable@vger.kernel.org
---
 fs/cifs/cifs_debug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/cifs/cifs_debug.c b/fs/cifs/cifs_debug.c
index 0b4eee3bed66..efb2928ff6c8 100644
--- a/fs/cifs/cifs_debug.c
+++ b/fs/cifs/cifs_debug.c
@@ -256,6 +256,11 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 		if (!server->rdma)
 			goto skip_rdma;
 
+		if (!server->smbd_conn) {
+			seq_printf(m, "\nSMBDirect transport not available");
+			goto skip_rdma;
+		}
+
 		seq_printf(m, "\nSMBDirect (in hex) protocol version: %x "
 			"transport status: %x",
 			server->smbd_conn->protocol,
-- 
2.17.1


