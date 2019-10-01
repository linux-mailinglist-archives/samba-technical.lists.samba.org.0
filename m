Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0561BC3E3D
	for <lists+samba-technical@lfdr.de>; Tue,  1 Oct 2019 19:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rLq6NrvgWlOxafDDM+c6iexkM/ndt0VYoz1zUvZNkVA=; b=KBoCqhakiJ6H1XVS1btge6Ks1t
	7uPd/0BfSEHj8NspnbldaHbTamPb7fB/X2O7DRURAdxBBYgHtWk9z476WZPrxryAZZyxGC3Wze5xs
	zb4hwNRLE8X4KvqbUh4mfMj9NLCRnEjeFGiOkr6m/1G+gDXi+SIJux+ieeS5jQ3Y88SwAaNjyP/w+
	2UggfGj1Erqcy0i1kHxXcux8ark7NYZ2Ed+SulOfEQ0lNzh0BOlXHFJha+pWf+cvT2KCnEJsKJ6LP
	4cv5vvRvBwYyucY4A1/HSLkwZrbZQ039yRGn+oaoCiEzDFkie8fFZRBTmM7sHMInwSbWMVzlaG3Pl
	uz/TF6IQ==;
Received: from localhost ([::1]:22490 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFLg7-0006Do-M2; Tue, 01 Oct 2019 17:11:12 +0000
Received: from mx.cjr.nz ([51.158.111.142]:36306) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFLg2-0006Bv-NZ
 for samba-technical@lists.samba.org; Tue, 01 Oct 2019 17:11:08 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 32276810FF;
 Tue,  1 Oct 2019 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1569949864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLq6NrvgWlOxafDDM+c6iexkM/ndt0VYoz1zUvZNkVA=;
 b=Qy9yzP+lxlyen2JaRIpgBbCuLJCgKfdKh/xE4pjSIDxjFygcodaRC+1xZaevidGqiutC1P
 c+Q5x4zGOpDnCZBb73QZitTtz+q/WnvPt3TFRqJJ3pqaAzpGmz9WLIl5eVU5bK+qUxsMWy
 C+0DUDHyDORnnVnvpEU8MZra5nFbYbB13DjWYLkGIB4ZybOa53h3bpn/Q7qW5WSjUySiv1
 cvPUL+cwnCO9AfFv3HEWfYqYlFVO395S38mcCUuZDD7+bOEK/a7W8sTGi+4GFINJ71qhps
 7+K1WjfOmp2yhOU033d98w0YaybnZA4VsaTdikvFTRTkFcse992mvZV3/VAPgQ==
To: netdev@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, davem@davemloft.net, smfrench@gmail.com
Subject: [PATCH net-next 2/2] ipconfig: Handle CONFIG_CIFS_ROOT option
Date: Tue,  1 Oct 2019 14:10:28 -0300
Message-Id: <20191001171028.23356-3-pc@cjr.nz>
In-Reply-To: <20191001171028.23356-1-pc@cjr.nz>
References: <20191001171028.23356-1-pc@cjr.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz;
 s=dkim; t=1569949864; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLq6NrvgWlOxafDDM+c6iexkM/ndt0VYoz1zUvZNkVA=;
 b=rT1sGLVZIHXYV8QzEUAeLdTWu5trcIaeR73V1u9PPYldRbX+cU7CgX481AsJV8VTCiQH78
 EIaHbWZjclSJg/4jlMXyj+UMEY2Gwh/LpQkKJ4Jw8jW/hgGSXf4Enuev5mWH8wa3ybnPxW
 ypTefXdC7owjxY0PDM7ci46Mvawg1bpgvGl7svycZNe5RKOUliN9JNfjwcG9AgaCpHR8TH
 eWMZfFvjiOnQhBoVJO4ETCgRAozFYxao2pM2hbJgi60gTDlDjqB0SXDl/0iSPqmdu7WKiZ
 C0WT9ZrOZsNRQ9L/EcwVEV7IYPSXY2n4eZBwS3sIuUcojlVkLM+6ws3zxk3Erg==
ARC-Seal: i=1; s=dkim; d=cjr.nz; t=1569949864; a=rsa-sha256; cv=none;
 b=qkQnxVYsdUF2yZZx/AAHVudnuf6iKSr2Rx3JPDizvo/AbdY0BpnOgrc87dGPMfMDeqI084
 Iqdui4GmxSeW8xE66fUyUdrzUfEf0VJ4OJRVS1S7OxSmTw6PIzx/FsuFOTDs1Ljb39C1rE
 OgsvaCZuE7rqQPYxlG9ewU5ZKb6RZpWNWnWaEkwThiO3/Ylycx1Wl+JZMi63geU4QLpENG
 JA1lTqs+UXUL/3myQWycE64QlA+KXfBaK4Oku/Ea9Dw1sk3MpH/tT+SU+HmKzkEdgu9Ey/
 L9UEHGEmauZY7N3zr1xuxLe2qNzKGkuJjtkzubfP5bKyqmYVSyQ75R8KtZfW4w==
ARC-Authentication-Results: i=1; mx.cjr.nz;
 auth=pass smtp.auth=pc smtp.mailfrom=pc@cjr.nz
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
From: "Paulo Alcantara \(SUSE\) via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>
Cc: "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The experimental root file system support in cifs.ko relies on
ipconfig to set up the network stack and then accessing the SMB share
that contains the rootfs files.

Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
---
 net/ipv4/ipconfig.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index 9bcca08efec9..32e20b758b68 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -1483,10 +1483,10 @@ static int __init ip_auto_config(void)
 	 * missing values.
 	 */
 	if (ic_myaddr == NONE ||
-#ifdef CONFIG_ROOT_NFS
+#if defined(CONFIG_ROOT_NFS) || defined(CONFIG_CIFS_ROOT)
 	    (root_server_addr == NONE &&
 	     ic_servaddr == NONE &&
-	     ROOT_DEV == Root_NFS) ||
+	     (ROOT_DEV == Root_NFS || ROOT_DEV == Root_CIFS)) ||
 #endif
 	    ic_first_dev->next) {
 #ifdef IPCONFIG_DYNAMIC
@@ -1513,6 +1513,12 @@ static int __init ip_auto_config(void)
 				goto try_try_again;
 			}
 #endif
+#ifdef CONFIG_CIFS_ROOT
+			if (ROOT_DEV == Root_CIFS) {
+				pr_err("IP-Config: Retrying forever (CIFS root)...\n");
+				goto try_try_again;
+			}
+#endif
 
 			if (--retries) {
 				pr_err("IP-Config: Reopening network devices...\n");
-- 
2.23.0


