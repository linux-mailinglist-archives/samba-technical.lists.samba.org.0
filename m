Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002C6917E3
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 06:12:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=svMXZmKnAy3jAHM24tFPWkE+bAbyGPIQbc/VU3rBGQk=; b=x5s11fo14t4eLHIuwbAKcDxnBZ
	amJon6b0jliV23tE5VdW1zMKFMigcraezbrqWuG+nFpmOuzT2uhJTsK3bq6tSW76iLnPEf0IiriRu
	P47BsAgbQw6JtiAk7udl9AvZxQFqc1UVYXMiojS6WoYXjZjH6YiV1iyin6Nvl9r+vv2mUI87oPBHo
	TUKpLTp1unBNw7U5882iwj9ivoCHuxHrbzkxnXZHrOyApe2K37j8KRR5RFujTc2k+Hx++1TO/NyWH
	RzpeQ7igbP/QNGJ8Wvm22D6YGOSfY/Nvph1slYML73RWflguoXkghKn2CwK5AjO5Xan6JgXMcaivm
	qlCUa9Tg==;
Received: from ip6-localhost ([::1]:57406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQLhr-00Ae5a-EM; Fri, 10 Feb 2023 05:12:19 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:44790) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQLhn-00Ae5R-1u
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 05:12:17 +0000
Received: by mail-lf1-x12a.google.com with SMTP id w11so6522294lfu.11
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 21:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=svMXZmKnAy3jAHM24tFPWkE+bAbyGPIQbc/VU3rBGQk=;
 b=akg2CSicawqIzK2eRJ3Po+pgNkPkX38j0h/VD2ikP9I4yW/TCjmZG4fvcUaGTfCRhA
 wyEUi1vqU/7p57FvfPuTMCooePkY0e7bpGCF24iooswj/yspxuLoQWwpddk+obHzDMkd
 9PUIdIFajvdpTTt1riwk+rML0+BUWR7R71p5Nv41zQXP4HJKV6culkF9jrFmW9F5taWo
 9aO9GmaXM5z2VWRR5r3zt3In8eQ1OZQMKki2/400ClYoeCpRuxS90uUZVj97mnEPO2r2
 cf341ou9XhN6GMDWRGIon/97QvDQx/bMIGtq20DDIdj0mCoI4u+HFZeV8kHsqMxKuXr6
 wHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=svMXZmKnAy3jAHM24tFPWkE+bAbyGPIQbc/VU3rBGQk=;
 b=uain/IYtz3KbaERs1IuzlrOLo1RJ2j+AiFSyTfuBvb1m2Z88NR1sW2BMAwEbRmhD+Q
 LlbztKE7nzS9Y2iZ/IGFgUPf49cx7pCvcJLZISBQk+xGx6MC1gf3oLu47pX9oUlElZz1
 wwfd3tlWahISgir7lnW1AwWIXTXCK4vfgBNk3zVGPVcPIkELpTIz7fk4hJwcTX0rSjyq
 EUGyRBnkwJllYYHIy/WSi/W0SaA4xZ8cUb9jMPdpb4/jUcITTus/nBaJIhoC8+2tId28
 RyQrU4x8H/d7avd/Rl2OIblt0ewaWwofVU880s+Ds+BKZ1GxK2CNCoL6bDABKjjnS0a7
 TZvQ==
X-Gm-Message-State: AO0yUKXZQh4Pa9SZ+1++Ocd0A17bEMLFqxmo8uydysAjYOUcWl7Lv9/w
 FI307aVJWUiIXUTUPqWy5nW58CqQVvpdCue+JgOohTb5
X-Google-Smtp-Source: AK7set8m+gNdgyfXC+nYpt7s8XKS5uXgY/DghNmgMFnuaS/tptwlBNtcglc+zckGsrDFbq3kFwPXxmb0UErv78FRVqY=
X-Received: by 2002:ac2:4a99:0:b0:4d8:6e21:817f with SMTP id
 l25-20020ac24a99000000b004d86e21817fmr2422572lfp.268.1676005933134; Thu, 09
 Feb 2023 21:12:13 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 9 Feb 2023 23:12:02 -0600
Message-ID: <CAH2r5mu5MhzONuh8HtnrDBrSzkz3_WeaTaOQ-tFiQZ_j4oUOdA@mail.gmail.com>
Subject: "smb ports" smb.conf option
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Since Linux client ("port=" mount option) and Samba server ("smb
ports=" smb.conf option) can use ports other than 445 - has there been
a commonly used alternative (e.g. to work around port 445 blockage) or
has the port chosen always been random?

-- 
Thanks,

Steve

